import 'package:space_gen/src/quirks.dart';
import 'package:space_gen/src/render/render_tree.dart';
import 'package:space_gen/src/render/templates.dart';

/// A maximal Dart identifier: `[a-zA-Z_$]` head, `[\w$]*` tail.
final _identifierPattern = RegExp(r'[a-zA-Z_$][\w$]*');

/// [ModelHelpers.all] as a set, for O(1) membership while scanning.
final Set<String> _helperNames = ModelHelpers.all.toSet();

/// A `[Bracketed]` doc-comment reference. The analyzer resolves these,
/// so they count as uses of an import just like code does.
///
/// Whitespace inside the brackets disqualifies it: a real reference is
/// a single identifier chain (`[Foo]`, `[Foo.bar]`), never a phrase.
/// What phrases are is markdown link labels — github writes `[Link
/// header](https://…)` and spacetraders `[Market Overview page](…)`,
/// where `Link` and `Market` also happen to be model class names. The
/// analyzer resolves the leading word of those and so counts the import
/// as used, which is why `dart fix` kept two imports nothing references.
/// Requiring a whitespace-free reference drops them without putting any
/// genuine one at risk.
final _docReferencePattern = RegExp(r'\[([^\]\s]+)\]');

/// A string literal or a line comment: the two spans of a rendered body
/// that must not be read as ordinary code.
///
/// One pattern for both, because each is what stops the other from being
/// misread — the leftmost match wins, so in `Uri.parse('https://x')` the
/// quote comes first and the `//` is part of the string, while in
/// `/// don't` the `//` comes first and the apostrophe never opens a
/// string.
///
/// Block comments are deliberately absent: the generator emits none, and
/// every `/*` in the tracked specs' output is a glob inside a `///`
/// line, which the comment branch already consumes. Should one ever
/// appear its prose would be tokenized as code, which over-keeps an
/// import — a lint, never a broken build.
final _stringOrLineComment = RegExp(
  // Raw strings first: their backslash is literal, so it must not be
  // read as escaping the closing quote.
  r"""r'[^'\n]*'|r"[^"\n]*"|"""
  // Then ordinary strings, where a backslash does escape.
  r"""'(?:\\.|[^'\\\n])*'|"(?:\\.|[^"\\\n])*"|"""
  // Then line comments, which run to the end of the line.
  r'//[^\n]*',
);

/// The `[Bracketed]` references in [comment] — the only part of it that
/// can name a type. Space-prefixed so that replacing a comment cannot
/// fuse it with the code before it (`foo//[Bar]` must not become
/// `fooBar`).
String _docReferencesIn(String comment) =>
    ' ${_docReferencePattern.allMatches(comment).map((m) => m[1]!).join(' ')}';

/// [body] with comment prose removed, keeping the parts that can name a
/// Dart identifier.
///
/// A comment survives only as its `[Bracketed]` references. Code and
/// string literals are kept verbatim: a string can carry an identifier
/// through interpolation (`'${Foo.bar}'`), and reproducing Dart's
/// interpolation grammar to find out buys nothing, since keeping an
/// extra identifier only ever keeps an extra import.
///
/// Strings are matched only so the scan can skip past them.
/// `Uri.parse('https://example.com/x')` embeds a `//` that a
/// string-blind scan would read as starting a comment, discarding the
/// real code that follows it on that line. That is the one direction
/// this must never fail in: dropping code loses a genuine reference,
/// and losing a reference drops a needed import and breaks compilation.
String stripComments(String body) =>
    body.replaceAllMapped(_stringOrLineComment, (match) {
      final text = match[0]!;
      return text.startsWith('//') ? _docReferencesIn(text) : text;
    });

/// Every whole-identifier token appearing in [code], which callers pass
/// through [stripComments] first.
///
/// Used to prune an emitted file's imports down to the symbols it
/// actually names: an import is kept only when its type/sentinel token
/// is in this set. Tokenizing (rather than `code.contains(name)`)
/// avoids substring false positives — the same whole-identifier
/// discipline [_referencedModelHelpers] relies on.
///
/// Taking stripped code rather than the raw body is what makes comment
/// prose not count. Spec descriptions routinely repeat a type's name in
/// English ("GitHub Enterprise Cloud", "Register New Agent"), which kept
/// 23 imports across the tracked specs that the file never referenced.
Set<String> referencedIdentifiers(String code) =>
    _identifierPattern.allMatches(code).map((m) => m[0]!).toSet();

