import 'package:space_gen/src/quirks.dart';
import 'package:space_gen/src/render/render_tree.dart';
import 'package:space_gen/src/render/templates.dart';

/// A maximal Dart identifier: `[a-zA-Z_$]` head, `[\w$]*` tail.
final _identifierPattern = RegExp(r'[a-zA-Z_$][\w$]*');

/// [ModelHelpers.all] as a set, for O(1) membership while scanning.
final Set<String> _helperNames = ModelHelpers.all.toSet();

/// Every whole-identifier token appearing in [body].
///
/// Used to prune an emitted file's imports down to the symbols it
/// actually names: an import is kept only when its type/sentinel token
/// is in this set. Tokenizing (rather than `body.contains(name)`)
/// avoids substring false positives — the same whole-identifier
/// discipline [_referencedModelHelpers] relies on. Keeping an import on
/// *any* appearance (including doc comments) is deliberately
/// conservative: it can never drop a genuinely-used import, so it can
/// never break compilation.
Set<String> referencedIdentifiers(String body) =>
    _identifierPattern.allMatches(body).map((m) => m[0]!).toSet();

/// The subset of [ModelHelpers.all] that [body] references as whole
/// identifiers.
///
/// We tokenize [body] into identifiers in a single pass and match each
/// token against [_helperNames] by exact equality. A plain
/// `body.contains(name)` would over-match helper names that are
/// prefixes of others — `maybeParseDateTime` contains `maybeParseDate`,
/// `maybeParseUriTemplate` contains `maybeParseUri` — so a body that
/// calls only the longer helper would drag the shorter, never-called
/// one into `model_helpers.dart` as a dead function: uncovered lines
/// that fail the consuming package's coverage gate. Comparing whole
/// tokens makes that impossible by construction.
Set<String> _referencedModelHelpers(String body) {
  final found = <String>{};
  for (final match in _identifierPattern.allMatches(body)) {
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
  factory SchemaUsage.fromBody(String body) {
    return SchemaUsage(
      usesMetaAnnotations: body.contains('@immutable'),
      usesValidationExtensions: _validationCallPattern.hasMatch(body),
      modelHelpers: _referencedModelHelpers(body),
    );
  }

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

  factory ApiUsage.fromBody(String body) => ApiUsage(
    usesMetaAnnotations: body.contains('@immutable'),
    modelHelpers: _referencedModelHelpers(body),
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
  const RenderedSchema({required this.body, required this.usage});
  final String body;
  final SchemaUsage usage;
}

/// A rendered api body paired with the usage of that body.
class RenderedApi {
  const RenderedApi({required this.body, required this.usage});
  final String body;
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
    return RenderedSchema(body: body, usage: SchemaUsage.fromBody(body));
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
    return RenderedApi(body: body, usage: ApiUsage.fromBody(body));
  }
}