/// The subset of [ModelHelpers.all] that [code] references as whole
/// identifiers. [code] has already been through [stripComments]: a
/// helper named in prose is not a call, and pulling an uncalled helper
/// into `model_helpers.dart` is exactly the dead-code problem below.
///
/// We tokenize [code] into identifiers in a single pass and match each
/// token against [_helperNames] by exact equality. A plain
/// `body.contains(name)` would over-match helper names that are
/// prefixes of others — `maybeParseDateTime` contains `maybeParseDate`,
/// `maybeParseUriTemplate` contains `maybeParseUri` — so a body that
/// calls only the longer helper would drag the shorter, never-called
/// one into `model_helpers.dart` as a dead function: uncovered lines
/// that fail the consuming package's coverage gate. Comparing whole
/// tokens makes that impossible by construction.
Set<String> _referencedModelHelpers(String code) {
  final found = <String>{};
  for (final match in _identifierPattern.allMatches(code)) {
    final token = match[0]!;
    if (_helperNames.contains(token)) found.add(token);
  }
  return found;
}

/// Which imports a rendered schema body needs beyond the schemas it
/// references, plus which `model_helpers.dart` helpers the body calls
/// (used to prune unused helpers from the shared file).
///
/// Today we derive this from the rendered body by scanning its
/// identifier tokens (see [_referencedModelHelpers]). The long-term
/// plan is for the rendering pipeline in render_tree.dart to populate
/// this directly as it emits helper calls — the [importsFor] interface
/// will not change.
class SchemaUsage {
  const SchemaUsage({
    this.usesMetaAnnotations = false,
    this.usesValidationExtensions = false,
    this.modelHelpers = const {},
  });

  /// Derives usage by inspecting a rendered body.
  factory SchemaUsage.fromBody(String body) =>
      SchemaUsage.fromCode(stripComments(body));

  /// Derives usage from a body already reduced by [stripComments].
  factory SchemaUsage.fromCode(String code) => SchemaUsage(
    usesMetaAnnotations: code.contains('@immutable'),
    usesValidationExtensions: _validationCallPattern.hasMatch(code),
    modelHelpers: _referencedModelHelpers(code),
  );

  /// Matches any `validateXxx` extension-method call. The
  /// `api_exception.dart` file declares them as extensions on
  /// `String` / `num` / `List<T>`; a body that calls one needs to
  /// import that file.
  static final _validationCallPattern = RegExp(
    r'\.validate(Maximum|Minimum|MaximumLength|MinimumLength|Pattern|'
    'ExclusiveMaximum|ExclusiveMinimum|MultipleOf|MaximumItems|'
    'MinimumItems|UniqueItems)'
    r'\b',
  );

  final bool usesMetaAnnotations;

  /// True when the body calls any `validateXxx` extension method.
  /// Drives the `api_exception.dart` import.
  final bool usesValidationExtensions;

  /// The set of `model_helpers.dart` identifiers referenced by the
  /// rendered body. A subset of [ModelHelpers.all].
  final Set<String> modelHelpers;

  bool get usesModelHelpers => modelHelpers.isNotEmpty;

  /// Imports required by the body itself. Package-local imports are
  /// resolved against [packageName].
  Iterable<Import> importsFor(String packageName) sync* {
    if (usesMetaAnnotations) yield const Import(Libraries.meta);
    if (usesModelHelpers) {
      yield Import.path('package:$packageName/model_helpers.dart');
    }
    if (usesValidationExtensions) {
      yield Import.path('package:$packageName/api_exception.dart');
    }
  }
}

/// Which imports a rendered api body needs beyond the schemas it
/// references, plus which `model_helpers.dart` helpers the body calls.
class ApiUsage {
  const ApiUsage({
    this.usesMetaAnnotations = false,
    this.modelHelpers = const {},
  });

  factory ApiUsage.fromBody(String body) =>
      ApiUsage.fromCode(stripComments(body));

  /// Derives usage from a body already reduced by [stripComments].
  factory ApiUsage.fromCode(String code) => ApiUsage(
    usesMetaAnnotations: code.contains('@immutable'),
    modelHelpers: _referencedModelHelpers(code),
  );

  /// True when the body emits `@immutable` (multi-status response
  /// wrappers do; the legacy single-return path does not). Drives the
  /// `package:meta/meta.dart` import.
  final bool usesMetaAnnotations;

  /// The set of `model_helpers.dart` identifiers referenced by the
  /// rendered body. A subset of [ModelHelpers.all].
  final Set<String> modelHelpers;

  bool get usesModelHelpers => modelHelpers.isNotEmpty;

  Iterable<Import> importsFor(String packageName) sync* {
    if (usesMetaAnnotations) yield const Import(Libraries.meta);
    if (usesModelHelpers) {
      yield Import.path('package:$packageName/model_helpers.dart');
    }
  }
}

/// A rendered schema body paired with the usage of that body.
class RenderedSchema {
  /// Scans [body] once: [code] and [usage] are both derived from that
  /// single pass, which is also what keeps them consistent with each
  /// other.
  factory RenderedSchema.fromBody(String body) {
    final code = stripComments(body);
    return RenderedSchema._(
      body: body,
      code: code,
      usage: SchemaUsage.fromCode(code),
    );
  }

  const RenderedSchema._({
    required this.body,
    required this.usage,
    required this.code,
  });

  /// What gets written to the file.
  final String body;

  /// [body] reduced to the parts that can name a Dart identifier — what
  /// import decisions are made against. See [stripComments].
  final String code;

  final SchemaUsage usage;
}

/// A rendered api body paired with the usage of that body.
class RenderedApi {
  /// Scans [body] once; see [RenderedSchema.fromBody].
  factory RenderedApi.fromBody(String body) {
    final code = stripComments(body);
    return RenderedApi._(
      body: body,
      code: code,
      usage: ApiUsage.fromCode(code),
    );
  }

  const RenderedApi._({
    required this.body,
    required this.usage,
    required this.code,
  });

  /// What gets written to the file.
  final String body;

  /// [body] reduced to the parts that can name a Dart identifier. See
  /// [stripComments].
  final String code;

  final ApiUsage usage;
}

/// Context for rendering the spec.
class SchemaRenderer {
  /// Create a new context for rendering the spec.
  SchemaRenderer({required this.templates, this.quirks = const Quirks()});

  /// The provider of templates.
  final TemplateProvider templates;

  /// The quirks to use for rendering.
  final Quirks quirks;

  /// The type of the json object passed to fromJson.
  String get fromJsonJsonType =>
      quirks.dynamicJson ? 'dynamic' : 'Map<String, dynamic>';

  /// Renders a schema, does not render the imports.
  RenderedSchema renderSchema(RenderSchema schema) {
    if (!schema.createsNewType) {
      throw StateError('No code to render non-newtype: $schema');
    }
    final template = switch (schema) {
      RenderEnum() => 'schema_enum',
      RenderObject() => 'schema_object',
      RenderString() => 'schema_string_newtype',
      RenderInteger() || RenderNumber() => 'schema_number_newtype',
      RenderPod() => 'schema_pod_newtype',
      RenderOneOf() => 'schema_one_of',
      RenderEmptyObject() => 'schema_empty_object',
      RenderSchema() => throw StateError('No code to render $schema'),
    };
    final body = templates
        .loadTemplate(template)
        .renderString(schema.toTemplateContext(this));
    return RenderedSchema.fromBody(body);
  }

  String renderEndpoints({
    required String? description,
    required String className,
    required List<Endpoint> endpoints,
    String? removePrefix,
  }) {
    final endpointsContext = endpoints
        .map((e) => e.toTemplateContext(this, removePrefix: removePrefix))
        .toList();
    return templates.loadTemplate('api').renderString({
      'api_doc_comment': createDocCommentFromParts(body: description),
      'className': className,
      'endpoints': endpointsContext,
    });
  }

  /// Renders an api, does not render the imports.
  RenderedApi renderApi(Api api) {
    final body = renderEndpoints(
      description: api.description,
      className: api.className,
      endpoints: api.endpoints,
      removePrefix: api.removePrefix,
    );
    return RenderedApi.fromBody(body);
  }
}
