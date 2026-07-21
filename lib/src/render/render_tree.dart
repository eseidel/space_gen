import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:space_gen/src/dispatch.dart';
import 'package:space_gen/src/logger.dart';
import 'package:space_gen/src/naming.dart';
import 'package:space_gen/src/parse/spec.dart' show StatusCodeRange;
import 'package:space_gen/src/query_encoding.dart';
import 'package:space_gen/src/quirks.dart';
import 'package:space_gen/src/render/dart_expression.dart';
import 'package:space_gen/src/render/dart_type.dart';
// Any code that depends on SchemaRenderer probably should be moved out
// of this file and into the schema_renderer.dart file.
import 'package:space_gen/src/render/schema_renderer.dart';
import 'package:space_gen/src/resolver.dart';
import 'package:space_gen/src/string.dart';
import 'package:space_gen/src/types.dart';

/// A Dart expression that is a single bare identifier — no member
/// access, call, or operator — so it can be interpolated without braces
/// (`'$x'` rather than `'${x}'`).
/// Coerces [expr] — the wire value of [schema] — to a `String`, adding
/// `.toString()` only when the value isn't already one. Query/header
/// params must hand `String`s to the client; calling `.toString()` on a
/// value that is already a `String` (raw strings, dateTime/date/uri
/// pods that serialize to `String`, string enums) is a
/// `noop_primitive_operations` lint.
DartExpression _stringifyWireValue(RenderSchema schema, DartExpression expr) =>
    schema.jsonStorageDartType == DartType.string
    ? expr
    : DartMethodCall(target: expr, name: 'toString');

String avoidReservedWord(String value) {
  if (isReservedWord(value)) {
    return '${value}_';
  }
  return value;
}

/// `Map<String, dynamic>` — the JSON wire type of an arbitrary object. The
/// storage type for objects, maps, and object-shaped composites.
final _jsonWireMap = DartType.map(DartType.string, DartType.dynamic_);

/// The generated `Date` value class (`lib/date.dart`) that every `format: date`
/// field renders as. A project type, not an SDK one, so it's a plain name.
const _dateType = DartType('Date');

Never _unimplemented(String message, JsonPointer pointer) {
  throw UnimplementedError('$message at $pointer');
}

/// Convert a spec-side identifier (enum value, property name, parameter
/// name) into a legal Dart identifier. [preserveCase] preserves the
/// input's original casing after sanitization — only enum values should
/// set this (under the `screamingCapsEnums` quirk), so SCREAMING_CAPS
/// enum constants survive. Everything else gets camelCased so
/// snake_case spec-side names like `api_key` don't leak into generated
/// parameter/property identifiers.
String variableSafeName(
  Quirks quirks,
  String jsonName, {
  bool preserveCase = false,
}) {
  var escapedName = jsonName.replaceAll(' ', '_');
  escapedName = escapedName
      // These are kinda hacky for the GitHub spec which has +1 and -1 as names.
      .replaceAll('+', 'plus_')
      .replaceAll(RegExp('^-'), 'minus_')
      // Replace any remaining skewers with underscores.
      .replaceAll('-', '_')
      // ' is most commonly used as an apostrophe so just stripping it.
      .replaceAll("'", '');
  // Give known symbols and letters a real ASCII spelling (`µg` -> `mug`,
  // `%` -> `percent`, `café` -> `cafe`) before the catch-all below turns
  // every other non-identifier character into `_`. This keeps distinct
  // values from collapsing to the same name (which the enum-dedup pass
  // would then have to disambiguate as `g`/`g2`).
  escapedName = transliterateToAscii(escapedName);
  // Since jsonName is a raw string, it could have non-legal characters.
  // We need to escape them.
  escapedName = escapedName.replaceAll(RegExp('[^a-zA-Z0-9_]'), '_');

  if (!preserveCase) {
    // Dart style uses camelCase.
    escapedName = toLowerCamelCase(escapedName);
  }
  // first char must be a letter.
  if (escapedName.isEmpty) {
    return 'a';
  }
  final isDigit = RegExp('[0-9]').hasMatch(escapedName[0]);
  if (isDigit) {
    escapedName = 'n$escapedName';
  }
  // camelFromScreamingCaps removes '_', so do the avoid last.
  return avoidReservedWord(escapedName);
}

Iterable<String> wrapLines({
  required List<String> lines,
  required int maxWidth,
}) {
  return lines.expand((line) {
    if (line.length < maxWidth) {
      return [line];
    }
    final words = line.split(' ');
    final result = <String>[];
    var currentLine = '';
    for (final word in words) {
      if (currentLine.isEmpty) {
        currentLine = word;
        continue;
      }
      // Don't break inside a backtick code span: an odd backtick count
      // on the line so far means the next word continues the span.
      // Splitting there breaks the span across lines, leaves an unclosed
      // backtick on each half, and any `<…>` inside trips
      // `unintended_html_in_doc_comment`. Tolerating an over-width line
      // here is the lesser evil — `suppressLongLineLintInGeneratedFiles`
      // will silence the line-length lint after the fact.
      final inBacktick = '`'.allMatches(currentLine).length.isOdd;
      if (inBacktick || currentLine.length + word.length + 1 <= maxWidth) {
        currentLine += ' $word';
      } else {
        result.add(currentLine);
        currentLine = word;
      }
    }
    result.add(currentLine);
    return result;
  });
}

/// Letters a/e/i/o treated as "an"-taking; `u` is excluded because the
/// dominant class-name U-words (`User`, `Uniform`, `Unique`) start with
/// a consonant "yoo" sound.
const _anTakingInitials = {'a', 'e', 'i', 'o', 'A', 'E', 'I', 'O'};

/// Picks "a" or "an" for [word], biased for programming class names.
/// Returns "an" when [word] starts with A/E/I/O, "a" otherwise. Misses
/// edge cases like `Upload` (vowel sound, should be "an") and `FBI`
/// (acronym, should be "an"), but those are rare in class names.
@visibleForTesting
String aOrAn(String word) {
  if (word.isEmpty) return 'a';
  return _anTakingInitials.contains(word[0]) ? 'an' : 'a';
}

Iterable<String> wrapDocComment(String value, {int indent = 0}) {
  final prefix = '${' ' * indent}/// ';
  final wrapWidth = 80 - prefix.length;
  // Trim trailing whitespace so a YAML block-scalar description (which
  // carries a trailing newline) does not render as a dangling `///` line.
  final lines = value.trimRight().split('\n');
  return wrapLines(
    lines: lines,
    maxWidth: wrapWidth,
  ).map((line) => '$prefix$line');
}

/// Assemble a single `validate(...)` invocation from the named arguments a
/// schema's constraints produce, or null when the schema declares none. Every
/// constraint on a value collapses into one call — `validate(min: 0, max: 10)`
/// — rather than a call per bound, so no receiver is ever repeated (no
/// cascade) and the generated line reads like handwritten Dart.
String? validateCall(List<String> args) =>
    args.isEmpty ? null : 'validate(${args.join(', ')})';

/// Renders a two-part class-member doc comment that fits 80 cols
/// even when long flattened type names would otherwise push the
/// single-line form past the lint. Emits `/// $single` when the
/// combined body fits, otherwise a two-line form: `/// $first` then
/// `/// $second`. Returns a string ending in `\n    ` so it slots
/// into templates that assume that trailing indent.
@visibleForTesting
String wrappedClassDocComment({
  required String single,
  required String first,
  required String second,
}) {
  // Class-member lines render at a 2-space indent after `dart format`,
  // so `/// ` plus the body has to fit in 80 - 2 = 78 columns.
  const contentBudget = 80 - 2 - 4; // leading `  /// ` eats 6 cols.
  if (single.length <= contentBudget) {
    return '/// $single\n    ';
  }
  return '/// $first\n    /// $second\n    ';
}

String? indentWithTrailingNewline(
  List<String> lines, {
  required int indent,
  bool extraTrailingNewline = false,
}) {
  if (lines.isEmpty) {
    return null;
  }
  final indentString = ' ' * indent;
  final maybeNewline = extraTrailingNewline ? '\n' : '';
  final joined = lines.join('\n$indentString').trimLeft();
  return '$joined$maybeNewline\n$indentString';
}

/// Doc comments are meant to be inserted right before the type declaration
/// *not* on a separate line.  They will add their own new-line at the end if
/// necessary and will match the passed in indent for any lines after the first
/// including after the trailing new-line.
///
/// [templateName], if non-null, wraps the title + body in a dartdoc
/// `{@template <templateName>}` / `{@endtemplate}` block so the prose can
/// be reused elsewhere via `{@macro <templateName>}`. Example/examples
/// render outside the template block.
String? createDocComment({
  required CommonProperties common,
  int indent = 0,
  String? templateName,
}) {
  final title = common.title;
  final body = common.description;
  final example = common.example;
  final examples = common.examples;
  return createDocCommentFromParts(
    title: title,
    body: body,
    example: example,
    examples: examples,
    indent: indent,
    templateName: templateName,
  );
}

String? createDocCommentFromParts({
  String? title,
  String? body,
  dynamic example,
  List<dynamic>? examples,
  List<ParameterExampleDoc> parameterExamples = const [],
  int indent = 0,
  String? templateName,
}) {
  if (title == null &&
      body == null &&
      example == null &&
      examples == null &&
      parameterExamples.isEmpty) {
    return null;
  }
  final indentStr = ' ' * indent;
  final hasTemplateContent = title != null || body != null;
  final wrapWithTemplate = templateName != null && hasTemplateContent;
  final lines = <String>[
    if (wrapWithTemplate) '$indentStr/// {@template $templateName}',
    if (title != null) ...wrapDocComment(title, indent: indent),
    if (body != null) ...wrapDocComment(body, indent: indent),
    if (wrapWithTemplate) '$indentStr/// {@endtemplate}',
    if (example != null) ...exampleDocCommentLines(example, indent: indent),
    if (examples != null)
      ...examples.expand((e) => exampleDocCommentLines(e, indent: indent)),
    for (final p in parameterExamples)
      ...p.examples.expand(
        (value) => exampleDocCommentLines(
          value,
          indent: indent,
          prefix: '[${p.dartName}] example',
        ),
      ),
  ];
  if (lines.isEmpty) {
    return null;
  }
  // Remove leading whitespace from just the first line.
  // This makes it easier to use from within a mustache template.
  lines[0] = lines[0].trimLeft();
  // Re-indent the next line after the comment.
  return '${lines.join('\n')}\n${' ' * indent}';
}

/// Per-parameter example bundle threaded into an endpoint's doc
/// comment. The Dart-side parameter name (rather than the wire name) is
/// used so dartdoc renders the surrounding `[name]` as a cross-link to
/// the method's parameter, not as a broken reference.
class ParameterExampleDoc {
  const ParameterExampleDoc({required this.dartName, required this.examples});

  /// The Dart-side parameter name (camelCased, reserved-word-safe).
  final String dartName;

  /// All example values declared on the parameter, scalar or complex.
  final List<dynamic> examples;
}

/// Renders an example [value] as one or more dartdoc lines, fully
/// indented and prefixed with `///`, ready to be joined into a doc
/// comment.
///
/// Scalars (String, num, bool) render inline as `` /// <prefix>: `<v>` ``.
/// String values use Dart-source quoting so the rendered backtick span
/// matches the shape callers would type in real code.
///
/// Complex values (Map / List) render as a fenced JSON code block —
/// `/// <prefix>:`, then `/// ```json`, the pretty-printed payload split
/// across lines, then a closing `/// ```. This keeps the doc comment
/// readable even when the example is a multi-line object, and lets
/// dartdoc/IDEs syntax-highlight the body.
///
/// [prefix] defaults to `Example`; pass e.g. `[paramName] example` to
/// scope the example to a specific parameter.
@visibleForTesting
Iterable<String> exampleDocCommentLines(
  dynamic value, {
  int indent = 0,
  String prefix = 'Example',
}) {
  if (value == null) return const [];
  final indentStr = ' ' * indent;
  if (value is Map || value is List) {
    final pretty = _prettyPrintJson(value);
    return <String>[
      '$indentStr/// $prefix:',
      '$indentStr/// ```json',
      ...pretty.split('\n').map((line) => '$indentStr/// $line'),
      '$indentStr/// ```',
    ];
  }
  final formatted = value is String ? quoteString(value) : value.toString();
  return wrapDocComment('$prefix: `$formatted`', indent: indent);
}

/// Pretty-print a JSON-shaped value with 2-space indentation. Coerces
/// any non-JSON-encodable element (DateTime, class instance, etc.) to
/// its `toString()` form before encoding so the encode never throws —
/// doc-comment generation must always produce *something*, even if a
/// spec author dropped a non-JSON value into an `example:` field.
String _prettyPrintJson(dynamic value) {
  const encoder = JsonEncoder.withIndent('  ');
  return encoder.convert(_coerceToJson(value));
}

/// Walk [value] turning anything `jsonEncode` would reject into its
/// `toString()` form. Maps and Lists are recursed into; JSON scalars
/// (null, num, bool, String) pass through unchanged.
dynamic _coerceToJson(dynamic value) {
  if (value == null || value is num || value is bool || value is String) {
    return value;
  }
  if (value is Map) {
    return value.map<String, dynamic>(
      (key, v) => MapEntry(key.toString(), _coerceToJson(v)),
    );
  }
  if (value is List) {
    return value.map(_coerceToJson).toList();
  }
  return value.toString();
}

/// Returns a dartdoc `/// {@macro <templateName>}` line, matching the
/// shape produced by [createDocComment] when given a `templateName`.
/// Use on members of a class to reuse the class-level description
/// without duplicating prose.
String? createMacroDocComment({
  required String? templateName,
  int indent = 0,
}) {
  if (templateName == null) return null;
  // Match the indent-after-first-line convention of createDocComment:
  // first line starts with `///`, subsequent text (and the trailing
  // newline) is indented by [indent] spaces.
  return '/// {@macro $templateName}\n${' ' * indent}';
}

/// A class that can be converted to a template context.
// This only exists because RenderSchema handles both the conversion to
// templates as well as being the "type object", once we split out type
// objects we can simplify the RenderTree and this method moves into some
// sort of class that knows how to convert type objects into template contexts.
// ignore: one_member_abstracts
abstract class ToTemplateContext {
  Map<String, dynamic> toTemplateContext(SchemaRenderer context);
}

abstract class CanBeParameter implements ToTemplateContext {
  bool get isRequired;
  String dartParameterName(Quirks quirks);

  /// The single `validate(...)` invocation for this value's constraints
  /// (receiver excluded), or null when it declares none.
  String? get validationCall;
}

// Could make this comparable to have a nicer sort for our test results.
@immutable
/// A library the generator can emit an import of, and the identifiers it
/// provides.
///
/// The *providing* side of an import: where the library lives and which
/// of its names the generator is able to emit. Distinct from [Import],
/// which is one file's directive naming this library — the prefix and
/// `show` clause there are the consuming file's choices and no business
/// of the library's.
@immutable
class Library extends Equatable {
  const Library(this.path, {this.provides = const {}});

  final String path;

  /// The identifiers this library provides that the generator can emit,
  /// or empty to import it unconditionally.
  ///
  /// The generator never reads a library to find out what it exports, so
  /// the identifier-to-library mapping has to be written down — see
  /// [Libraries], which is where it lives.
  ///
  /// A set rather than one name because a library can provide several:
  /// `dart:convert` supplies `jsonDecode` to api files and `base64` to
  /// models.
  final Set<String> provides;

  /// Whether a file whose body is tokenized by [bodyNames] needs this
  /// library.
  ///
  /// Gating matters because schema-contributed imports
  /// (`additionalImports`) are collected from the *schema tree*, but a
  /// file only emits code for part of that tree: a nested schema can
  /// contribute `dart:convert` while the body reaches its bytes through
  /// a `model_helpers.dart` wrapper (`maybeBase64Decode`) and never
  /// names `base64` itself.
  ///
  /// Conservative in the safe direction, like `referencedIdentifiers`:
  /// keeping a library requires a token to be present, so a used import
  /// is never dropped — the effect is only to stop emitting ones the
  /// file never references (which `dart fix` would otherwise strip).
  bool isNeededBy(bool Function(String) bodyNames) =>
      provides.isEmpty || provides.any(bodyNames);

  @override
  List<Object?> get props => [path, provides];
}

/// One file's import directive naming a [Library].
///
/// The *consuming* side: [asName] and [shown] are this file's choices
/// about how to bring the library into scope, so two files can import
/// one library differently without disagreeing about the library itself.
@immutable
class Import extends Equatable {
  const Import(this.library, {this.asName, this.shown = const []});

  /// An import of a library that declares no identifiers — the generated
  /// package's own files, whose paths depend on the package name and so
  /// cannot be [Libraries] constants.
  Import.path(String path, {this.asName, this.shown = const []})
    : library = Library(path);

  final Library library;

  final String? asName;

  /// Specific identifiers to narrow the import/export with a `show`
  /// clause. Empty means "show all". Only meaningful when [asName] is
  /// null (prefix imports already scope symbols via the prefix). Used
  /// by the public-api barrel to narrow third-party re-exports to the
  /// types the generated API actually references.
  final List<String> shown;

  String get path => library.path;

  Map<String, dynamic> toTemplateContext() => {'path': path, 'asName': asName};

  @override
  List<Object?> get props => [library, asName, shown];
}

/// Every library space_gen imports on a consumer's behalf, defined once.
///
/// The generator emits identifiers it does not declare — `@immutable`,
/// `jsonDecode`, `Uint8List` — and cannot ask the providing library which
/// names it exports, so that mapping is written down here and nowhere
/// else. Spelling a library out at the call site instead is what produced
/// the duplicate `package:meta/meta.dart` directive: two sites described
/// the same library differently, so the set they were gathered in kept
/// both.
///
/// Sibling of [ModelHelpers], which does the same for identifiers the
/// generator itself emits into `model_helpers.dart`.
abstract final class Libraries {
  /// `@immutable` on generated model and wrapper classes.
  static const meta = Library(
    'package:meta/meta.dart',
    provides: {'immutable'},
  );

  /// `Future`, in generated api method signatures.
  static const dartAsync = Library('dart:async', provides: {'Future'});

  /// `jsonDecode` in api files; `base64` in models with
  /// `contentEncoding: base64` fields.
  static const dartConvert = Library(
    'dart:convert',
    provides: {'jsonDecode', 'jsonEncode', 'base64'},
  );

  /// `HttpStatus`, emitted by `api.mustache`.
  static const dartIo = Library('dart:io', provides: {'HttpStatus'});

  /// `Uint8List`, for `format: binary` and `contentEncoding: base64`.
  static const dartTypedData = Library(
    'dart:typed_data',
    provides: {'Uint8List'},
  );

  /// `UriTemplate`, for `format: uri-template`.
  static const uri = Library(
    'package:uri/uri.dart',
    provides: {'UriTemplate'},
  );

  /// Always imported via the `http.` prefix. It declares no `provides`
  /// because the gate is on the `http.` prefix appearing in the body, not
  /// on a bare identifier — a `http` token in a doc-comment URL must not
  /// keep it.
  static const http = Library('package:http/http.dart');

  /// `package:test`, in generated round-trip tests.
  static const test = Library('package:test/test.dart');
}

/// Identifiers emitted by the renderer that are defined in the generated
/// `model_helpers.dart` file. Kept in sync with
/// `lib/templates/model_helpers.mustache`. Used both at emit sites below
/// and by [SchemaUsage] to decide whether to import `model_helpers.dart`.
abstract final class ModelHelpers {
  static const maybeParseDateTime = 'maybeParseDateTime';
  static const maybeParseUri = 'maybeParseUri';
  static const maybeParseUriTemplate = 'maybeParseUriTemplate';
  static const listsEqual = 'listsEqual';
  static const mapsEqual = 'mapsEqual';
  static const listHash = 'listHash';
  static const mapHash = 'mapHash';
  static const parseFromJson = 'parseFromJson';
  static const checkedKey = 'checkedKey';
  static const maybeBase64Encode = 'maybeBase64Encode';
  static const maybeBase64Decode = 'maybeBase64Decode';

  static const List<String> all = [
    maybeParseDateTime,
    maybeParseUri,
    maybeParseUriTemplate,
    listsEqual,
    mapsEqual,
    listHash,
    mapHash,
    parseFromJson,
    checkedKey,
    maybeBase64Encode,
    maybeBase64Decode,
  ];
}

class SpecResolver {
  SpecResolver(this.quirks);

  final Quirks quirks;

  /// The naming-pass output for the tree currently being rendered.
  /// Populated at the start of [toRenderSpec] for full-spec renders;
  /// callers that render a partial tree (a single schema or
  /// operation, e.g. test helpers) must set [names] themselves
  /// before calling [toRenderSchema] / [toRenderOperation].
  AssignedNames _names = AssignedNames.empty;

  /// Sets the assigned-name lookup. Test helpers that render a
  /// single schema or operation outside a spec call this with
  /// `assignNamesForSchema(...)` / `assignNamesForOperation(...)`
  /// before invoking the renderer.
  // ignore: avoid_setters_without_getters
  set names(AssignedNames names) => _names = names;

  /// Looks up the assigned Dart class name (camel) for a resolved
  /// schema's pointer, or null if the naming pass didn't enumerate
  /// it (e.g. non-newtype schemas like inline arrays/maps).
  String? _nameFor(JsonPointer pointer) => _names.maybeGet(pointer);

  /// Looks up the assigned name for [pointer], asserting the naming
  /// pass enumerated it. Use at sites where the entity is known to be
  /// named (e.g. operations always claim `<op>_response`); a `null`
  /// here means the naming pass missed an entity it should have
  /// covered. Delegates to [AssignedNames.operator []], which throws
  /// a `StateError` with the offending pointer.
  String _requireNameFor(JsonPointer pointer) => _names[pointer];

  /// Looks up the assigned snake name for a resolved schema's pointer
  /// — used as a file basename. Paired with [_nameFor]: when one
  /// returns non-null, so does the other.
  String? _snakeFor(JsonPointer pointer) => _names.snakeFor(pointer);

  /// Looks up the wrapper-subclass names assigned by the naming pass
  /// for each variant of a oneOf/anyOf, in `coll.schemas` order.
  /// Indexes that the naming pass didn't enumerate (e.g. NoDispatch)
  /// land as null; render only reads the entries it needs (the
  /// dispatch decision tells it which).
  List<String?> _wrapperNamesFor(ResolvedSchemaCollection coll) => [
    for (var i = 0; i < coll.schemas.length; i++)
      _names.maybeGet(AssignedNames.wrapperPointer(coll.pointer, i)),
  ];

  RenderSchema? maybeRenderSchema(ResolvedSchema? schema) {
    if (schema == null) {
      return null;
    }
    return toRenderSchema(schema);
  }

  /// [isParameterSchema] is set when [schema] is the top-level schema of a
  /// parameter (query/path/header/cookie). The `allListsDefaultToEmpty` quirk
  /// synthesizes an empty-list default for arrays to match openapi-generator's
  /// *response model* behavior (list fields come back `[]`, never null) — but a
  /// parameter is an input, where omitted and present-but-empty differ. Forcing
  /// `= const []` there makes an optional array param non-optional in practice
  /// and emits a no-op `if (x != null)` guard over the default. So the quirk
  /// is suppressed for parameter schemas; they default to `null` like plain
  /// output.
  RenderSchema toRenderSchema(
    ResolvedSchema schema, {
    bool isParameterSchema = false,
  }) {
    switch (schema) {
      case ResolvedRecursiveRef():
        // The recursive ref's type name is the target's class name —
        // look up by targetPointer, not the ref site's own pointer
        // (the ref site has createsNewType: false, so it isn't named
        // in its own right).
        return RenderRecursiveRef(
          common: schema.common,
          targetPointer: schema.targetPointer,
          assignedName: _nameFor(schema.targetPointer),
          assignedSnakeName: _snakeFor(schema.targetPointer),
        );
      case ResolvedStringEnum():
        // Spec-provided member names (`title:`) win over value-derived
        // ones; both route through the same identifier sanitization.
        final stringNames = schema.names;
        return RenderStringEnum(
          common: schema.common,
          values: schema.values,
          names: RenderEnum.variableNamesFor(
            quirks,
            stringNames ?? schema.values,
          ),
          descriptions: schema.descriptions,
          defaultValue: schema.defaultValue,
          assignedName: _nameFor(schema.pointer),
          assignedSnakeName: _snakeFor(schema.pointer),
        );
      case ResolvedIntEnum():
        final intNames = schema.names;
        // The name split decides the representation. When the spec gives the
        // members meaningful names — Discord's `oneOf` of `const`s with a
        // `title:` (`BLOCK_MESSAGE` -> `blockMessage`) — a Dart enum earns
        // its keep, exactly as for a string enum. When it doesn't, the only
        // names available are synthetic `value<N>` that carry nothing the
        // int doesn't, so a validated int newtype (an `extension type` over
        // `int` whose constructor checks membership) reads better and matches
        // the other validated-scalar newtypes. See #352.
        if (intNames != null) {
          return RenderIntEnum(
            common: schema.common,
            values: schema.values,
            names: RenderEnum.variableNamesFor(quirks, intNames),
            descriptions: schema.descriptions,
            defaultValue: schema.defaultValue,
            assignedName: _nameFor(schema.pointer),
            assignedSnakeName: _snakeFor(schema.pointer),
          );
        }
        return RenderIntNewtype(
          common: schema.common,
          allowedValues: schema.values,
          defaultValue: schema.defaultValue,
          assignedName: _nameFor(schema.pointer),
          assignedSnakeName: _snakeFor(schema.pointer),
        );
      case ResolvedObject():
        return RenderObject(
          common: schema.common,
          properties: schema.properties.map(
            (name, value) => MapEntry(name, toRenderSchema(value)),
          ),
          additionalProperties: maybeRenderSchema(schema.additionalProperties),
          requiredProperties: schema.requiredProperties,
          constProperties: schema.constProperties,
          parentSealedTypeName: _names.parentSealedTypeFor(schema.pointer),
          assignedName: _nameFor(schema.pointer),
          assignedSnakeName: _snakeFor(schema.pointer),
        );
      case ResolvedPod():
        return RenderPod(
          common: schema.common,
          type: schema.type,
          createsNewType: schema.createsNewType,
          defaultValue: schema.defaultValue,
          assignedName: _nameFor(schema.pointer),
          assignedSnakeName: _snakeFor(schema.pointer),
        );
      case ResolvedString():
        return RenderString(
          common: schema.common,
          createsNewType: schema.createsNewType,
          defaultValue: schema.defaultValue,
          maxLength: schema.maxLength,
          minLength: schema.minLength,
          pattern: schema.pattern,
          assignedName: _nameFor(schema.pointer),
          assignedSnakeName: _snakeFor(schema.pointer),
        );
      case ResolvedNumber():
        return RenderNumber(
          common: schema.common,
          createsNewType: schema.createsNewType,
          defaultValue: schema.defaultValue,
          maximum: schema.maximum,
          minimum: schema.minimum,
          exclusiveMaximum: schema.exclusiveMaximum,
          exclusiveMinimum: schema.exclusiveMinimum,
          multipleOf: schema.multipleOf,
          assignedName: _nameFor(schema.pointer),
          assignedSnakeName: _snakeFor(schema.pointer),
        );
      case ResolvedInteger():
        return RenderInteger(
          common: schema.common,
          createsNewType: schema.createsNewType,
          defaultValue: schema.defaultValue,
          maximum: schema.maximum,
          minimum: schema.minimum,
          exclusiveMaximum: schema.exclusiveMaximum,
          exclusiveMinimum: schema.exclusiveMinimum,
          multipleOf: schema.multipleOf,
          assignedName: _nameFor(schema.pointer),
          assignedSnakeName: _snakeFor(schema.pointer),
        );
      case ResolvedArray():
        var defaultValue = schema.defaultValue;
        // The `allListsDefaultToEmpty` quirk fakes an empty-list default so
        // response-model list fields are non-null; a parameter is an input, so
        // it keeps its real (usually null) default — see [isParameterSchema].
        if (defaultValue == null &&
            quirks.allListsDefaultToEmpty &&
            !isParameterSchema) {
          defaultValue = List<dynamic>.empty();
        }
        return RenderArray(
          common: schema.common,
          items: toRenderSchema(schema.items),
          defaultValue: defaultValue,
          maxItems: schema.maxItems,
          minItems: schema.minItems,
          uniqueItems: schema.uniqueItems,
          createsNewType: schema.createsNewType,
          assignedName: _nameFor(schema.pointer),
          assignedSnakeName: _snakeFor(schema.pointer),
        );
      case ResolvedVoid():
        return RenderVoid(common: schema.common);
      case ResolvedUnknown():
      // `type: null` as a property schema (legal per JSON Schema 2020-12 +
      // OpenAPI 3.1) resolves to `ResolvedNull`. The only legal runtime
      // value is `null` itself, so rendering as `dynamic` is both correct
      // and not worse than the alternative. A dedicated `RenderNull` with
      // Dart's `Null` type would be more precise but rarely useful — any
      // caller that genuinely wants a null-only field would use a Dart
      // language feature, not lean on generated code.
      case ResolvedNull():
        return RenderUnknown(common: schema.common);
      case ResolvedBinary():
        return RenderBinary(common: schema.common);
      case ResolvedBase64Bytes():
        return RenderBase64Bytes(common: schema.common);
      case ResolvedDate():
        return RenderDate(
          common: schema.common,
          defaultValue: schema.defaultValue,
        );
      case ResolvedOneOf():
        final renderSchemas = schema.schemas.map(toRenderSchema).toList();
        final disc = schema.discriminator;
        RenderDiscriminator? renderDiscriminator;
        if (disc != null) {
          final rawMapping = disc.mapping;
          if (rawMapping != null) {
            // For each ResolvedSchema in the resolver-side mapping, find
            // its index in schema.schemas (identity match, established by
            // the resolver) and use the corresponding rendered variant.
            final renderMapping = <Object, RenderSchema>{};
            for (final entry in rawMapping.entries) {
              final i = schema.schemas.indexWhere(
                (s) => identical(s, entry.value),
              );
              if (i == -1) {
                // Resolver invariant violation — should never happen.
                throw StateError(
                  'discriminator mapping target not in oneOf.schemas',
                );
              }
              renderMapping[entry.key] = renderSchemas[i];
            }
            renderDiscriminator = RenderDiscriminator(
              propertyName: disc.propertyName,
              mapping: renderMapping,
            );
          }
        }
        return RenderOneOf(
          common: schema.common,
          schemas: renderSchemas,
          discriminator: renderDiscriminator,
          source: schema,
          assignedName: _nameFor(schema.pointer),
          assignedSnakeName: _snakeFor(schema.pointer),
          wrapperNames: _wrapperNamesFor(schema),
        );
      case ResolvedAllOf():
        // Generate a synthetic object type for allOf. A property is
        // required iff any member requires it (allOf semantics: all
        // members must validate, so a member's required field is
        // required overall). Dropping the union here would silently
        // make required fields nullable in the generated constructor
        // and also hide a required single-value-enum tag from oneOf
        // dispatch detection (allOf-shaped variants).
        final properties = <String, RenderSchema>{};
        final requiredProperties = <String>{};
        // An open member makes the merged object open: its value schema
        // becomes the merged object's `additionalProperties` overflow. First
        // open member wins (multiple open members in one allOf is degenerate).
        RenderSchema? additionalProperties;
        final constProperties = <String, Object>{};
        for (final schema in schema.schemas) {
          final renderSchema = toRenderSchema(schema);
          if (renderSchema is RenderObject) {
            properties.addAll(renderSchema.properties);
            requiredProperties.addAll(renderSchema.requiredProperties);
            constProperties.addAll(renderSchema.constProperties);
            // A member that itself declares `additionalProperties` (an
            // object with an overflow) opens the merged object too.
            additionalProperties ??= renderSchema.additionalProperties;
          } else if (renderSchema is RenderMap) {
            // An open map member (e.g. a `JsonObject` → `Map<String, dynamic>`)
            // contributes an arbitrary-key overflow of its value type.
            additionalProperties ??= renderSchema.valueSchema;
          }
          // Other members (e.g. a closed empty object) contribute nothing.
        }
        return RenderObject(
          common: schema.common,
          properties: properties,
          additionalProperties: additionalProperties,
          requiredProperties: requiredProperties.toList(),
          constProperties: constProperties,
          parentSealedTypeName: _names.parentSealedTypeFor(schema.pointer),
          assignedName: _nameFor(schema.pointer),
          assignedSnakeName: _snakeFor(schema.pointer),
        );
      case ResolvedAnyOf():
        // Resolver already makes anyOf with 1 schema to just be that schema.
        // For multiple schemas, we just generate a oneOf, which is wrong.
        // anyOf means that at least one of the schemas must be valid.
        // Which presumably translates into a single schema with all properties
        // nullable?  Unclear.
        return RenderOneOf(
          common: schema.common,
          schemas: schema.schemas.map(toRenderSchema).toList(),
          discriminator: null,
          source: schema,
          assignedName: _nameFor(schema.pointer),
          assignedSnakeName: _snakeFor(schema.pointer),
          wrapperNames: _wrapperNamesFor(schema),
        );
      case ResolvedMap():
        final keySchema = schema.keySchema;
        return RenderMap(
          common: schema.common,
          valueSchema: toRenderSchema(schema.valueSchema),
          keySchema: keySchema == null ? null : toRenderSchema(keySchema),
          maxProperties: schema.maxProperties,
          minProperties: schema.minProperties,
        );
      case ResolvedEmptyObject():
        return RenderEmptyObject(
          common: schema.common,
          assignedName: _nameFor(schema.pointer),
          assignedSnakeName: _snakeFor(schema.pointer),
        );
      default:
        _unimplemented('Unknown schema: $schema', schema.pointer);
    }
  }

  RenderParameter toRenderParameter(ResolvedParameter parameter) {
    return RenderParameter(
      description: parameter.description,
      name: parameter.name,
      inLocation: parameter.inLocation,
      isRequired: parameter.isRequired,
      isDeprecated: parameter.isDeprecated,
      type: toRenderSchema(parameter.schema, isParameterSchema: true),
      example: parameter.example,
      examples: parameter.examples,
      queryEncoding: parameter.queryEncoding,
    );
  }

  RenderResponse toRenderResponse(ResolvedResponse response) {
    return RenderResponse(
      statusCode: response.statusCode,
      description: response.description,
      content: toRenderSchema(response.content),
      contentType: response.contentType,
    );
  }

  RenderRequestBody? toRenderRequestBody(ResolvedRequestBody? requestBody) {
    if (requestBody == null) {
      return null;
    }
    switch (requestBody.mimeType) {
      case MimeType.applicationJson:
        return RenderRequestBodyJson(
          schema: toRenderSchema(requestBody.schema),
          description: requestBody.description,
          isRequired: requestBody.isRequired,
        );
      case MimeType.applicationOctetStream:
        return RenderRequestBodyOctetStream(
          schema: toRenderSchema(requestBody.schema),
          description: requestBody.description,
          isRequired: requestBody.isRequired,
        );
      case MimeType.textPlain:
        return RenderRequestBodyTextPlain(
          schema: toRenderSchema(requestBody.schema),
          description: requestBody.description,
          isRequired: requestBody.isRequired,
        );
      case MimeType.multipartFormData:
        return RenderRequestBodyMultipart(
          schema: toRenderSchema(requestBody.schema),
          description: requestBody.description,
          isRequired: requestBody.isRequired,
        );
      case MimeType.formUrlEncoded:
        return RenderRequestBodyFormUrlEncoded(
          schema: toRenderSchema(requestBody.schema),
          description: requestBody.description,
          isRequired: requestBody.isRequired,
        );
    }
  }

  OperationReturn _determineReturnShape(ResolvedOperation operation) {
    // Figure out how many different successful responses there are.
    // Successful = explicit 2xx codes plus the `2XX` range if declared.
    final explicit2xx = operation.responses
        .where((e) => e.statusCode >= 200 && e.statusCode < 300)
        .toList();
    final successfulRange = operation.rangeResponses
        .where((e) => e.range == StatusCodeRange.success)
        .toList();
    final successfulContent = [
      ...explicit2xx.map((e) => e.content),
      ...successfulRange.map((e) => e.content),
    ];
    if (successfulContent.isEmpty) {
      return SingleSchemaReturn(
        RenderVoid(
          common: CommonProperties.empty(
            snakeName: '${operation.snakeName}_response',
            pointer: operation.pointer,
          ),
        ),
      );
    }
    if (successfulContent.length == 1) {
      return SingleSchemaReturn(toRenderSchema(successfulContent.first));
    }
    final renderSchemas = successfulContent.map(toRenderSchema).toList();
    // These come from different response bodies, so structural sameness
    // (not identity) is the question — dedup by equalsIgnoringName.
    final distinctSchemas = <RenderSchema>[];
    for (final schema in renderSchemas) {
      if (!distinctSchemas.any((e) => e.equalsIgnoringName(schema))) {
        distinctSchemas.add(schema);
      }
    }
    if (distinctSchemas.length == 1) {
      return SingleSchemaReturn(distinctSchemas.first);
    }
    // Multiple distinct success bodies. Status-code dispatch only kicks
    // in when every response has an explicit status code (no `2XX`
    // range): the wrapper subclasses are named per code (`Foo200`,
    // `Foo201`), and a range can't be enumerated. Range-mixed cases
    // fall through to the legacy oneOf path for now.
    if (successfulRange.isEmpty) {
      // Naming pass claims `<op>_response` on the operation's pointer
      // in phase 1 (see `_NameAssigner.visitOperation`); the allocator
      // suffixes if a same-named top-level schema also claimed it.
      // Without this lookup the wrapper would emit the bare
      // `<op>Response`, shadowing the imported schema in the api file
      // (and re-exporting it ambiguously from `api.dart`).
      return MultiStatusReturn(
        responses: {
          for (final response in explicit2xx)
            response.statusCode: toRenderResponse(response),
        },
        wrapperTypeName: _requireNameFor(operation.pointer),
      );
    }
    return SingleSchemaReturn(
      RenderOneOf(
        // TODO(eseidel): Should this pass along description?
        common: CommonProperties.empty(
          snakeName: '${operation.snakeName}_response',
          pointer: operation.pointer,
        ),
        schemas: distinctSchemas.toList(),
        discriminator: null,
        // Synthesized — no resolved oneOf. Renders as the legacy
        // `UnimplementedError` stub via the null-source `NoDispatch`
        // path; closing that gap is a follow-up. The naming pass
        // enumerates this entity under the operation's pointer
        // (no schema claims that pointer) so its Dart name comes
        // through the same lookup as everything else.
        source: null,
        assignedName: _nameFor(operation.pointer),
        assignedSnakeName: _snakeFor(operation.pointer),
      ),
    );
  }

  RenderRangeResponse toRenderRangeResponse(ResolvedRangeResponse response) {
    return RenderRangeResponse(
      range: response.range,
      description: response.description,
      content: toRenderSchema(response.content),
      contentType: response.contentType,
    );
  }

  RenderOperation toRenderOperation(ResolvedOperation operation) {
    final resolvedDefault = operation.defaultResponse;
    final defaultResponse = resolvedDefault == null
        ? null
        : RenderDefaultResponse(
            description: resolvedDefault.description,
            content: toRenderSchema(resolvedDefault.content),
            contentType: resolvedDefault.contentType,
          );
    return RenderOperation(
      pointer: operation.pointer,
      snakeName: operation.snakeName,
      method: operation.method,
      path: operation.path,
      summary: operation.summary,
      description: operation.description,
      tags: operation.tags,
      parameters: operation.parameters.map(toRenderParameter).toList(),
      responses: operation.responses.map(toRenderResponse).toList(),
      rangeResponses: operation.rangeResponses
          .map(toRenderRangeResponse)
          .toList(),
      defaultResponse: defaultResponse,
      requestBody: toRenderRequestBody(operation.requestBody),
      returnShape: _determineReturnShape(operation),
      securityRequirements: operation.securityRequirements,
    );
  }

  RenderPath toRenderPath(ResolvedPath pathItem) {
    return RenderPath(
      path: pathItem.path,
      operations: pathItem.operations.map(toRenderOperation).toList(),
    );
  }

  RenderTag toRenderTag(ResolvedTag tag) {
    return RenderTag(name: tag.name, description: tag.description);
  }

  RenderSpec toRenderSpec(ResolvedSpec spec) {
    // Run the naming pass once over the resolved tree; subsequent
    // [toRenderSchema] calls consult [_names] when constructing
    // newtypes so each `typeName` is a lookup, not a recomputation.
    _names = assignNames(spec);
    return RenderSpec(
      title: spec.title,
      serverUrl: spec.serverUrl,
      paths: spec.paths.map(toRenderPath).toList(),
      tagDefinitions: spec.tags.map(toRenderTag).toList(),
    );
  }
}

class RenderTag {
  const RenderTag({required this.name, required this.description});

  final String name;
  final String? description;
}

// Convert a resolved spec to a spec that can be rendered.
// This is the root of the render spec tree.
class RenderSpec {
  const RenderSpec({
    required this.title,
    required this.serverUrl,
    required this.paths,
    required this.tagDefinitions,
  });

  /// The server url of the spec.
  final Uri serverUrl;

  /// The title of the spec.
  final String title;

  /// The paths of the spec.
  final List<RenderPath> paths;

  /// The tag definitions of the spec.
  final List<RenderTag> tagDefinitions;

  /// The endpoints of the spec.
  List<Endpoint> get endpoints => paths
      .expand(
        (p) => p.operations.map(
          (o) => Endpoint(operation: o, serverUrl: serverUrl),
        ),
      )
      .toList();

  /// Set of all endpoint tags in the spec.
  Set<String> get tags => endpoints.map((e) => e.tag).toSet();

  List<Api> get apis => tags.sorted().map((tag) {
    final description =
        tagDefinitions.firstWhereOrNull((e) => e.name == tag)?.description ??
        'Endpoints with tag $tag';
    final endpoints = this.endpoints.where((e) => e.tag == tag).toList();
    // The GitHub spec prefixes all endpoint names with their tag name.
    // e.g. `checksCreate` could just be `create` on the `ChecksApi`.
    // If all endpoints have the tag as a prefix, we can remove it.
    final methodNames = endpoints.map((e) => e.methodName).toList();
    final prefix = methodNames.every((m) => m.startsWith(tag)) ? tag : null;
    return Api(
      description: description,
      snakeName: toSnakeCase(tag),
      endpoints: endpoints.where((e) => e.tag == tag).toList(),
      removePrefix: prefix,
    );
  }).toList();
}

/// The `AuthRequest` types from `lib/templates/auth.dart`, all of which
/// declare `const` constructors — which is what lets an auth argument be a
/// compile-time constant, since every value in one comes from the spec and
/// so is a literal or an enum member.
const _noAuthType = DartType('NoAuth');
const _allOfAuthType = DartType('AllOfAuth');
const _oneOfAuthType = DartType('OneOfAuth');
const _apiKeyAuthType = DartType('ApiKeyAuth');
const _httpAuthType = DartType('HttpAuth');
const _apiKeyLocationType = DartType('ApiKeyLocation');

extension on ResolvedSecurityRequirement {
  /// Turn the SecurityRequirements into AuthRequest subclasses to be
  /// resolved at runtime by the ApiClient.  If this requirement has
  /// multiple conditions, wrap them in an AllOfAuth.
  DartExpression toExpression() {
    if (conditions.isEmpty) {
      return _noAuthType.constConstruct([]);
    }
    // TODO(eseidel): Support scopes/roles in conditions.values.
    if (conditions.length == 1) {
      return conditions.keys.first.toExpression();
    }
    return _allOfAuthType.constConstruct([
      DartListLiteral.untyped(
        conditions.keys.map((scheme) => scheme.toExpression()).toList(),
      ),
    ]);
  }
}

extension on SecurityScheme {
  /// Turn the SecurityScheme into an AuthRequest subclass to be
  /// resolved at runtime by the ApiClient. Unsupported scheme types
  /// (oauth2 / openIdConnect / mutualTLS) render as `NoAuth()` — the
  /// caller is expected to override `ApiClient.resolveAuth` or set
  /// `defaultHeaders` to inject auth themselves. The parser emits a
  /// warning at generation time so consumers notice.
  DartExpression toExpression() => switch (this) {
    // Named arguments, so these build [DartInvocation] directly rather than
    // going through `constConstruct` (positional only).
    ApiKeySecurityScheme(
      keyName: final keyName,
      inLocation: final inLocation,
    ) =>
      DartInvocation(
        type: _apiKeyAuthType,
        isConstConstructor: true,
        namedArguments: {
          'name': DartLiteral(keyName),
          'secretName': DartLiteral(name),
          'sendIn': _apiKeyLocationType.member(inLocation.name),
        },
      ),
    HttpSecurityScheme(scheme: final scheme) => DartInvocation(
      type: _httpAuthType,
      isConstConstructor: true,
      namedArguments: {
        'scheme': DartLiteral(scheme),
        'secretName': DartLiteral(name),
      },
    ),
    UnsupportedSecurityScheme() => _noAuthType.constConstruct([]),
  };
}

/// A convenience class created for each operation within a path item
/// for compatibility with our existing rendering code.
// TODO(eseidel): Could remove this in favor of RenderOperation?
class Endpoint implements ToTemplateContext {
  const Endpoint({required this.operation, required this.serverUrl});

  /// The server url of the endpoint.
  final Uri serverUrl;

  /// The operation of the endpoint.
  final RenderOperation operation;

  /// The summary of the endpoint.
  String? get summary => operation.summary;

  /// The description of the endpoint.
  String? get description => operation.description;

  /// The method of the endpoint.
  Method get method => operation.method;

  String get path => operation.path;

  String get tag => operation.tags.firstOrNull ?? 'Default';

  String get snakeName => operation.snakeName;

  List<RenderParameter> get parameters => operation.parameters;

  // These are resolved, and may simply be duplicates of the global
  // security requirements.
  List<ResolvedSecurityRequirement> get securityRequirements =>
      operation.securityRequirements;

  RenderRequestBody? get requestBody => operation.requestBody;

  /// True when the request body is `multipart/form-data`. Drives both the
  /// endpoint template (which method name to call) and the arg builder
  /// (which body keys to emit).
  bool get isMultipart => requestBody is RenderRequestBodyMultipart;

  String get methodName => lowercaseCamelFromSnake(snakeName);

  Uri get uri => Uri.parse('$serverUrl$path');

  List<String> validationStatements(Quirks quirks) {
    final statements = <String>[];
    for (final parameter in parameters) {
      // Newtype-typed parameters (e.g. github's `WaitTimer extends
      // int`, Discord's `SnowflakeType extends String`) validate
      // their wrapped value once in the newtype's own constructor —
      // emitting per-call validation here would call `validateXxx`
      // on the extension type, where the extension method doesn't
      // resolve. Non-newtype params stay validated at the API
      // boundary because their underlying String / num is the param
      // type itself.
      if (parameter.type.createsNewType) continue;
      final call = parameter.validationCall;
      if (call == null) continue;
      final dartName = parameter.dartParameterName(quirks);
      final access = parameter.isRequired ? '.' : '?.';
      statements.add('$dartName$access$call;');
    }
    return statements;
  }

  /// Per-parameter example doc lines for this endpoint, ready to be
  /// appended after the summary/description. Each entry refers to the
  /// parameter by its Dart-side name in `[brackets]` so dartdoc renders
  /// it as a cross-reference into the method signature.
  List<ParameterExampleDoc> _parameterExampleLines(Quirks quirks) {
    final out = <ParameterExampleDoc>[];
    for (final parameter in parameters) {
      final examples = parameter.allExamples.toList();
      if (examples.isEmpty) continue;
      out.add(
        ParameterExampleDoc(
          dartName: parameter.dartParameterName(quirks),
          examples: examples,
        ),
      );
    }
    return out;
  }

  /// Turn the SecurityRequirements into AuthRequest subclasses to be
  /// resolved at runtime by the ApiClient, example:
  /// auth: OneOf([
  ///     MultiAuth([
  ///         HttpAuth(scheme: "Bearer", secretName: "AgentToken"),
  ///         ApiKeyAuth(
  ///             name: "apiKey",
  ///             secretName: "ApiKey",
  ///             sendIn: SendIn.header,
  ///         ),
  ///     ]),
  ///     ApiKeyAuth(
  ///         name: "apiKey",
  ///         secretName: "ApiKey",
  ///         sendIn: SendIn.header,
  ///     ),
  ///     NoAuth(),
  /// ]),
  DartExpression? authExpression() {
    if (securityRequirements.isEmpty) {
      return null;
    }
    if (securityRequirements.length == 1) {
      return securityRequirements.first.toExpression();
    }
    return _oneOfAuthType.constConstruct([
      DartListLiteral.untyped(
        securityRequirements.map((r) => r.toExpression()).toList(),
      ),
    ]);
  }

  // The two builders below produce strings whose indentation is fixed
  // by `api.mustache`: the method body sits at 8 spaces, the invokeApi
  // arg list sits at 12 (inside the outer `(...)`), and map entries
  // inside queryParameters/headerParameters are one Dart-standard step
  // deeper. Centralized here so the two builders stay in lockstep with
  // the template and with each other.
  static final String _methodBodyIndent = ' ' * 8;
  static final String _invokeArgIndent = ' ' * 12;
  static final String _nestedStep = ' ' * 4;

  /// Render every argument of the `client.invokeApi[Multipart](...)` call
  /// as a single pre-formatted string. Produced in Dart (rather than via
  /// mustache sections) so the JSON body and multipart body code paths can
  /// share one template emission point; the two paths only differ here in
  /// which body/fields/files keys they emit. No trailing newline — the
  /// template wraps it in `(\n...\n        );`.
  String _buildInvokeArgs(SchemaRenderer context) {
    final indent = _invokeArgIndent;
    final innerIndent = indent + _nestedStep;
    final lines = <String>[
      '${indent}method: Method.${method.name},',
      _pathArgLine(indent, context),
      ..._queryParamsLines(indent, innerIndent, context),
      ..._bodyArgLines(indent, context),
      ..._headerParamsLines(indent, innerIndent, context),
      ..._authRequestLines(indent),
    ];
    return lines.join('\n');
  }

  String _pathArgLine(String indent, SchemaRenderer context) {
    final buffer = StringBuffer("${indent}path: '$path'");
    for (final p in parameters) {
      if (p.inLocation != ParameterLocation.path) continue;
      buffer.write(
        ".replaceAll('${p.bracketedName}', ${_pathReplacement(p, context)})",
      );
    }
    buffer.write(',');
    return buffer.toString();
  }

  /// The `replaceAll` replacement expression for path parameter [p]. It
  /// must evaluate to a `String`.
  ///
  /// When the parameter's wire type is already `String`, the bare
  /// expression is used directly — wrapping it in an interpolation
  /// (`'${x}'`) is redundant (`unnecessary_string_interpolations`).
  /// Otherwise the value is interpolated to stringify it, with the
  /// braces dropped for a bare identifier
  /// (`unnecessary_brace_in_string_interps`).
  ///
  /// The result is percent-encoded unless the type makes that provably
  /// a no-op — see [_pathValueNeedsEncoding].
  String _pathReplacement(RenderParameter p, SchemaRenderer context) {
    final source = _pathStringExpression(p, context);
    if (!_pathValueNeedsEncoding(p)) return source;
    return 'Uri.encodeComponent($source)';
  }

  /// The `String`-valued expression for path parameter [p], before any
  /// percent-encoding.
  String _pathStringExpression(RenderParameter p, SchemaRenderer context) {
    final expr = p.toJsonExpression(context);
    final source = _runtimeSource(expr);
    if (p.type.jsonStorageDartType == DartType.string) return source;
    // Braces are only needed when the expression is more than a bare
    // identifier (`unnecessary_brace_in_string_interps`). That is a
    // question about the expression's shape, which the tree answers
    // directly — it used to be a regex over the rendered text.
    return expr is DartIdentifier ? "'\$$source'" : "'\${$source}'";
  }

  /// Whether [p]'s value has to be percent-encoded before it is
  /// substituted into the path.
  ///
  /// Substitution is textual, so a value carrying a URL-reserved
  /// character would otherwise change the *structure* of the URL rather
  /// than ride along as data — a `/` in particular splits one segment
  /// into two and addresses a different endpoint. Encoding at
  /// substitution time is the only place the parameter boundary is
  /// still known.
  ///
  /// Numbers and bools are skipped: their `toString()` can only produce
  /// `[0-9.eE+-]` or `true`/`false`, none of which
  /// `Uri.encodeComponent` would alter, so wrapping them would be noise
  /// in the generated source. Every other type — `String`, enums,
  /// `DateTime`, `Uri` — can contain a reserved character and is
  /// encoded.
  //
  // TODO(eseidel): `allowReserved: true` should select the raw form
  // here once the parser keeps it (#100).
  static bool _pathValueNeedsEncoding(RenderParameter p) {
    // Not `const`: [DartType] overrides `==`, so it cannot be a const
    // set element.
    final unreserved = {
      DartType.int_,
      DartType.double_,
      DartType.num_,
      DartType.bool_,
    };
    return !unreserved.contains(p.type.jsonStorageDartType.asNonNullable());
  }

  List<String> _queryParamsLines(
    String indent,
    String innerIndent,
    SchemaRenderer context,
  ) {
    final queryParams = parameters
        .where((p) => p.inLocation == ParameterLocation.query)
        .toList();
    if (queryParams.isEmpty) return const [];
    return [
      '${indent}queryParameters: {',
      for (final p in queryParams) _queryParamEntry(innerIndent, p, context),
      '$indent},',
    ];
  }

  String _queryParamEntry(
    String innerIndent,
    RenderParameter p,
    SchemaRenderer context,
  ) {
    // queryParameters is typed `Map<String, List<String>>`. `Uri.replace`
    // spreads each list across repeated keys (form/explode=true), so a
    // 1-element list yields `?k=v` and an N-element list yields
    // `?k=v1&k=v2&…`. Scalars wrap into a single-element list; arrays
    // come through directly.
    //
    // Which of those applies was decided by the resolver — see
    // [QueryEncoding]. This switch translates the decision into Dart; it
    // does not re-derive it from the schema.
    final dartName = p.dartParameterName(context.quirks);
    final value = _queryValueFor(
      p.queryEncoding ?? const UnsupportedEncoding(),
      p.type,
      dartName,
      p,
      context,
    );
    if (p.isNullable) {
      return "${innerIndent}if ($dartName != null) '${p.name}': $value,";
    }
    return "$innerIndent'${p.name}': $value,";
  }

  /// The source for converting one element of [type] to its wire `String`,
  /// written against the element variable `e` — or null when elements are
  /// already `String` and need no conversion at all.
  ///
  /// Null is the signal to skip the surrounding `.map` entirely. Emitting it
  /// anyway would produce `xs.map((e) => e)`, which copies the list and
  /// changes nothing — the sort of line that gives away generated code.
  static String? _elementWireConversion(
    RenderArray type,
    SchemaRenderer context,
  ) {
    const element = DartIdentifier('e');
    final itemsToJson = type.items.toJsonExpression(
      element,
      context,
      dartIsNullable: false,
    );
    final item = _stringifyWireValue(type.items, itemsToJson);
    return item == element ? null : _runtimeSource(item);
  }

  /// [access] (a `List<...>` expression) with each element converted to its
  /// wire `String` — `access.map((e) => …)` — or [access] unchanged when the
  /// elements are already `String`. The caller decides what to do with the
  /// result: `.join(',')` for a comma-joined value (form bodies, query with
  /// `explode: false`) or `.toList()` for repeated keys. When the return
  /// equals [access] verbatim, no conversion was needed (see
  /// [_elementWireConversion]).
  static String _wireMappedElements(
    RenderArray type,
    String access,
    SchemaRenderer context,
  ) {
    final conversion = _elementWireConversion(type, context);
    return conversion == null ? access : '$access.map((e) => $conversion)';
  }

  /// The `Map<String, List<String>>` value expression realizing [encoding]
  /// for a parameter of type [type], reading the Dart value from [access].
  ///
  /// [access] is the parameter name at the top level, and a variant's
  /// destructured `value` when called per-arm from [_unionQueryValue].
  static String _queryValueFor(
    QueryEncoding encoding,
    RenderSchema type,
    String access,
    RenderParameter p,
    SchemaRenderer context,
  ) => switch (encoding) {
    // A single value, or a union of them — either way `toJson()` yields
    // one value and the scalar path is correct.
    SingleValueEncoding() => _scalarQueryValue(type, access, context),
    // No encoding exists for this shape; the resolver has already warned.
    // Stringifying is the documented fallback, not a claim of correctness.
    UnsupportedEncoding() => _scalarQueryValue(type, access, context),
    RepeatedKeyEncoding() => _arrayQueryValue(
      type,
      access,
      context,
      commaJoined: false,
    ),
    CommaJoinedEncoding() => _arrayQueryValue(
      type,
      access,
      context,
      commaJoined: true,
    ),
    PerVariantEncoding(:final variants) => _unionQueryValue(
      type,
      variants,
      access,
      p,
      context,
    ),
  };

  /// One wire value, wrapped in the 1-element list the query map wants.
  static String _scalarQueryValue(
    RenderSchema type,
    String access,
    SchemaRenderer context,
  ) {
    final scalarToJson = type.toJsonExpression(
      DartIdentifier(access),
      context,
      dartIsNullable: false,
    );
    final stringified = _stringifyWireValue(type, scalarToJson);
    return '[${_runtimeSource(stringified)}]';
  }

  /// An array, either repeated across the key or comma-joined into one
  /// value.
  ///
  /// [type] is a [RenderArray] whenever the resolver decided an array
  /// encoding. If it somehow isn't, fall back to the scalar path rather
  /// than crash — a wrong query string beats a failed generation.
  static String _arrayQueryValue(
    RenderSchema type,
    String access,
    SchemaRenderer context, {
    required bool commaJoined,
  }) {
    if (type is! RenderArray) {
      return _scalarQueryValue(type, access, context);
    }
    final items = _wireMappedElements(type, access, context);
    // Comma-joining produces a single value (`?k=a,b,c`) rather than
    // repeating the key. Wrap it in a 1-element list so it flows through
    // the same `Map<String, List<String>>` shape.
    if (commaJoined) return "[$items.join(',')]";
    // `items == access` means no per-element conversion happened, so the
    // value is already the `List<String>` the query map wants — nothing to
    // `.toList()`.
    return items == access ? items : '$items.toList()';
  }

  /// A `switch` over [type]'s sealed variants, each arm producing that
  /// variant's own query value per the matching entry of [variants].
  ///
  /// The arms destructure `value` — every wrapper subclass declares exactly
  /// that field (see `objectWrapperContext` and the `schema_one_of`
  /// template) — so each arm hands its variant's real Dart type to
  /// [_queryValueFor] rather than the union's `dynamic` `toJson()`.
  ///
  /// Emitting the switch needs a wrapper subclass per variant, which the
  /// resolver cannot know about — it is a naming-layer fact. Two shapes
  /// lack them:
  ///
  /// - A `NoDispatch` union gets no wrappers at all; it renders the
  ///   `UnimplementedError` stub instead.
  /// - A *smooshed* variant extends the sealed parent directly and holds its
  ///   own fields, so it has no `value` to destructure — an arm written
  ///   against it would not compile. `_claimWrapperNames` skips the wrapper
  ///   claim for exactly those variants, which is what surfaces here as a
  ///   null name.
  ///
  /// Both warn and fall back to stringifying. That is a renderer
  /// limitation, so it is logged here rather than quietly reclassified as
  /// a different encoding — the silent version of this is what let a union
  /// of arrays render as `List.toString()` with no diagnostic (#296).
  static String _unionQueryValue(
    RenderSchema type,
    List<QueryEncoding> variants,
    String access,
    RenderParameter p,
    SchemaRenderer context,
  ) {
    String giveUp(String why) {
      logger.warn(
        'Query parameter "${p.name}" is a union whose variants encode '
        'differently, but $why — emitting a stringified value, which is '
        'unlikely to match what the server expects, in '
        '${type.common.pointer}',
      );
      return _scalarQueryValue(type, access, context);
    }

    if (type is! RenderOneOf) {
      return giveUp('it did not render as a union');
    }
    if (type.schemas.length != variants.length) {
      return giveUp('its variants did not survive rendering intact');
    }
    final names = type.wrapperNames;
    if (names.length != type.schemas.length || names.any((n) => n == null)) {
      return giveUp('not every variant has a wrapper subclass to match on');
    }
    final arms = <String>[];
    for (var i = 0; i < type.schemas.length; i++) {
      final variant = type.schemas[i];
      final wrapper = type.wrapperTypeName(variant);
      final value = _queryValueFor(
        variants[i],
        variant,
        'value',
        p,
        context,
      );
      arms.add('$wrapper(:final value) => $value,');
    }
    return 'switch ($access) { ${arms.join(' ')} }';
  }

  List<String> _bodyArgLines(String indent, SchemaRenderer context) =>
      switch (requestBody) {
        null => const [],
        RenderRequestBodyMultipart() => [
          '${indent}fields: multipartFields,',
          '${indent}files: multipartFiles,',
        ],
        final RenderRequestBodySimple body => [
          '${indent}body: ${body.bodyExpression(context)},',
          // invokeApi defaults bodyContentType to BodyContentType.json,
          // so only pass it for the non-default content types.
          if (!body.isDefaultBodyContentType)
            '${indent}bodyContentType: ${body.bodyContentTypeExpression},',
        ],
      };

  List<String> _headerParamsLines(
    String indent,
    String innerIndent,
    SchemaRenderer context,
  ) {
    final headerParams = parameters
        .where((p) => p.inLocation == ParameterLocation.header)
        .toList();
    if (headerParams.isEmpty) return const [];
    return [
      '${indent}headerParameters: {',
      for (final p in headerParams) _headerParamEntry(innerIndent, p, context),
      '$indent},',
    ];
  }

  String _headerParamEntry(
    String innerIndent,
    RenderParameter p,
    SchemaRenderer context,
  ) {
    // headerParameters stays `Map<String, String>` — HTTP headers can't
    // repeat with arbitrary semantics, so OpenAPI default for header
    // arrays is style=simple, explode=false: comma-join into one value.
    final paramType = p.type;
    if (paramType is RenderArray) {
      final dartName = p.dartParameterName(context.quirks);
      final conversion = _elementWireConversion(paramType, context);
      final mapCall = conversion == null
          ? ".join(',')"
          : ".map((e) => $conversion).join(',')";
      final value = p.isNullable ? '?$dartName?$mapCall' : '$dartName$mapCall';
      return "$innerIndent'${p.name}': $value,";
    }
    final prefix = p.isNullable ? '?' : '';
    final scalar = _runtimeSource(p.toJsonExpression(context));
    return "$innerIndent'${p.name}': $prefix$scalar,";
  }

  List<String> _authRequestLines(String indent) {
    // Serialized for a runtime destination: `invokeApi`'s argument list is
    // not a constant context, so the `const` keyword gets written at the
    // outermost const-able point (and, by [DartExpressionSerializer], only
    // there). `dart format` owns the wrapping, so no indent is threaded in.
    final auth = _maybeRuntimeSource(authExpression());
    if (auth == null) return const [];
    return ['${indent}authRequest: $auth,'];
  }

  /// Render the `multipart/form-data` field/file assembly that precedes
  /// the `invokeApiMultipart` call — empty string for non-multipart
  /// endpoints. Produced in Dart so the template stays flat; see the
  /// docs on [_buildInvokeArgs] for why.
  ///
  /// Output ends with a trailing newline when non-empty so the template
  /// can splice it inline before `final response = ...` without caring
  /// whether it's empty.
  String _buildMultipartAssembly(SchemaRenderer context) {
    final body = requestBody;
    if (body is! RenderRequestBodyMultipart) return '';

    final parts = body.partsFor(context);
    final textFields = parts.textParts;
    final files = parts.files;

    final outer = _methodBodyIndent;
    final inner = outer + _nestedStep;
    final lines = <String>[];

    if (body.isRequired) {
      // Body is non-nullable at the Dart call site, so we can read its
      // fields directly into the initializing literals.
      lines
        ..addAll(_multipartFieldsLiteral(outer, inner, textFields))
        ..addAll(_multipartFilesLiteral(outer, inner, files))
        ..addAll(_multipartNullableFieldBlocks(outer, inner, textFields))
        ..addAll(_multipartNullableFileBlocks(outer, inner, files));
    } else {
      // Nullable body: empty literals up front, populate inside
      // `if (body != null) { ... }` so field access doesn't NPE.
      final paramName = body.dartParameterName(context.quirks);
      final guarded = inner;
      final guardedInner = guarded + _nestedStep;
      lines
        ..add('${outer}final multipartFields = <String, String>{};')
        ..add('${outer}final multipartFiles = <http.MultipartFile>[];')
        ..add('${outer}if ($paramName != null) {');
      for (final s in textFields.where((s) => !s.isNullable)) {
        lines.add(_fieldSetLine(guarded, s.fieldName, s.requiredValueExpr));
      }
      lines.addAll(
        _multipartNullableFieldBlocks(guarded, guardedInner, textFields),
      );
      for (final f in files.where((f) => !f.isNullable)) {
        lines.add(_fileAddLine(guarded, f.fieldName, f.dartAccess));
      }
      lines
        ..addAll(_multipartNullableFileBlocks(guarded, guardedInner, files))
        ..add('$outer}');
    }

    return '${lines.join('\n')}\n';
  }

  /// Non-nullable text fields as a map literal. Only used when the
  /// body itself is non-nullable (otherwise they go inside the null
  /// guard, not a literal).
  List<String> _multipartFieldsLiteral(
    String outer,
    String inner,
    List<MultipartTextPart> textFields,
  ) {
    final nonNull = textFields.where((s) => !s.isNullable).toList();
    return [
      '${outer}final multipartFields = <String, String>{',
      for (final s in nonNull)
        _fieldLiteralEntry(inner, s.fieldName, s.requiredValueExpr),
      '$outer};',
    ];
  }

  /// Non-nullable file parts as a list literal. Same shape rule as
  /// [_multipartFieldsLiteral].
  List<String> _multipartFilesLiteral(
    String outer,
    String inner,
    List<MultipartFilePart> files,
  ) {
    final nonNull = files.where((f) => !f.isNullable).toList();
    return [
      '${outer}final multipartFiles = <http.MultipartFile>[',
      for (final f in nonNull)
        _fileLiteralEntry(inner, f.fieldName, f.dartAccess),
      '$outer];',
    ];
  }

  /// Per-field block: captures the nullable property to a local and
  /// assigns to `multipartFields` only when non-null.
  List<String> _multipartNullableFieldBlocks(
    String outer,
    String inner,
    List<MultipartTextPart> textFields,
  ) {
    final out = <String>[];
    for (final s in textFields.where((s) => s.isNullable)) {
      final setStmt = _fieldSetLine('', s.fieldName, s.nullableValueExpr);
      out.addAll([
        '$outer{',
        '${inner}final v = ${s.dartAccess};',
        '${inner}if (v != null) $setStmt',
        '$outer}',
      ]);
    }
    return out;
  }

  /// Per-file block: same shape as [_multipartNullableFieldBlocks] but
  /// for nullable file parts.
  List<String> _multipartNullableFileBlocks(
    String outer,
    String inner,
    List<MultipartFilePart> files,
  ) {
    final out = <String>[];
    for (final file in files.where((f) => f.isNullable)) {
      final addStmt = _fileAddLine('', file.fieldName, 'f');
      out.addAll([
        '$outer{',
        '${inner}final f = ${file.dartAccess};',
        '${inner}if (f != null) $addStmt',
        '$outer}',
      ]);
    }
    return out;
  }

  /// `${indent}'$fieldName': $valueExpr,` — one entry of a
  /// `multipartFields` map literal.
  String _fieldLiteralEntry(
    String indent,
    String fieldName,
    String valueExpr,
  ) => "$indent'$fieldName': $valueExpr,";

  /// `${indent}multipartFields['$fieldName'] = $valueExpr;` — a single
  /// assignment into `multipartFields` (used inside the null guard or
  /// when populating a pre-declared empty map).
  String _fieldSetLine(String indent, String fieldName, String valueExpr) =>
      "${indent}multipartFields['$fieldName'] = $valueExpr;";

  /// Emits one `http.MultipartFile.fromBytes(...)` entry inside a
  /// `multipartFiles` list literal. `filename:` is hardcoded to the
  /// form field name — a known v1 limitation, see CHANGELOG.md.
  String _fileLiteralEntry(String indent, String fieldName, String bytes) {
    final constructor =
        "http.MultipartFile.fromBytes('$fieldName', $bytes, "
        "filename: '$fieldName')";
    return '$indent$constructor,';
  }

  /// Emits `multipartFiles.add(http.MultipartFile.fromBytes(...));` —
  /// used inside the null guard or when populating a pre-declared empty
  /// list.
  String _fileAddLine(String indent, String fieldName, String bytes) {
    final constructor =
        "http.MultipartFile.fromBytes('$fieldName', $bytes, "
        "filename: '$fieldName')";
    return '${indent}multipartFiles.add($constructor);';
  }

  /// Build the per-status sealed-class context for a multi-status
  /// operation. The synthesized class name comes from the naming pass
  /// (see `MultiStatusReturn.wrapperTypeName`), so a top-level schema
  /// that already claimed `<op>Response` keeps the bare name and the
  /// wrapper picks up a `_2`-style suffix.
  ///
  /// Sorting on the status code guarantees `200` ahead of `204` in
  /// the emitted switch regardless of spec ordering.
  _MultiStatusContext _buildMultiStatusContext(
    MultiStatusReturn multiStatus,
    SchemaRenderer context,
  ) {
    final typeName = multiStatus.wrapperTypeName;
    final sortedEntries = multiStatus.responses.entries.toList()
      ..sort((a, b) => a.key.compareTo(b.key));
    final statuses = [
      for (final entry in sortedEntries)
        _StatusInfo(
          statusCode: entry.key,
          wrapperTypeName: '$typeName${entry.key}',
          // RenderVoid means the response has no body — null in
          // [_StatusInfo.body] signals the wrapper for that status
          // carries no `value` field.
          body: entry.value.content is RenderVoid ? null : entry.value.content,
          contentType: entry.value.contentType,
        ),
    ];
    return _MultiStatusContext(
      typeName: typeName,
      wrapperClassDefs: statuses.map((s) => s.wrapperClassDef()).toList(),
      switchCases: statuses.map((s) => s.switchCase(context)).toList(),
    );
  }

  @override
  Map<String, dynamic> toTemplateContext(
    SchemaRenderer context, {
    String? removePrefix,
  }) {
    // Parameters as passed to the Dart function call, including the request
    // body if it exists.
    final dartParameters = <CanBeParameter>[...parameters, ?requestBody];

    // Pattern-match on the operation's return shape: single schema
    // (the legacy / non-multi-status path) or multi-status (synthesize
    // a sealed class inline in the api file and dispatch on
    // `response.statusCode` in the method body). The sealed wrapper
    // lives in the api file rather than the schema graph because
    // status-code multiplexing is operation-level — the dispatch key
    // is the HTTP status, not anything in the JSON body.
    final returnShape = operation.returnShape;
    final String returnType;
    final bool isVoidReturn;
    final DartExpression? responseFromJson;
    final _MultiStatusContext? multiStatusContext;
    switch (returnShape) {
      case SingleSchemaReturn(:final schema):
        multiStatusContext = null;
        returnType = schema.typeName;
        isVoidReturn = schema is RenderVoid;
        if (schema is RenderBinary) {
          // A binary body is raw bytes, not text — source it from
          // `response.bodyBytes` (a `Uint8List`) so the `Uint8List` return
          // type isn't handed the `String` `response.body`. No `fromJson`:
          // the bytes are the value.
          responseFromJson = _responseBodyBytes;
        } else {
          // When the success response advertises a non-JSON content
          // type, `_responseBodySource` returns the raw `response.body`
          // string instead of the `jsonDecode(...)` expression — keeps
          // github's `/zen`, `/octocat`, `/markdown`, `/markdown/raw`
          // (text/plain) emitting clean Dart. The non-JSON path then
          // falls back to the raw body without going through
          // `fromJsonExpression`, since that expects JSON-shaped input.
          final source = _ResponseBodySource.of(operation.successContentType);
          responseFromJson = source == _ResponseBodySource.raw
              ? source.expression
              : schema.fromJsonExpression(
                  source.expression,
                  context,
                  jsonIsNullable: false,
                  dartIsNullable: false,
                );
        }
      case MultiStatusReturn():
        multiStatusContext = _buildMultiStatusContext(returnShape, context);
        returnType = multiStatusContext.typeName;
        isVoidReturn = false;
        responseFromJson = null;
    }

    // See [RenderOperation.errorSchema] for which error body this is
    // and why it lives on the operation.
    final errorSchema = operation.errorSchema;
    final hasErrorType = errorSchema != null;
    final errorType = errorSchema?.typeName;
    final errorFromJson = errorSchema?.fromJsonExpression(
      _ResponseBodySource.json.expression,
      context,
      jsonIsNullable: false,
      dartIsNullable: false,
    );

    final namedParameters = dartParameters.where((p) => p.isRequired == false);
    final positionalParameters = dartParameters.where(
      (p) => p.isRequired == true,
    );

    // Cookie parameters are not supported; fail loudly at render time.
    final cookieParameters = parameters
        .where((p) => p.inLocation == ParameterLocation.cookie)
        .toList();
    if (cookieParameters.isNotEmpty) {
      _unimplemented(
        'Cookie parameters are not yet supported.',
        operation.pointer,
      );
    }

    final validationStatementsString = indentWithTrailingNewline(
      validationStatements(context.quirks),
      indent: 8,
      extraTrailingNewline: true,
    );

    Iterable<Map<String, dynamic>> toTemplateContexts(
      Iterable<CanBeParameter> parameters,
    ) => parameters.map((p) => p.toTemplateContext(context));

    // Endpoints could get summary and description from
    // *both* Path and Operation objects.  Unclear how we should display both.
    // Currently only displaying summary/description from the Operation.
    final methodName = this.methodName
        .replaceAll(removePrefix ?? '', '')
        .lowerFirst();
    return {
      'endpoint_doc_comment': createDocCommentFromParts(
        title: summary,
        body: description,
        parameterExamples: _parameterExampleLines(context.quirks),
        indent: 4,
      ),
      'methodName': methodName,
      // Parameters grouped for dart parameter generation.
      'positionalParameters': toTemplateContexts(positionalParameters),
      'hasNamedParameters': namedParameters.isNotEmpty,
      'namedParameters': toTemplateContexts(namedParameters),
      // Both the invoke call args and the multipart field/file assembly
      // are pre-rendered in Dart — the template is a thin wrapper that
      // interpolates the results. Keeps the method/path/query/body/
      // headers/auth emission in one place, and avoids mustache's
      // standalone-partial indentation quirks on empty sections.
      'invokeMethodName': isMultipart ? 'invokeApiMultipart' : 'invokeApi',
      'invokeArgs': _buildInvokeArgs(context),
      'multipartAssembly': _buildMultipartAssembly(context),
      'returnType': returnType,
      'isVoidReturn': isVoidReturn,
      'responseFromJson': _maybeRuntimeSource(responseFromJson),
      // Mustache treats a non-empty map as a single-iteration section
      // that pushes the map onto the context — so
      // `{{#multiStatus}}...{{/multiStatus}}` doubles as both the
      // presence check and the scope opener for `typeName`,
      // `wrapperClassDefs`, `switchArms`. The `false` sentinel (rather
      // than null) matters for the `{{^multiStatus}}` inverse: the
      // mustache_template package errors on null in inverse sections
      // but treats `false` correctly as "render the inverse."
      'multiStatus': multiStatusContext == null
          ? false
          : {
              'typeName': multiStatusContext.typeName,
              'wrapperClassDefs': multiStatusContext.wrapperClassDefs,
              'switchCases': multiStatusContext.switchCases,
            },
      'hasErrorType': hasErrorType,
      'errorType': errorType,
      'errorFromJson': _maybeRuntimeSource(errorFromJson),
      'validationStatements': validationStatementsString,
    };
  }
}

/// The spec calls these tags, but the Dart openapi generator groups endpoints
/// by tag into an API class so we do too.
class Api {
  const Api({
    required this.snakeName,
    required this.endpoints,
    required this.description,
    required this.removePrefix,
  });

  final String snakeName;
  final String description;
  final List<Endpoint> endpoints;
  final String? removePrefix;

  String get clientVariableName {
    final name = toLowerCamelCase(snakeName);
    if (isReservedWord(name)) {
      return '${name}Api';
    }
    return name;
  }

  String get className => '${toUpperCamelCase(snakeName)}Api';
  String get fileName => '${snakeName.toLowerCase()}_api';
}

class RenderPath {
  const RenderPath({required this.path, required this.operations});

  /// The path of the resolved path.
  final String path;

  /// The operations of the resolved path.
  final List<RenderOperation> operations;
}

class RenderOperation {
  const RenderOperation({
    required this.pointer,
    required this.method,
    required this.path,
    required this.snakeName,
    required this.parameters,
    required this.requestBody,
    required this.responses,
    required this.rangeResponses,
    required this.defaultResponse,
    required this.returnShape,
    required this.tags,
    required this.summary,
    required this.description,
    required this.securityRequirements,
  });

  /// The method of the resolved operation.
  final Method method;

  final JsonPointer pointer;

  /// The path of the resolved operation.
  final String path;

  /// The snake name of the resolved operation.
  final String snakeName;

  /// The parameters of the resolved operation.
  final List<RenderParameter> parameters;

  /// The request body of the resolved operation.
  final RenderRequestBody? requestBody;

  /// The responses of the resolved operation. Only contains responses
  /// keyed by a specific status code — range (`NXX`) responses are on
  /// [rangeResponses] and the `default:` response (if any) is on
  /// [defaultResponse].
  final List<RenderResponse> responses;

  /// The range (`NXX`) responses of the resolved operation, if any.
  /// `2XX` ranges feed the return-type determination on the operation
  /// method; all range schemas are walked for import/emission like any
  /// other response.
  final List<RenderRangeResponse> rangeResponses;

  /// The `default:` (catch-all) response, if the operation declares one.
  /// Its schema is walked for import/emission like any other response,
  /// so the referenced type is always generated even when no specific
  /// 4xx/5xx status code also references it.
  final RenderDefaultResponse? defaultResponse;

  /// The error body the API method's `throw` names, or null when it
  /// throws untyped.
  ///
  /// Collects error-body schemas from `default:`, `4XX:` and `5XX:` and
  /// deduplicates them by structural equality. When they all resolve to
  /// one schema — the common case, since most specs alias every error
  /// to a single `ErrorResponse` — the method emits a typed
  /// `ApiException<ErrorType>`. When they disagree, it falls back to
  /// untyped: picking one would lie to callers about what they will
  /// actually catch.
  ///
  /// `RenderNoJson` subclasses (`RenderVoid`, `RenderBinary`) are
  /// skipped. A `default:` response with no content resolves to
  /// `RenderVoid`, whose `typeName` is `void`, which used to emit
  /// uncompilable `ApiException<void>(body: ,)` (petstore, whose
  /// 4xx/default responses carry only a description).
  ///
  /// A getter rather than a local in the template-context builder
  /// because the import decision has to ask the same question: the api
  /// file names this type, so it imports it. Two readers of one
  /// definition cannot disagree about what was emitted.
  RenderSchema? get errorSchema {
    final candidates = <RenderSchema>[
      ?defaultResponse?.content,
      ...rangeResponses
          .where(
            (e) =>
                e.range == StatusCodeRange.clientError ||
                e.range == StatusCodeRange.serverError,
          )
          .map((e) => e.content),
    ];
    final distinct = <RenderSchema>[];
    for (final schema in candidates) {
      if (schema is RenderNoJson) continue;
      if (!distinct.any((e) => e.equalsIgnoringName(schema))) {
        distinct.add(schema);
      }
    }
    return distinct.length == 1 ? distinct.first : null;
  }

  /// What the operation's API method returns. Sealed so emit-time code
  /// (template context, walker) pattern-matches on the case rather than
  /// branching on a nullable. The two cases:
  ///
  /// - [SingleSchemaReturn]: one schema for every success path
  ///   (no-content `RenderVoid`, a single 2xx, all-2xx-identical, or
  ///   the legacy oneOf fallback for range-mixed cases). Today's
  ///   default; matches the pre-multi-status world.
  /// - [MultiStatusReturn]: structurally-different bodies per HTTP
  ///   status (e.g. github's `200` → user, `202` → accepted job).
  ///   Lives here rather than in the schema graph because status-code
  ///   multiplexing is operation-level — the dispatch key is the HTTP
  ///   status, not anything in the JSON body. Conflating it with
  ///   [RenderOneOf] (which dispatches on body shape) is what
  ///   produced the legacy `UnimplementedError` stub.
  final OperationReturn returnShape;

  /// Wire content type of the response that drove [returnShape] — first
  /// matching 2xx, then `2XX` range. `null` when the operation has no
  /// successful response body. Used by the operation renderer to skip
  /// `jsonDecode` when the body isn't JSON.
  String? get successContentType {
    for (final r in responses) {
      if (r.statusCode >= 200 && r.statusCode < 300) {
        return r.contentType;
      }
    }
    for (final r in rangeResponses) {
      if (r.range == StatusCodeRange.success) {
        return r.contentType;
      }
    }
    return null;
  }

  /// The tags of the resolved operation.
  final List<String> tags;

  /// The summary of the resolved operation.
  final String? summary;

  /// The description of the resolved operation.
  final String? description;

  /// The security requirements of the resolved operation.
  final List<ResolvedSecurityRequirement> securityRequirements;
}

/// What an operation's API method returns at the Dart level. Sealed so
/// the renderer pattern-matches exhaustively on the two emit shapes.
sealed class OperationReturn {
  const OperationReturn();
}

/// One schema covers every successful response path: a single 2xx,
/// multiple 2xx with the same body, the no-content [RenderVoid] case,
/// or the legacy `RenderOneOf` fallback for range-mixed responses.
/// The API method's return type is `Future<schema.typeName>`.
@immutable
final class SingleSchemaReturn extends OperationReturn {
  const SingleSchemaReturn(this.schema);

  final RenderSchema schema;
}

/// Multi-status response: the operation has multiple successful
/// responses with structurally-different body schemas. The Dart emit
/// is a sealed parent (named after the operation, e.g.
/// `ReposGetResponse`) plus one `final` subclass per status code; the
/// API method body switches on `response.statusCode` to construct the
/// right subclass.
@immutable
final class MultiStatusReturn extends OperationReturn {
  const MultiStatusReturn({
    required this.responses,
    required this.wrapperTypeName,
  });

  /// Status code → response. Carries content-type per status so each
  /// switch arm can pick the right decode (`jsonDecode` vs raw
  /// `response.body`); a `RenderVoid` content signals no body and
  /// produces a value-less wrapper subclass.
  final Map<int, RenderResponse> responses;

  /// Camel-case Dart name for the synthesized sealed class. Pre-resolved
  /// via the naming pass on the operation's pointer so a top-level
  /// component schema sharing the un-suffixed `<op>Response` name
  /// (which Dart-imports into the api file) doesn't shadow itself.
  /// Per-status subclasses are this name with the status-code suffix
  /// (`<wrapper>200`, `<wrapper>201`, …).
  final String wrapperTypeName;
}

/// The `bodyContentType` value `ApiClient.invokeApi` defaults to (see
/// the `bodyContentType` parameter default in `api_client.dart`). This
/// describes the *client's* default, not any one body's content type —
/// a body whose own `bodyContentTypeExpression` equals it omits the
/// redundant `bodyContentType:` argument at the call site. It happens to
/// be JSON today, but a JSON body still declares its type literally, so
/// the two would diverge cleanly if the default ever changed.
const defaultBodyContentTypeExpression = 'BodyContentType.json';

/// Sealed so the endpoint arg-builder can pattern-match exhaustively on
/// the body shape: the multipart path emits `fields:`/`files:`, every
/// other subclass ([RenderRequestBodySimple]) emits `body:`/
/// `bodyContentType:`. Adding a new shape is a compile error in the
/// arg-builder switch until it's handled.
sealed class RenderRequestBody implements CanBeParameter {
  const RenderRequestBody({
    required this.schema,
    required this.description,
    required this.isRequired,
  });

  /// The schema of the request body.
  final RenderSchema schema;

  /// The description of the request body.
  final String? description;

  /// Whether the request body is required.
  @override
  final bool isRequired;

  @override
  String? get validationCall => schema.validationCall;

  @override
  String dartParameterName(Quirks quirks) =>
      // TODO(eseidel): Is there a name we can use instead of the typename?
      // Removing any template parameters from the type.
      schema.typeName.lowerFirst().split('<').first;
}

/// Request bodies that pass through `ApiClient.invokeApi` as a single
/// `body:` argument paired with a [bodyContentTypeExpression]. Groups
/// the JSON/octet-stream/text-plain shapes so the multipart shape (which
/// uses `fields:`/`files:` on `invokeApiMultipart` instead) doesn't
/// carry two methods it never uses.
abstract class RenderRequestBodySimple extends RenderRequestBody {
  const RenderRequestBodySimple({
    required super.schema,
    required super.description,
    required super.isRequired,
  });

  /// The `BodyContentType.xxx` Dart expression that pairs with this
  /// body, passed to `ApiClient.invokeApi(bodyContentType: ...)`.
  String get bodyContentTypeExpression;

  /// Whether [bodyContentTypeExpression] is the value `invokeApi`
  /// defaults `bodyContentType` to. When true the operation renderer
  /// omits the redundant argument (`avoid_redundant_argument_values`).
  bool get isDefaultBodyContentType =>
      bodyContentTypeExpression == defaultBodyContentTypeExpression;

  /// The Dart expression for the `body:` argument to `invokeApi`. For
  /// JSON: the map/list the client will `jsonEncode`. For octet-stream
  /// or text/plain: the parameter itself, passed through as-is.
  String bodyExpression(SchemaRenderer context);
}

/// Shared template-context for the named-parameter slot in the endpoint
/// method signature. Only emits the keys that `api.mustache` actually
/// reads — `type`, `nullableType`, `dartName`, `required`,
/// `hasDefaultValue`, `defaultValue`. Matches the subset consumed from
/// [RenderParameter.toTemplateContext].
Map<String, dynamic> _requestBodyParameterContext(
  RenderRequestBody body,
  SchemaRenderer context,
) {
  return {
    'dartName': body.dartParameterName(context.quirks),
    'required': body.isRequired,
    'hasDefaultValue': body.schema.defaultValue != null,
    'defaultValue': _maybeRuntimeSource(
      body.schema.slotDefaultExpression(context),
    ),
    'type': body.schema.typeName,
    'nullableType': body.schema.nullableTypeName(context),
  };
}

class RenderRequestBodyJson extends RenderRequestBodySimple {
  const RenderRequestBodyJson({
    required super.schema,
    required super.description,
    required super.isRequired,
  });

  @override
  String get bodyContentTypeExpression => 'BodyContentType.json';

  @override
  String bodyExpression(SchemaRenderer context) => _runtimeSource(
    schema.toJsonExpression(
      DartIdentifier(dartParameterName(context.quirks)),
      context,
      dartIsNullable: !isRequired,
    ),
  );

  @override
  Map<String, dynamic> toTemplateContext(SchemaRenderer context) =>
      _requestBodyParameterContext(this, context);
}

class RenderRequestBodyOctetStream extends RenderRequestBodySimple {
  const RenderRequestBodyOctetStream({
    required super.schema,
    required super.description,
    required super.isRequired,
  });

  @override
  String get bodyContentTypeExpression => 'BodyContentType.octetStream';

  @override
  String bodyExpression(SchemaRenderer context) =>
      dartParameterName(context.quirks);

  @override
  Map<String, dynamic> toTemplateContext(SchemaRenderer context) =>
      _requestBodyParameterContext(this, context);
}

class RenderRequestBodyTextPlain extends RenderRequestBodySimple {
  const RenderRequestBodyTextPlain({
    required super.schema,
    required super.description,
    required super.isRequired,
  });

  @override
  String get bodyContentTypeExpression => 'BodyContentType.textPlain';

  @override
  String bodyExpression(SchemaRenderer context) =>
      dartParameterName(context.quirks);

  @override
  Map<String, dynamic> toTemplateContext(SchemaRenderer context) =>
      _requestBodyParameterContext(this, context);
}

/// `application/x-www-form-urlencoded` request body. The schema must
/// resolve to a `RenderObject`; the body renders as a `Map<String, String>`
/// literal that `http` encodes as `key=value&...` form fields.
///
/// A scalar property (string/number/bool/pod/enum/date) becomes its plain
/// string value, and an array of scalars comma-joins into one field. A
/// complex property (a bare object, an array of objects, an arbitrary-JSON
/// blob) is `jsonEncode`d into its field, matching OpenAPI's default
/// `application/json` encoding for a complex form field.
///
/// Unlike multipart there is no file-part path — form-urlencoded has no
/// way to carry binary — so a `format: binary` property (or any other type
/// with no JSON representation) is a render-time `FormatException`.
class RenderRequestBodyFormUrlEncoded extends RenderRequestBodySimple {
  const RenderRequestBodyFormUrlEncoded({
    required super.schema,
    required super.description,
    required super.isRequired,
  });

  @override
  String get bodyContentTypeExpression => 'BodyContentType.formUrlEncoded';

  @override
  String bodyExpression(SchemaRenderer context) {
    final object = _requireObjectBody(this, MimeType.formUrlEncoded.value);
    final paramName = dartParameterName(context.quirks);
    // An optional body makes the whole parameter nullable, so even its
    // required fields are read through `?.` and gated behind a null check.
    final bodyNullable = !isRequired;
    final entries = <String>[];
    for (final entry in object.properties.entries) {
      final jsonName = entry.key;
      final property = entry.value;
      final dartName = variableSafeName(context.quirks, jsonName);
      final fieldNullable = object.propertyRendersNullable(
        jsonName,
        property,
        context,
      );
      final access = bodyNullable
          ? '$paramName?.$dartName'
          : '$paramName.$dartName';
      // A nullable field (or an optional body making every field nullable)
      // reads through an `if (... case final value?)` guard, so the wire
      // value is built against the captured `value`; otherwise straight
      // off `access`.
      final guarded = bodyNullable || fieldNullable;
      final valueExpr = _formUrlEncodedFieldSource(
        property,
        guarded ? 'value' : access,
        context,
      );
      entries.add(
        guarded
            ? "if ($access case final value?) '$jsonName': $valueExpr"
            : "'$jsonName': $valueExpr",
      );
    }
    return '<String, String>{${entries.join(', ')}}';
  }

  @override
  Map<String, dynamic> toTemplateContext(SchemaRenderer context) =>
      _requestBodyParameterContext(this, context);
}

/// One text part in a `multipart/form-data` body — a scalar property, or
/// an array of scalars comma-joined into one field value.
class MultipartTextPart extends Equatable {
  const MultipartTextPart({
    required this.fieldName,
    required this.dartAccess,
    required this.isNullable,
    required this.requiredValueExpr,
    required this.nullableValueExpr,
  });

  /// The spec-side form-field name (also the JSON property name).
  final String fieldName;

  /// The Dart expression to read the property from the body object,
  /// e.g. `pet.name`.
  final String dartAccess;

  /// Whether [dartAccess] is a nullable expression — drives whether the
  /// generator emits a direct assignment or a captured-local null check.
  final bool isNullable;

  /// The non-null value expression used when the property is required
  /// and accessed directly (e.g. `pet.capturedAt.toIso8601String()`).
  final String requiredValueExpr;

  /// The non-null value expression used inside a null-check block where
  /// the local has already been captured as `v` (e.g. `v.toIso8601String()`).
  final String nullableValueExpr;

  @override
  List<Object?> get props => [
    fieldName,
    dartAccess,
    isNullable,
    requiredValueExpr,
    nullableValueExpr,
  ];
}

/// One file part in a `multipart/form-data` body (spec-side
/// `format: binary` / Dart-side `Uint8List`).
class MultipartFilePart extends Equatable {
  const MultipartFilePart({
    required this.fieldName,
    required this.dartAccess,
    required this.isNullable,
  });

  final String fieldName;
  final String dartAccess;
  final bool isNullable;

  @override
  List<Object?> get props => [fieldName, dartAccess, isNullable];
}

/// `multipart/form-data` request body. The schema must resolve to a
/// `RenderObject` whose properties are scalars (string/number/bool/pod/
/// enum), arrays of scalars, or binary (`format: binary` → `Uint8List`).
/// Scalars become text parts; an array of scalars comma-joins into one
/// text part; binaries become file parts in the generated endpoint method.
///
/// Unsupported on purpose (v1): arrays-of-files, nested objects as
/// fields, per-part `encoding.contentType`, and filenames other than the
/// property name.
class RenderRequestBodyMultipart extends RenderRequestBody {
  const RenderRequestBodyMultipart({
    required super.schema,
    required super.description,
    required super.isRequired,
  });

  /// Classify this body's properties into text parts (scalars, and arrays
  /// of scalars comma-joined) and file parts.
  /// Throws [FormatException] at render time when the schema shape is
  /// outside the v1-supported set — the ground truth for what the
  /// generator will emit. Called once from `_buildMultipartAssembly`
  /// on every render cycle, so schema-shape errors surface even though
  /// no eager validation happens at construction time.
  ({List<MultipartTextPart> textParts, List<MultipartFilePart> files}) partsFor(
    SchemaRenderer context,
  ) {
    final object = _requireObjectBody(this, MimeType.multipartFormData.value);
    final paramName = dartParameterName(context.quirks);
    final textParts = <MultipartTextPart>[];
    final files = <MultipartFilePart>[];
    for (final entry in object.properties.entries) {
      final jsonName = entry.key;
      final property = entry.value;
      final dartName = variableSafeName(context.quirks, jsonName);
      final dartAccess = '$paramName.$dartName';
      final isNullable = object.propertyRendersNullable(
        jsonName,
        property,
        context,
      );

      if (property is RenderBinary) {
        files.add(
          MultipartFilePart(
            fieldName: jsonName,
            dartAccess: dartAccess,
            isNullable: isNullable,
          ),
        );
        continue;
      }
      // A scalar becomes one text field; an array of scalars comma-joins
      // into one (see [_wireStringFieldSource]). `requiredValueExpr` reads
      // straight off `dartAccess`; `nullableValueExpr` reads off the `v`
      // local the nullable-field block captures the property into.
      final requiredValueExpr = _wireStringFieldSource(
        property,
        dartAccess,
        context,
      );
      final nullableValueExpr = _wireStringFieldSource(property, 'v', context);
      if (requiredValueExpr == null || nullableValueExpr == null) {
        throw FormatException(
          'multipart/form-data property must be a scalar, an array of '
          'scalars, or binary (got ${property.runtimeType} for "$jsonName") '
          'at ${property.common.pointer}',
        );
      }
      textParts.add(
        MultipartTextPart(
          fieldName: jsonName,
          dartAccess: dartAccess,
          isNullable: isNullable,
          requiredValueExpr: requiredValueExpr,
          nullableValueExpr: nullableValueExpr,
        ),
      );
    }
    return (textParts: textParts, files: files);
  }

  @override
  Map<String, dynamic> toTemplateContext(SchemaRenderer context) =>
      _requestBodyParameterContext(this, context);
}

/// The body's [RenderObject] schema, or a [FormatException] naming
/// [contentType] when it is some other shape. Both form-shaped request
/// bodies (multipart, form-urlencoded) encode an object's properties into
/// named fields, so both require an object here.
RenderObject _requireObjectBody(RenderRequestBody body, String contentType) {
  final object = body.schema;
  if (object is! RenderObject) {
    throw FormatException(
      '$contentType request body schema must be an object '
      '(got ${object.runtimeType}) at ${body.schema.common.pointer}',
    );
  }
  return object;
}

/// The Dart expression that renders [property] as one `Map<String, String>`
/// wire field, reading from [base]. Shared by the multipart text-part and
/// form-urlencoded builders — both encode a scalar property to a single
/// string field.
DartExpression _wireStringFieldExpr(
  RenderSchema property,
  DartExpression base,
  SchemaRenderer context,
) {
  final jsonExpr = property.toJsonExpression(
    base,
    context,
    dartIsNullable: false,
  );
  // Was `jsonStorageType(isNullable: false) == 'String'` — the same
  // question [_stringifyWireValue] already answers from [DartType],
  // spelled as a comparison against rendered text.
  return _stringifyWireValue(property, jsonExpr);
}

/// Source for [property] rendered as one `Map<String, String>` wire field
/// value, reading from the Dart expression [access]. A scalar stringifies
/// to a single value; an array of scalars comma-joins into one value — the
/// `explode: false` form that header and query arrays already use (via the
/// shared [Endpoint._wireMappedElements]), and what form-shaped servers
/// that document a "comma separated list of values" expect.
///
/// Returns null when [property] is neither shape (a nested array, an array
/// of objects, a bare object, …), leaving the caller to throw a
/// content-type-specific [FormatException] naming the property.
String? _wireStringFieldSource(
  RenderSchema property,
  String access,
  SchemaRenderer context,
) {
  if (_isWireStringScalar(property)) {
    return _runtimeSource(
      _wireStringFieldExpr(property, DartIdentifier(access), context),
    );
  }
  if (property is RenderArray && _isWireStringScalar(property.items)) {
    final items = Endpoint._wireMappedElements(property, access, context);
    return "$items.join(',')";
  }
  return null;
}

/// Source for [property] rendered as one `Map<String, String>` field of an
/// `application/x-www-form-urlencoded` body, reading from [access].
///
/// A scalar or array of scalars renders as [_wireStringFieldSource] does. A
/// complex value (a bare object, an array of objects, an arbitrary-JSON
/// blob) is `jsonEncode`d into its field, matching OpenAPI's default
/// `application/json` encoding for a complex form field. A [RenderNoJson]
/// type (binary, void) has no JSON representation and a form body can't
/// carry it, so it stays a render-time [FormatException] naming the type.
String _formUrlEncodedFieldSource(
  RenderSchema property,
  String access,
  SchemaRenderer context,
) {
  final scalar = _wireStringFieldSource(property, access, context);
  if (scalar != null) return scalar;
  if (property is RenderNoJson) {
    throw FormatException(
      'application/x-www-form-urlencoded cannot carry a '
      '${property.runtimeType} property at ${property.common.pointer}',
    );
  }
  final jsonExpr = property.toJsonExpression(
    DartIdentifier(access),
    context,
    dartIsNullable: false,
  );
  return _runtimeSource(
    DartFunctionCall(name: 'jsonEncode', arguments: [jsonExpr]),
  );
}

/// Whether [schema] serializes to a single value on the wire, and so can
/// become one `Map<String, String>` field of a multipart or
/// form-urlencoded body.
///
/// An allowlist rather than a structural test on
/// [RenderSchema.jsonStorageDartType] ("not map- or list-shaped"), for
/// two reasons that both come down to failing loudly. A new
/// [RenderSchema] subtype should arrive here as a `FormatException`
/// naming the type rather than be waved through to
/// [_wireStringFieldExpr] and emit something quietly wrong. And the
/// structural form isn't total over the tree anyway: [RenderBinary]
/// extends [RenderNoJson], whose override of that getter throws.
bool _isWireStringScalar(RenderSchema schema) {
  // `isSingleWireValue` in `query_encoding.dart` asks the same "one value
  // on the wire" question over `Resolved*`. The two can't share an
  // implementation — that one is deliberately Dart-blind and this one
  // needs `RenderBinary` handled by the file-part branch above — but they
  // describe one rule, so a divergence between them is a bug in one of
  // them by construction. Change both or neither.
  return schema is RenderString ||
      schema is RenderInteger ||
      schema is RenderNumber ||
      schema is RenderPod ||
      schema is RenderEnum ||
      // `Date.toJson()` is a `String`, exactly the wire value a multipart
      // text field carries.
      schema is RenderDate ||
      // Base64 bytes (`format: byte` or `contentEncoding: base64`) are a
      // distinct type from [RenderBinary], so the file-part branch above
      // does not cover them. The wire value is the base64 `String` — a
      // text field, not a file.
      schema is RenderBase64Bytes;
}

class RenderResponse {
  const RenderResponse({
    required this.statusCode,
    required this.description,
    required this.content,
    required this.contentType,
  });

  /// The status code of the resolved response.
  final int statusCode;

  /// The description of the resolved response.
  final String description;

  /// The resolved content of the resolved response.
  final RenderSchema content;

  /// Wire content type of [content] (e.g. `application/json`,
  /// `text/plain`). `null` when the response has no body.
  final String? contentType;
}

/// A range (`NXX`) response on an operation. Shares the description +
/// content shape with [RenderResponse] but is keyed by a
/// [StatusCodeRange] rather than an exact code.
class RenderRangeResponse {
  const RenderRangeResponse({
    required this.range,
    required this.description,
    required this.content,
    required this.contentType,
  });

  /// Which `NXX` range this response covers.
  final StatusCodeRange range;

  /// The description of the resolved range response.
  final String description;

  /// The resolved content of the resolved range response.
  final RenderSchema content;

  /// Wire content type of [content]; see [RenderResponse.contentType].
  final String? contentType;
}

/// The `default:` (catch-all) response on an operation. Shares the
/// description + content shape with [RenderResponse] but carries no
/// status code.
class RenderDefaultResponse {
  const RenderDefaultResponse({
    required this.description,
    required this.content,
    required this.contentType,
  });

  /// The description of the resolved default response.
  final String description;

  /// The resolved content of the resolved default response.
  final RenderSchema content;

  /// Wire content type of [content]; see [RenderResponse.contentType].
  final String? contentType;
}

/// The receiver for a field named [name] inside a generated
/// `bool operator ==(Object other)` body. Bare `$name` reads the
/// field for every name except `other` — which the `Object other`
/// parameter shadows, so a field literally named `other` must keep
/// the `this.` qualifier to stay unambiguous. Every other field omits
/// it (the analyzer's `unnecessary_this` lint would otherwise strip
/// it post-generation).
String _equalsReceiver(String name) => name == 'other' ? 'this.$name' : name;

/// Equality is identity — the default. A [RenderSchema] is a node in the
/// render graph, not a value, so `==` means "the same node."
///
/// A schema's identity for deduplication is its [pointer] — its location,
/// which is also what the rest of the pipeline keys on (the resolver's
/// recursion stack, the naming pass). `toRenderSchema` builds a fresh
/// instance per `$ref` site, so the two collectors that must collapse
/// those — file collection and the per-file name walkers — dedup on
/// [pointer] explicitly, at the call site, rather than through a stand-in
/// `==`/`hashCode` that would compare neither identity nor value.
///
/// Structural sameness across *different* locations (needed to collapse
/// distinct-but-equivalent response bodies) is a separate question
/// answered by [equalsIgnoringName].
abstract class RenderSchema implements ToTemplateContext {
  const RenderSchema({
    required this.common,
    required this.createsNewType,
    this.assignedName,
    this.assignedSnakeName,
  });

  final CommonProperties common;

  /// Dart class name assigned by the naming pass. Populated by
  /// [SpecResolver.toRenderSchema] for every `createsNewType: true`
  /// schema (and for [RenderRecursiveRef], which looks up its
  /// target's name).
  ///
  /// Optional in the constructor only because tests sometimes build
  /// `RenderSchema`s directly without going through `SpecResolver`;
  /// in production every newtype's name is non-null. Subclass
  /// `typeName` getters call [_requireAssignedName] to fail loudly
  /// if a newtype-shaped schema slips through unnamed — that turns
  /// "the lookup silently regressed" into a clear stack trace
  /// pointing at whichever construction site forgot to pass it.
  final String? assignedName;

  /// Snake-case name assigned by the naming pass — used as the file
  /// basename. Paired with [assignedName] (the camel form) by the
  /// allocator: a snake collision IS a camel collision and vice
  /// versa. May differ from `common.snakeName` when a multi-tier
  /// preference list lets the schema upgrade to a shorter name
  /// (e.g. inline oneOf variants with a `title`). Falls through to
  /// `common.snakeName` in [snakeName] when null (tests).
  final String? assignedSnakeName;

  /// Returns [assignedName], or throws if it's null. Use from
  /// `typeName` getters on `createsNewType: true` paths so unnamed
  /// schemas crash loudly at the use site instead of falling back
  /// to a stale snake-derived name.
  String _requireAssignedName() {
    final name = assignedName;
    if (name == null) {
      throw StateError(
        'Naming pass did not assign a name to $runtimeType '
        '(snakeName: $snakeName, pointer: $pointer). Either the '
        'schema was constructed without going through SpecResolver '
        '(test bug — pass `assignedName: …` explicitly) or the '
        'naming-pass walker missed this entity (naming.dart bug).',
      );
    }
    return name;
  }

  /// Snake name for this schema — the file basename when this
  /// schema renders to its own file. Prefers the naming-pass's
  /// allocation (which may shorten via title-derived preferences)
  /// over the parser-synthesized form on `common`.
  String get snakeName => assignedSnakeName ?? common.snakeName;

  /// True when this schema is a smooshed inline-object variant of a
  /// sealed parent — i.e. it'll be rendered as `final class X
  /// extends Y` inline in the parent's file, with no wrapper
  /// subclass. Subclasses other than [RenderObject] always return
  /// false (only objects can extend a sealed class). Used by the
  /// dispatch-mode builders (`_buildPredicateMode`,
  /// `_buildDiscriminatorMode`, `_buildShapeMode`,
  /// `_buildHybridMode`) and `file_renderer` to decide whether to
  /// emit a wrapper / a separate file / a wrapping case-arm call.
  bool get isSmooshed => false;

  /// The schemas structurally nested in this one: object properties and
  /// the open member, array items, map value and key, oneOf variants.
  ///
  /// The render tree is enumerated by two traversals that each need a
  /// node's children — `RenderTreeWalker` ("which schemas must exist, so
  /// each gets a file") and the named-schema collector ("which schemas a
  /// file names, so it imports them"). Routing both through this one
  /// getter is what keeps them from drifting: they can no longer disagree
  /// about a node's children, which for the collector meant a dropped
  /// import (see #289). Each consumer keeps its own policy about what to
  /// do with the children it gets; this only enumerates them.
  ///
  /// Defaults to none — only the container schemas ([RenderObject],
  /// [RenderArray], [RenderMap], [RenderOneOf]) override it. A new subtype
  /// with nested schemas must remember to override too, or it will be
  /// treated as a leaf; that is the accepted cost of not enumerating every
  /// leaf here.
  ///
  /// Order follows the traversals' historical visit order — collectors
  /// fold these into ordered output (imports, exports), so the sequence
  /// is load-bearing, not incidental.
  Iterable<RenderSchema> get children => const [];

  /// The pointer of the resolved schema.
  JsonPointer get pointer => common.pointer;

  /// The title of the resolved schema.
  String? get title => common.title;

  /// The description of the resolved schema.
  String? get description => common.description;

  /// Whether this schema is deprecated.
  bool get isDeprecated => common.isDeprecated;

  /// Whether this schema creates a new type and thus needs to be rendered.
  final bool createsNewType;

  /// The default value of this schema.
  dynamic get defaultValue;

  /// Whether this schema has a default value that cannot be written as a
  /// compile-time constant, and so has to be substituted in an initializer
  /// list rather than as a constructor parameter default.
  bool hasNonConstDefaultValue(SchemaRenderer context) {
    final expression = defaultValueExpression(context);
    return expression != null && !expression.canBeConst;
  }

  Iterable<Import> get additionalImports => const [];

  /// The single `validate(...)` invocation for this schema's own constraints
  /// (receiver excluded, e.g. `validate(min: 0, max: 10)`), or null when it
  /// declares none. Only the leaf value types (string / numeric / array)
  /// carry constraints today; everything else inherits this null.
  //
  // TODO(eseidel): validate the entire subtree of schemas, stopping at any
  // branch that is a new type (those validate themselves during construction).
  String? get validationCall => null;

  /// Whether this schema should call toJson to convert to json.
  /// Subclasses should override this to return true if the schema should call
  /// toJson to convert to json.
  bool get shouldCallToJson => createsNewType;

  /// Whether the generated round-trip test must verify equality by
  /// comparing `toJson()` rather than `==`/`hashCode`.
  ///
  /// A collection newtype (`extension type Foo._(List<T> value)`)
  /// `implements List<T>`, so its `==`/`hashCode` are the List's —
  /// reference-based, not value-based — and two content-equal instances
  /// are neither `==` nor equal-hashed. An extension type cannot override
  /// those, so the round-trip is verified through the JSON form instead.
  /// Scalar newtypes (over `String`/`int`), objects, and enums keep true
  /// value equality, so they stay on the `==`/`hashCode` assertions.
  bool get roundTripByJson => false;

  /// Suffix used to name a [RenderOneOf] wrapper subclass for this
  /// schema in shape dispatch (`<ParentTypeName><wrapperTag>`).
  /// Returns null when this schema can't appear as a shape-dispatch
  /// variant (the runtime-type test wouldn't pin it down, or we
  /// haven't taught the dispatch to handle it yet).
  String? get wrapperTag => null;

  /// Dart type used in the `case T v =>` pattern for shape-based
  /// [RenderOneOf] dispatch (`Map<String, dynamic>`, `int`,
  /// `List<dynamic>`, etc.). Null when this schema isn't eligible.
  /// Two variants in the same oneOf are only distinguishable when
  /// their [jsonShapeKey]s differ.
  String? get jsonShapeKey => null;

  /// Schema-specific data for participating in [RenderOneOf] shape
  /// dispatch as a variant: how the wrapper's `value` field is
  /// typed, how it's built from the matched `v`, how it's serialized
  /// back. Returns null when this schema can't be a dispatch variant
  /// (e.g. unsupported shape, or — for inline pods — when the schema
  /// owns its own newtype class). Override on subclasses; the
  /// default returning null keeps non-participants out.
  ///
  /// [context] is needed so collection variants (Map, Array) can
  /// compose their entry/element conversion expressions through the
  /// inner schema's [fromJsonExpression] / [toJsonExpression].
  _VariantConversion? _variantConversion(SchemaRenderer context) => null;

  /// [expression], with this schema's default substituted when the JSON
  /// value can be null but the value the expression produces still has to
  /// land in a slot that needs one.
  ///
  /// Returns [expression] unchanged when no substitution is called for,
  /// so composing is unconditional at the call site.
  DartExpression orDefault(
    DartExpression expression, {
    required SchemaRenderer context,
    required bool jsonIsNullable,
    required bool dartIsNullable,
  }) {
    DartExpression coalesced(DartExpression defaultValue) =>
        DartIfNull(value: expression, ifNullValue: defaultValue);

    // The default lands as the `??` right-hand side into a typed slot, so an
    // enum default reads as a dot shorthand here (`?? .cruise`).
    final defaultValue = slotDefaultExpression(context);
    if (defaultValue == null) {
      if (jsonIsNullable && !dartIsNullable) {
        // Belt-and-braces: a non-nullable Dart slot fed by a nullable
        // JSON value with no default would silently produce a null-cast
        // crash at runtime. A non-null slot is only chosen when the
        // property has a default, so reaching here means the generator
        // violated its own invariant, not user error.
        throw StateError('No default value for nullable property: $this');
      }
      return expression;
    }
    if (!jsonIsNullable) return expression;
    // The schema permits null, so a null on the wire is a legal value
    // rather than a stand-in for an absent key. `default` applies to
    // absence only, and `??` cannot tell the two apart — coalescing here
    // would silently replace a null the spec allows. When the key is also
    // optional the caller substitutes the default by testing for the key;
    // when it is required there is no absent case to substitute for.
    if (common.nullable) return expression;
    // Non-null Dart slot fed by nullable JSON: an `as T?` cast would
    // crash on null. Substitute the default whether the default is
    // const or not.
    if (!dartIsNullable) return coalesced(defaultValue);
    // Nullable Dart slot with a const default: the constructor uses
    // `this.foo = default`, which only fires when the param is omitted.
    // `fromJson` always passes a value (possibly null), so substitute
    // the default at the cast site — otherwise a missing JSON key
    // produces `null` instead of the spec's default. Surfaced by a
    // real spec with `bool` properties marked `default: false` outside
    // the `required` array.
    if (defaultValue.canBeConst) return coalesced(defaultValue);
    // Nullable Dart slot with a non-const default: the constructor uses
    // an initializer list (`: foo = foo ?? default`) that substitutes
    // on null too, so the default lands without `fromJson`'s help.
    return expression;
  }

  /// The structured Dart type for this schema — the single source of truth.
  /// [typeName] and [nullableTypeName] render from it. Subclasses build it
  /// directly: leaves as a flat name, list/map decomposing their arguments.
  DartType get dartType;

  /// The non-nullable Dart type name for the schema.
  /// e.g. 'String', 'Uri', or the class name of a new type.
  String get typeName => dartType.toString();

  /// The Dart type name for the schema, made nullable.
  /// e.g. 'String?', 'Uri?', or the ClassName? of a new type.
  String nullableTypeName(SchemaRenderer context) {
    return dartType.asNullable().toString();
  }

  String equalsExpression(String name, SchemaRenderer context) =>
      '${_equalsReceiver(name)} == other.$name';

  /// Expression to feed into the generated `hashCode` `Object.hashAll(...)`
  /// call for a field named [name]. Default is the field itself —
  /// primitives and newtypes hash fine that way. List/Map fields
  /// (and Uint8List) override to use [ModelHelpers.listHash] /
  /// [ModelHelpers.mapHash] so the hash stays consistent with the
  /// deep-equality `==`.
  String hashCodeExpression(String name) => name;

  /// The non-nullable JSON wire type this schema stores as — the type of its
  /// value inside the parsed `Map<String, dynamic>`. Often differs from
  /// [dartType]: a `DateTime` field stores as `String`, an object as
  /// `Map<String, dynamic>`.
  DartType get jsonStorageDartType;

  /// The JSON wire type name, made nullable when [isNullable].
  String jsonStorageType({required bool isNullable}) =>
      (isNullable ? jsonStorageDartType.asNullable() : jsonStorageDartType)
          .toString();

  /// The expression that converts [dartName] (a value of this schema's
  /// Dart type) into its JSON wire form.
  DartExpression toJsonExpression(
    DartExpression dartName,
    SchemaRenderer context, {
    required bool dartIsNullable,
  });

  /// The expression that converts [jsonValue] (a value in JSON wire form)
  /// into this schema's Dart type.
  ///
  /// Null when the schema has no `fromJson` at all: [RenderVoid], whose
  /// only use is a void return, produces no value to convert. Modeled as
  /// an absent expression rather than an empty one so callers have to
  /// decide what to do about it.
  DartExpression? fromJsonExpression(
    DartExpression jsonValue,
    SchemaRenderer context, {
    required bool jsonIsNullable,
    required bool dartIsNullable,
  });

  /// `<jsonValue> as <this schema's wire type>`, the cast every
  /// [fromJsonExpression] starts from.
  @protected
  DartExpression jsonCast(
    DartExpression jsonValue, {
    required bool jsonIsNullable,
  }) => DartCast(
    operand: jsonValue,
    type: jsonIsNullable
        ? jsonStorageDartType.asNullable()
        : jsonStorageDartType,
  );

  /// [fromJsonExpression] where an absent expression has no meaning — as a
  /// list element or a map value, whose Dart type cannot be `void`.
  ///
  /// [RenderVoid] is the only schema that returns null, and it is reachable
  /// only as an operation's return. Getting one here means the tree was
  /// built wrong, so this reports that rather than propagating a null into
  /// an expression that has nowhere to put it.
  ///
  /// Only [RenderMap] can actually reach the throw: [RenderArray] asks
  /// first whether its items need conversion, and [RenderVoid] answers no,
  /// so an array of void takes the `.cast()` branch and never calls this.
  @protected
  DartExpression requireFromJsonExpression(
    DartExpression jsonValue,
    SchemaRenderer context, {
    required bool jsonIsNullable,
    required bool dartIsNullable,
  }) {
    final expression = fromJsonExpression(
      jsonValue,
      context,
      jsonIsNullable: jsonIsNullable,
      dartIsNullable: dartIsNullable,
    );
    if (expression == null) {
      throw StateError('$runtimeType has no fromJson expression: $this');
    }
    return expression;
  }

  /// This schema parsed from [jsonValue]: cast to the wire type, handed to
  /// the schema's own `fromJson` factory, with any default substituted
  /// after.
  ///
  /// The whole conversion for every schema that renders its own factory,
  /// which is why it is one method rather than the same three calls
  /// written out per subclass.
  ///
  /// Not used by [RenderOneOf] or [RenderEmptyObject]: both would be
  /// unchanged by [orDefault] today (their default is always null), but
  /// routing them through it would newly subject them to its
  /// nullable-without-a-default [StateError].
  @protected
  DartExpression parsedFromJson(
    DartExpression jsonValue,
    SchemaRenderer context, {
    required bool jsonIsNullable,
    required bool dartIsNullable,
  }) => orDefault(
    _fromJsonCall(
      jsonCast(jsonValue, jsonIsNullable: jsonIsNullable),
      jsonIsNullable: jsonIsNullable,
    ),
    context: context,
    jsonIsNullable: jsonIsNullable,
    dartIsNullable: dartIsNullable,
  );

  /// `<Type>.fromJson(<argument>)`, or `maybeFromJson` when the JSON value
  /// can be null — the shape every schema that renders its own `fromJson`
  /// is parsed through.
  ///
  /// Named off [dartType] rather than a separately-computed class name.
  /// Those are the same string today, but only one of them is the type
  /// reference sites elsewhere emit, and a divergence would produce a call
  /// to a class that does not exist.
  DartExpression _fromJsonCall(
    DartExpression argument, {
    required bool jsonIsNullable,
  }) => DartInvocation(
    type: dartType,
    constructorName: jsonIsNullable ? 'maybeFromJson' : 'fromJson',
    arguments: [argument],
    // A factory that parses at runtime.
    isConstConstructor: false,
  );

  /// A Dart expression that constructs a valid in-memory instance of
  /// this schema, used by generated round-trip tests. Returns `null`
  /// when the generator cannot produce a safe example — e.g. a
  /// [RenderRecursiveRef] in a non-nullable slot would loop forever.
  /// Callers treat `null` as a signal to skip emitting a round-trip
  /// test for the enclosing type.
  ///
  /// Whether the result is const-able is [DartExpression.canBeConst], derived
  /// from the returned tree rather than tracked alongside it.
  DartExpression? exampleValue(SchemaRenderer context);

  /// Wrap a scalar [literal] in this schema's newtype constructor, when
  /// it creates one. Shared by the string and numeric newtypes, whose
  /// generated constructor is `const` only when the schema declares no
  /// validations — the same `hasValidations` gate the templates use. A
  /// validating constructor has a body, so it cannot be const.
  ///
  /// Not used by [RenderPod], whose newtype constructor is
  /// unconditionally const.
  @protected
  DartExpression newtypeWrappedExample(DartLiteral literal) {
    if (!createsNewType) return literal;
    return DartInvocation(
      type: dartType,
      arguments: [literal],
      isConstConstructor: validationCall == null,
    );
  }

  /// A Dart expression of type [jsonStorageType] that is guaranteed to
  /// fail this schema's `fromJson`/`maybeFromJson` with a
  /// `FormatException`. Used by generated tests to lock in the parse
  /// contract at the type boundary. Returns `null` when no such input
  /// exists (e.g. a string newtype that accepts any string) or when
  /// the rejection path isn't through `FormatException` — callers skip
  /// emitting the negative test for those.
  String? invalidJsonExample(SchemaRenderer context) => null;

  /// The default value of this schema, as an expression.
  DartExpression? defaultValueExpression(SchemaRenderer context) {
    final value = defaultValue;
    if (value == null) {
      return null;
    }
    return DartLiteral(value);
  }

  /// The default value as it should appear in a *context-typed slot* — a
  /// position where the destination type is already known (a constructor
  /// param default, a `??` fallback into a typed field, a typed method
  /// argument). Identical to [defaultValueExpression] for every schema
  /// except [RenderEnum], which emits a Dart 3.10 dot shorthand there.
  ///
  /// Kept separate from [defaultValueExpression] on purpose: the latter also
  /// feeds context-free consumers (e.g. the redundant-example structural
  /// comparison) where a shorthand would be either illegal or a false
  /// mismatch. Only reach for this at genuine emission sites.
  DartExpression? slotDefaultExpression(SchemaRenderer context) =>
      defaultValueExpression(context);

  bool hasDefaultValue(SchemaRenderer context) => defaultValue != null;

  static bool maybeEqualsIgnoringName(RenderSchema? a, RenderSchema? b) {
    if (a == null && b == null) {
      return true;
    }
    if (a == null || b == null) {
      return false;
    }
    return a.equalsIgnoringName(b);
  }

  // This is a heuristic to help understand if two schemas are the same so we
  // can safely generate a single return value for a response.  We don't
  // currently support union response types.
  bool equalsIgnoringName(RenderSchema other) {
    if (runtimeType != other.runtimeType) {
      return false;
    }
    if (createsNewType != other.createsNewType) {
      return false;
    }
    // Ignoring pointer, snakeName, title, description and defaultValue.
    return true;
  }

  @override
  String toString() => '$runtimeType(snakeName: $snakeName, pointer: $pointer)';
}

// Plain old data types (string, number, boolean) plus string formats that
// map to specific Dart types (DateTime, Uri, UriTemplate) or are known
// string subsets (email, uuid).
//
// When [createsNewType] is true this is a top-level named schema and
// renders to its own file as an extension type wrapping [dartTypeName]. When
// false the schema is inline and uses [dartTypeName] directly at the use
// site.
// Expressions for the handful of Dart SDK constructs the generator emits
// by name. Spelling `Uri.parse(...)` out as a [DartInvocation] at every
// site describes the call structurally when we already know exactly which
// call it is; naming them lets the call site read like the Dart it
// produces. None are constant: each computes its value at runtime.

/// Source for an expression landing somewhere that evaluates at runtime —
/// a `??` right-hand side, or a parameter default, where a `const` keyword
/// turns an allocation into a compile-time constant.
String _runtimeSource(DartExpression expression) =>
    serializeExpression(expression, isConstContext: false);

/// [_runtimeSource] for an expression that may be absent.
String? _maybeRuntimeSource(DartExpression? expression) =>
    expression == null ? null : _runtimeSource(expression);

/// `DateTime.utc(2024)`.
DartExpression _dateTimeUtc(int year) =>
    DartType.dateTime.construct([DartLiteral(year)], name: 'utc');

/// `DateTime.parse('...')`.
DartExpression _dateTimeParse(String value) =>
    DartType.dateTime.construct([DartLiteral(value)], name: 'parse');

/// `Uri.parse('...')`.
DartExpression _uriParse(String uri) =>
    DartType.uri.construct([DartLiteral(uri)], name: 'parse');

/// `UriTemplate('...')`.
DartExpression _uriTemplate(String template) =>
    DartType.uriTemplate.construct([DartLiteral(template)]);

/// `Uint8List.fromList(<int>[...])`.
DartExpression _uint8ListFromList(List<int> bytes) =>
    DartType.uint8List.construct([
      DartListLiteral(
        elementType: DartType.int_,
        elements: bytes.map(DartLiteral.new).toList(),
      ),
    ], name: 'fromList');

class RenderPod extends RenderSchema {
  const RenderPod({
    required super.common,
    required this.type,
    required super.createsNewType,
    this.defaultValue,
    super.assignedName,
    super.assignedSnakeName,
  });

  /// The type of the resolved schema.
  final PodType type;

  @override
  final dynamic defaultValue;

  @override
  bool get shouldCallToJson {
    if (createsNewType) {
      return true;
    }
    return switch (type) {
      // Already json-native: no conversion at the use site.
      PodType.boolean || PodType.email || PodType.uuid => false,
      // Need serialization to a string.
      PodType.dateTime || PodType.uri || PodType.uriTemplate => true,
    };
  }

  /// The Dart type this pod represents at the use site (when inline) or that
  /// the newtype wraps (when a newtype). The source of truth for [dartType]
  /// and [dartTypeName].
  DartType get wrappedType => switch (type) {
    PodType.boolean => DartType.bool_,
    PodType.dateTime => DartType.dateTime,
    PodType.uri => DartType.uri,
    PodType.uriTemplate => DartType.uriTemplate,
    // email and uuid are String subsets.
    PodType.email => DartType.string,
    PodType.uuid => DartType.string,
  };

  /// The name of [wrappedType], for templates that need the bare identifier.
  String get dartTypeName => wrappedType.toString();

  @override
  DartType get dartType =>
      createsNewType ? DartType(_requireAssignedName()) : wrappedType;

  // Boolean is the only PodType with a `is bool` test that's distinct
  // from the other JSON storage types (the date/uri/uuid/etc. all
  // parse from String, which would conflict with RenderString in a
  // oneOf — we'd need to inspect the format at runtime, which we
  // don't).
  @override
  String? get wrapperTag =>
      !createsNewType && type == PodType.boolean ? 'Bool' : null;

  @override
  String? get jsonShapeKey =>
      !createsNewType && type == PodType.boolean ? 'bool' : null;

  @override
  _VariantConversion? _variantConversion(SchemaRenderer context) {
    if (createsNewType || type != PodType.boolean) return null;
    return _inlinePodConversion('bool', positionalBoolIgnore: true);
  }

  @override
  DartType get jsonStorageDartType => switch (type) {
    PodType.dateTime ||
    PodType.uri ||
    PodType.uriTemplate ||
    PodType.email ||
    PodType.uuid => DartType.string,
    PodType.boolean => DartType.bool_,
  };

  /// The default value of this schema, as an expression.
  @override
  DartExpression? defaultValueExpression(SchemaRenderer context) {
    final value = defaultValue;
    if (value == null) {
      return null;
    }
    final raw = switch (type) {
      PodType.dateTime => _dateTimeParse(value as String),
      PodType.uri => _uriParse(value as String),
      PodType.uriTemplate => _uriTemplate(value as String),
      PodType.email || PodType.uuid => DartLiteral(value as String),
      PodType.boolean => DartLiteral(value),
    };
    return createsNewType ? dartType.constConstruct([raw]) : raw;
  }

  @override
  Iterable<Import> get additionalImports => [
    ...super.additionalImports,
    if (type == PodType.uriTemplate)
      const Import(Libraries.uri, shown: ['UriTemplate']),
  ];

  /// Converts `value` (of type [dartTypeName]) to its JSON representation.
  /// Used both at the inline use site and inside the newtype's toJson.
  DartExpression _valueToJsonBody(
    DartExpression name, {
    required bool nameIsNullable,
  }) {
    DartExpression method(String methodName) => DartMethodCall(
      target: name,
      name: methodName,
      isNullAware: nameIsNullable,
    );
    return switch (type) {
      PodType.dateTime => method('toIso8601String'),
      PodType.uri || PodType.uriTemplate => method('toString'),
      // String- and bool-backed types: no conversion; `name` already
      // has the correct nullable/non-nullable type.
      PodType.email || PodType.uuid || PodType.boolean => name,
    };
  }

  /// Converts `json` (of type jsonStorageType) to [dartTypeName]. Used inside
  /// the newtype's fromJson factory body and (non-nullable only) at the
  /// inline use site.
  String _jsonToValueBody(String jsonName) => switch (type) {
    PodType.dateTime => 'DateTime.parse($jsonName)',
    PodType.uri => 'Uri.parse($jsonName)',
    PodType.uriTemplate => 'UriTemplate($jsonName)',
    PodType.email || PodType.uuid || PodType.boolean => jsonName,
  };

  @override
  DartExpression toJsonExpression(
    DartExpression dartName,
    SchemaRenderer context, {
    required bool dartIsNullable,
  }) {
    if (createsNewType) {
      return DartMethodCall(
        target: dartName,
        name: 'toJson',
        isNullAware: dartIsNullable,
      );
    }
    return _valueToJsonBody(dartName, nameIsNullable: dartIsNullable);
  }

  @override
  DartExpression fromJsonExpression(
    DartExpression jsonValue,
    SchemaRenderer context, {
    required bool jsonIsNullable,
    required bool dartIsNullable,
  }) {
    final cast = jsonCast(jsonValue, jsonIsNullable: jsonIsNullable);
    // Applied to every branch: when the JSON value can't be null it
    // returns the expression unchanged, so the branches don't each have
    // to know whether a default is in play.
    DartExpression withDefault(DartExpression expression) => orDefault(
      expression,
      context: context,
      jsonIsNullable: jsonIsNullable,
      dartIsNullable: dartIsNullable,
    );

    if (createsNewType) {
      return parsedFromJson(
        jsonValue,
        context,
        jsonIsNullable: jsonIsNullable,
        dartIsNullable: dartIsNullable,
      );
    }

    // Inline: convert the JSON string to a Dart value at the use site. A
    // nullable value goes through a model helper, which keeps the result
    // a single nullable-aware expression; a non-nullable one inlines the
    // parse.
    return withDefault(
      switch (type) {
        PodType.dateTime =>
          jsonIsNullable
              ? callFunction(ModelHelpers.maybeParseDateTime, [cast])
              : DartType.dateTime.construct([cast], name: 'parse'),
        PodType.uri =>
          jsonIsNullable
              ? callFunction(ModelHelpers.maybeParseUri, [cast])
              : DartType.uri.construct([cast], name: 'parse'),
        PodType.uriTemplate =>
          jsonIsNullable
              ? callFunction(ModelHelpers.maybeParseUriTemplate, [cast])
              : DartType.uriTemplate.construct([cast]),
        // Already JSON-native: the cast is the whole conversion.
        PodType.boolean || PodType.email || PodType.uuid => cast,
      },
    );
  }

  @override
  Map<String, dynamic> toTemplateContext(SchemaRenderer context) {
    if (!createsNewType) {
      throw StateError(
        '$runtimeType.toTemplateContext called for non-new type: $this',
      );
    }
    return {
      'doc_comment': createDocComment(common: common),
      'typeName': typeName,
      'nullableTypeName': nullableTypeName(context),
      'dartType': dartTypeName,
      'jsonType': jsonStorageType(isNullable: false),
      'fromJsonBody': _jsonToValueBody('json'),
      'toJsonBody': _runtimeSource(
        _valueToJsonBody(const DartIdentifier('value'), nameIsNullable: false),
      ),
      // Bool newtypes wrap a single positional `bool` in three places
      // (the extension-type representation, `fromJson`, `maybeFromJson`)
      // that all trip `avoid_positional_boolean_parameters`. The lint
      // is right about user-facing APIs (`widget.setVisible(true)`) but
      // wrong here — the type name *is* the disambiguation. Suppress
      // file-locally so the lint stays live for everyone else.
      'isBoolPod': type == PodType.boolean,
    };
  }

  @override
  bool equalsIgnoringName(RenderSchema other) =>
      (other is RenderPod) &&
      type == other.type &&
      super.equalsIgnoringName(other);

  @override
  DartExpression? exampleValue(SchemaRenderer context) {
    // Const-ness is per-type and falls out of the node: the literals are
    // constant, and the three `_`-helper calls are all runtime invocations
    // (`DateTime` has no const constructor; `Uri` / `UriTemplate` parse
    // their argument).
    final raw = switch (type) {
      PodType.boolean => const DartLiteral(false),
      // `month`/`day` default to 1, so passing them is redundant
      // (`avoid_redundant_argument_values`).
      PodType.dateTime => _dateTimeUtc(2024),
      PodType.uri => _uriParse('https://example.com'),
      PodType.uriTemplate => _uriTemplate('https://example.com/{id}'),
      PodType.email => const DartLiteral('user@example.com'),
      PodType.uuid => const DartLiteral(
        '00000000-0000-0000-0000-000000000000',
      ),
    };
    if (!createsNewType) return raw;
    // A pod newtype's constructor is unconditionally `const`
    // (`schema_pod_newtype.mustache`), so wrapping preserves const-ness.
    return dartType.constConstruct([raw]);
  }

  /// Only dateTime pods parse through `DateTime.parse`, which rejects garbage
  /// with FormatException. Uri.parse is famously lenient; UriTemplate accepts
  /// most strings; string/bool/email/uuid pods don't validate at all — so no
  /// guaranteed-invalid input.
  @override
  String? invalidJsonExample(SchemaRenderer context) => switch (type) {
    PodType.dateTime => "'not a date'",
    _ => null,
  };
}

abstract class RenderNewType extends RenderSchema {
  const RenderNewType({
    required super.common,
    super.assignedName,
    super.assignedSnakeName,
  }) : super(createsNewType: true);

  @override
  bool get shouldCallToJson => true;

  /// The class name of the new type. Used by subclasses. Prefers the
  /// naming-pass-assigned name when present; falls back to the
  /// snake-derived computation when not (e.g. tests that build
  /// schemas directly without going through [SpecResolver]).
  String get className => _requireAssignedName();

  @override
  DartType get dartType => DartType(className);

  @override
  DartExpression toJsonExpression(
    DartExpression dartName,
    SchemaRenderer context, {
    required bool dartIsNullable,
  }) {
    return DartMethodCall(
      target: dartName,
      name: 'toJson',
      isNullAware: dartIsNullable,
    );
  }
}

class RenderString extends RenderSchema {
  const RenderString({
    required super.common,
    required this.defaultValue,
    required this.maxLength,
    required this.minLength,
    required this.pattern,
    required super.createsNewType,
    super.assignedName,
    super.assignedSnakeName,
  });

  @override
  final String? defaultValue;

  /// The maximum length of the string.
  final int? maxLength;

  /// The minimum length of the string.
  final int? minLength;

  /// The pattern to match the string against.
  final String? pattern;

  @override
  DartType get dartType =>
      createsNewType ? DartType(_requireAssignedName()) : DartType.string;

  /// The default value of this schema, as an expression.
  @override
  DartExpression? defaultValueExpression(SchemaRenderer context) {
    final value = defaultValue;
    return value == null ? null : DartLiteral(value);
  }

  @override
  String? get validationCall {
    final pat = pattern;
    return validateCall([
      if (minLength != null) 'minLength: $minLength',
      if (maxLength != null) 'maxLength: $maxLength',
      if (pat != null) 'pattern: ${quoteString(pat)}',
    ]);
  }

  @override
  Map<String, dynamic> toTemplateContext(SchemaRenderer context) {
    final call = validationCall;
    return {
      'doc_comment': createDocComment(common: common),
      'typeName': typeName,
      'nullableTypeName': nullableTypeName(context),
      'hasValidations': call != null,
      'validationBody': call == null ? '' : 'value.$call;',
    };
  }

  @override
  String? get wrapperTag => createsNewType ? null : 'String';

  @override
  String? get jsonShapeKey => createsNewType ? null : 'String';

  @override
  _VariantConversion? _variantConversion(SchemaRenderer context) =>
      createsNewType ? null : _inlinePodConversion('String');

  @override
  DartType get jsonStorageDartType => DartType.string;

  @override
  DartExpression fromJsonExpression(
    DartExpression jsonValue,
    SchemaRenderer context, {
    required bool jsonIsNullable,
    required bool dartIsNullable,
  }) {
    if (createsNewType) {
      return parsedFromJson(
        jsonValue,
        context,
        jsonIsNullable: jsonIsNullable,
        dartIsNullable: dartIsNullable,
      );
    }
    // A String is already JSON-native: the cast is the conversion.
    return orDefault(
      jsonCast(jsonValue, jsonIsNullable: jsonIsNullable),
      context: context,
      jsonIsNullable: jsonIsNullable,
      dartIsNullable: dartIsNullable,
    );
  }

  @override
  DartExpression toJsonExpression(
    DartExpression dartName,
    SchemaRenderer context, {
    required bool dartIsNullable,
  }) {
    if (createsNewType) {
      return DartMethodCall(
        target: dartName,
        name: 'toJson',
        isNullAware: dartIsNullable,
      );
    }
    return dartName;
  }

  @override
  bool equalsIgnoringName(RenderSchema other) =>
      (other is RenderString) &&
      defaultValue == other.defaultValue &&
      maxLength == other.maxLength &&
      minLength == other.minLength &&
      super.equalsIgnoringName(other);

  /// A literal `String` value that satisfies this schema's
  /// validations (`pattern`, `minLength`, `maxLength`). Returns `null`
  /// when synthesis can't produce a value the spec author would
  /// recognize as legal — callers fall through to a generic
  /// placeholder. The synthesizer prefers the spec's own `example` or
  /// first `examples` entry (assumed valid by the author); failing
  /// that, it tries simple character-class candidates against the
  /// declared pattern; failing that, returns `'example'` padded /
  /// truncated to fit the length range.
  @visibleForTesting
  String validStringExample() {
    final fromSpec = _firstStringExample(common);
    if (fromSpec != null) return fromSpec;
    return synthesizeStringSatisfying(
      pattern: pattern,
      minLength: minLength,
      maxLength: maxLength,
    );
  }

  @override
  DartExpression? exampleValue(SchemaRenderer context) {
    final example = validStringExample();
    // If synthesis couldn't produce a value that satisfies this schema's own
    // `pattern`, emitting it as an example would make the generated
    // round-trip test construct a spec-invalid instance — which now throws,
    // because constrained values validate in their constructor (inline
    // properties via #204, newtypes via #194). Return null so the example is
    // skipped: an object with an un-exampleable required property skips its
    // round-trip test, and an un-exampleable newtype skips its own — the same
    // null-example path already used for recursive and no-JSON types.
    final pat = pattern;
    if (pat != null && !_stringMatchesPattern(pat, example)) return null;
    return newtypeWrappedExample(DartLiteral(example));
  }
}

/// Whether [value] matches [pattern], treating an unparseable author pattern
/// as "nothing to check against" (matches) — the same lenient stance
/// [synthesizeStringSatisfying] takes when the regex fails to compile.
bool _stringMatchesPattern(String pattern, String value) {
  try {
    return RegExp(pattern).hasMatch(value);
  } on FormatException {
    return true;
  }
}

/// Pick the first `String`-typed entry from `common.example` or
/// `common.examples`. OpenAPI lets the spec author declare both; we
/// trust either as a valid representation for the schema's
/// validations.
String? _firstStringExample(CommonProperties common) {
  final ex = common.example;
  if (ex is String) return ex;
  final examples = common.examples;
  if (examples != null) {
    for (final e in examples) {
      if (e is String) return e;
    }
  }
  return null;
}

/// Best-effort string synthesis from validation rules. Uses Dart's
/// `RegExp` at codegen time to test candidate values; the candidates
/// cover the patterns we've actually seen in real specs (github's
/// `^[0-9a-fA-F]+$`, Discord's `^(0|[1-9][0-9]*)$`, etc.). Returns a
/// padded `'example'` when no candidate matches — callers should still
/// surface this to the user (it's better than silently emitting a
/// constructor call that throws at synthesized-test time).
@visibleForTesting
String synthesizeStringSatisfying({
  String? pattern,
  int? minLength,
  int? maxLength,
}) {
  String resize(String s) {
    final minL = minLength ?? 0;
    final maxL = maxLength;
    var out = s;
    if (out.length < minL) {
      final padChar = out[out.length - 1];
      out = out + padChar * (minL - out.length);
    }
    if (maxL != null && out.length > maxL) {
      out = out.substring(0, maxL);
    }
    return out;
  }

  if (pattern == null) return resize('example');
  final RegExp regex;
  try {
    regex = RegExp(pattern);
  } on FormatException {
    // Spec-author-provided regex didn't parse. Fall through.
    return resize('example');
  }
  // Try a small set of common candidates.
  final targetLen = (minLength ?? 1).clamp(1, 256);
  final candidates = <String>[
    'a' * targetLen, // covers `[0-9a-fA-F]+`, `[a-z]+`, etc.
    '0' * targetLen, // covers `[0-9]+`, `^(0|...)$`.
    '1' * targetLen, // covers `^[1-9][0-9]*$`-leading patterns.
    // Fixed-block patterns (base64's 4-char groups, github's secret
    // `^(?:[A-Za-z0-9+/]{4})*...$`) need a length that's a multiple of the
    // block; a single char repeated `targetLen` times is usually the wrong
    // length. Try `a`-runs at common block lengths. Listed after the
    // `targetLen` candidates so patterns that already matched keep their
    // value (first match wins).
    for (final len in [4, 8])
      if (len > targetLen) 'a' * len,
    'example', // simple case for unconstrained patterns.
    resize('example'),
  ];
  for (final c in candidates) {
    if (regex.hasMatch(c)) return resize(c);
  }
  return resize('example');
}

abstract class RenderNumeric<T extends num> extends RenderSchema {
  const RenderNumeric({
    required super.common,
    required this.defaultValue,
    required this.maximum,
    required this.minimum,
    required this.exclusiveMaximum,
    required this.exclusiveMinimum,
    required this.multipleOf,
    required super.createsNewType,
    super.assignedName,
    super.assignedSnakeName,
  });

  @override
  final T? defaultValue;

  /// The maximum value of the number.
  final T? maximum;

  /// The minimum value of the number.
  final T? minimum;

  /// The exclusive maximum value of the number.
  final T? exclusiveMaximum;

  /// The exclusive minimum value of the number.
  final T? exclusiveMinimum;

  /// The multiple of value of the number.
  final T? multipleOf;

  @override
  DartExpression? defaultValueExpression(SchemaRenderer context) {
    final value = defaultValue;
    if (value == null) {
      return null;
    }
    // `dartType` rather than `camelFromSnake(snakeName)`, which is what
    // this used to spell: one way to name a type, and the same one every
    // other expression here uses. Verified equivalent across the spec
    // rotation before switching.
    if (createsNewType) {
      // A validating newtype's generated constructor has a body, so it is
      // not `const` — the same gate [newtypeWrappedExample] applies to
      // example values. The `defaultCanConstConstruct` this replaced said
      // `true` unconditionally, with a comment admitting it might be
      // wrong; asking the constructor directly is that comment's fix.
      return DartInvocation(
        type: dartType,
        arguments: [_numericLiteral(value)],
        isConstConstructor: validationCall == null,
      );
    }
    return _numericLiteral(value);
  }

  @override
  String? get validationCall => validateCall([
    if (minimum != null) 'min: $minimum',
    if (maximum != null) 'max: $maximum',
    if (exclusiveMinimum != null) 'exclusiveMin: $exclusiveMinimum',
    if (exclusiveMaximum != null) 'exclusiveMax: $exclusiveMaximum',
    if (multipleOf != null) 'multipleOf: $multipleOf',
  ]);

  @override
  Map<String, dynamic> toTemplateContext(SchemaRenderer context) {
    if (!createsNewType) {
      throw StateError(
        '$runtimeType.toTemplateContext called for non-new type: $this',
      );
    }
    final call = validationCall;
    return {
      'doc_comment': createDocComment(common: common),
      'typeName': typeName,
      'dartType': '$T',
      'jsonType': jsonStorageType(isNullable: false),
      'nullableTypeName': nullableTypeName(context),
      'jsonToDartCall': jsonToDartCall(jsonIsNullable: false),
      'hasValidations': call != null,
      'validationBody': call == null ? '' : 'value.$call;',
    };
  }

  /// The method that narrows the JSON wire type to the Dart type — `num`
  /// arrives off the wire where a `double` is wanted. Null when the two
  /// already agree and no call is needed.
  String? get jsonToDartMethod;

  /// [jsonToDartMethod] spelled as a call, for the newtype template, which
  /// splices it into a body this class does not build.
  String jsonToDartCall({required bool jsonIsNullable}) {
    final method = jsonToDartMethod;
    if (method == null) return '';
    return '${jsonIsNullable ? '?.' : '.'}$method()';
  }

  @override
  DartExpression fromJsonExpression(
    DartExpression jsonValue,
    SchemaRenderer context, {
    required bool jsonIsNullable,
    required bool dartIsNullable,
  }) {
    if (createsNewType) {
      return parsedFromJson(
        jsonValue,
        context,
        jsonIsNullable: jsonIsNullable,
        dartIsNullable: dartIsNullable,
      );
    }
    // Where the wire type is wider than the Dart type (`num` -> `double`),
    // narrow it. The serializer parenthesizes the cast because a selector
    // binds tighter than `as`; a cast with no call on it stays bare (#255).
    final cast = jsonCast(jsonValue, jsonIsNullable: jsonIsNullable);
    final narrowed = jsonToDartMethod;
    return orDefault(
      narrowed == null
          ? cast
          : DartMethodCall(
              target: cast,
              name: narrowed,
              isNullAware: jsonIsNullable,
            ),
      context: context,
      jsonIsNullable: jsonIsNullable,
      dartIsNullable: dartIsNullable,
    );
  }

  @override
  DartExpression toJsonExpression(
    DartExpression dartName,
    SchemaRenderer context, {
    required bool dartIsNullable,
  }) {
    if (createsNewType) {
      return DartMethodCall(
        target: dartName,
        name: 'toJson',
        isNullAware: dartIsNullable,
      );
    }
    return dartName;
  }

  @override
  bool equalsIgnoringName(RenderSchema other) =>
      (other is RenderNumeric<T>) &&
      defaultValue == other.defaultValue &&
      maximum == other.maximum &&
      minimum == other.minimum &&
      exclusiveMaximum == other.exclusiveMaximum &&
      exclusiveMinimum == other.exclusiveMinimum &&
      multipleOf == other.multipleOf &&
      super.equalsIgnoringName(other);
}

class RenderNumber extends RenderNumeric<double> {
  const RenderNumber({
    required super.common,
    required super.defaultValue,
    required super.maximum,
    required super.minimum,
    required super.exclusiveMaximum,
    required super.exclusiveMinimum,
    required super.multipleOf,
    required super.createsNewType,
    super.assignedName,
    super.assignedSnakeName,
  });

  @override
  DartType get dartType =>
      createsNewType ? DartType(_requireAssignedName()) : DartType.double_;

  @override
  String? get wrapperTag => createsNewType ? null : 'Num';

  // Use `num` (matching jsonStorageType) rather than `double` so the
  // shape test `case num v` accepts both JSON ints and doubles without
  // a coercion step. A oneOf that mixes `integer` and `number` would
  // be ambiguous (every int satisfies num too) — github has no such
  // site, and `_canShapeDispatch` would still pass on key uniqueness;
  // if one ever shows up, ordering int-before-num in the switch keeps
  // the dispatch correct, but the spec is the real bug.
  @override
  String? get jsonShapeKey => createsNewType ? null : 'num';

  @override
  _VariantConversion? _variantConversion(SchemaRenderer context) =>
      createsNewType ? null : _inlinePodConversion('num');

  @override
  DartType get jsonStorageDartType => DartType.num_;

  @override
  String? get jsonToDartMethod => 'toDouble';

  @override
  DartExpression? exampleValue(SchemaRenderer context) =>
      newtypeWrappedExample(_numericLiteral(_validNumberExample(common, this)));
}

class RenderInteger extends RenderNumeric<int> {
  const RenderInteger({
    required super.common,
    required super.defaultValue,
    required super.maximum,
    required super.minimum,
    required super.exclusiveMaximum,
    required super.exclusiveMinimum,
    required super.multipleOf,
    required super.createsNewType,
    super.assignedName,
    super.assignedSnakeName,
  });

  @override
  DartType get dartType =>
      createsNewType ? DartType(_requireAssignedName()) : DartType.int_;

  @override
  String? get wrapperTag => createsNewType ? null : 'Int';

  @override
  String? get jsonShapeKey => createsNewType ? null : 'int';

  @override
  _VariantConversion? _variantConversion(SchemaRenderer context) =>
      createsNewType ? null : _inlinePodConversion('int');

  @override
  DartType get jsonStorageDartType => DartType.int_;

  // jsonType and dartType are both int, so there is nothing to narrow.
  @override
  String? get jsonToDartMethod => null;

  @override
  DartExpression? exampleValue(SchemaRenderer context) => newtypeWrappedExample(
    DartLiteral(_validNumberExample(common, this).toInt()),
  );
}

/// A numeric literal for a destination whose static type is the schema's
/// own — `double` for `number`, `int` for `integer`, or a newtype over
/// one of those.
///
/// A whole-valued `double` renders as an int literal (`0`, not `0.0`).
/// Dart converts an int literal in a `double` context, so the two forms
/// denote the same value, and `prefer_int_literals` wants the shorter
/// one — which `dart fix` was already rewriting it to.
///
/// Only sound because the destination is statically `double`. In a
/// `dynamic` or `num` context (a JSON map literal, say) the two forms
/// differ at runtime, so this must not be used to build one.
DartLiteral _numericLiteral(num value) =>
    DartLiteral(_isExactWholeDouble(value) ? value.toInt() : value);

/// Whether [value] is a `double` holding a whole number that an `int`
/// can represent exactly.
///
/// Non-finite values have no `int` form (`toInt()` throws), and past
/// 2^53 a `double` no longer represents every integer, so converting
/// would round to a different number than the spec wrote.
bool _isExactWholeDouble(num value) =>
    value is double &&
    value.isFinite &&
    value == value.truncateToDouble() &&
    value.abs() <= 9007199254740992; // 2^53

/// Pick a numeric value satisfying [schema]'s declared bounds. Prefers
/// the spec's own `example` / `examples` (assumed valid by the
/// author); otherwise picks `minimum`, then `0` if `0` is in range,
/// falling back to a value derived from `maximum`. `multipleOf` is
/// honored as a final adjustment. Used by both
/// [RenderNumber.exampleValue] and [RenderInteger.exampleValue]
/// because the rules are uniform across the two — only the literal's
/// rendered form differs.
num _validNumberExample(CommonProperties common, RenderNumeric<num> schema) {
  num? candidateFromSpec() {
    final ex = common.example;
    if (ex is num) return ex;
    final examples = common.examples;
    if (examples != null) {
      for (final e in examples) {
        if (e is num) return e;
      }
    }
    return null;
  }

  num pick() {
    final fromSpec = candidateFromSpec();
    if (fromSpec != null) return fromSpec;
    // Inclusive bound takes precedence over exclusive when both
    // appear (rare in practice — they overlap conceptually).
    final lo = schema.minimum ?? schema.exclusiveMinimum;
    final hi = schema.maximum ?? schema.exclusiveMaximum;
    if (lo != null) return lo;
    if (hi != null && hi < 0) return hi;
    return 0;
  }

  var v = pick();
  final multiple = schema.multipleOf;
  if (multiple != null && multiple != 0) {
    // Round to nearest multiple at or above the candidate.
    final n = (v / multiple).ceil();
    v = n * multiple;
  }
  return v;
}

class RenderObject extends RenderNewType {
  const RenderObject({
    required super.common,
    required this.properties,
    this.additionalProperties,
    this.requiredProperties = const [],
    this.constProperties = const {},
    this.parentSealedTypeName,
    super.assignedName,
    super.assignedSnakeName,
  });

  /// The properties of the resolved schema.
  final Map<String, RenderSchema> properties;

  /// Properties pinned to a single constant value (the `allOf: [{$ref: E}]`
  /// + single-value `enum`/`const` idiom; see
  /// [ResolvedObject.constProperties]). Such a property renders as a fixed
  /// getter (`E get type => E.member;`) rather than a required constructor
  /// parameter — the value is fully determined by the class, so the caller
  /// neither passes it nor can set it wrong. Keyed by property name; values
  /// are `int`/`String`.
  ///
  /// Decision (a getter, not the alternatives — see issue #238): it is never
  /// valid to construct one of these with a different tag value, so the value
  /// is not a constructor parameter at all. A `final` field with a default
  /// would work but stores, on every instance, a value fixed by the type —
  /// wasted space for no gain. A `static const` can't be read through an
  /// instance in Dart, so it can't back a serialized/polymorphic property.
  /// The getter has no storage and is un-settable, which is exactly right.
  final Map<String, Object> constProperties;

  /// The additional properties of the resolved schema.
  final RenderSchema? additionalProperties;

  /// The required properties of the resolved schema.
  final List<String> requiredProperties;

  /// Camel-case Dart class name of the sealed parent this object
  /// should extend, or null when the object stands alone. Set by the
  /// naming pass for inline `ResolvedObject` variants of a oneOf/anyOf
  /// whose dispatch supports smoosh — the variant class itself
  /// becomes the sealed-parent's subclass, replacing the separate
  /// wrapper-subclass + `value:` indirection. The non-null state
  /// drives the `final class X extends Y` declaration in the schema
  /// template and the "skip my own file" gates in `file_renderer`.
  final String? parentSealedTypeName;

  @override
  bool get isSmooshed => parentSealedTypeName != null;

  @override
  Iterable<RenderSchema> get children {
    // Local so the null-check promotes — `additionalProperties` is a
    // public field, which flow analysis won't promote in place.
    final additional = additionalProperties;
    return [
      ...properties.values,
      if (additional != null) additional,
    ];
  }

  @override
  String? get wrapperTag => typeName;

  @override
  String? get jsonShapeKey => _mapShapeKey;

  @override
  _VariantConversion? _variantConversion(SchemaRenderer context) =>
      _newtypeConversion(typeName);

  @override
  dynamic get defaultValue => null;

  @override
  DartType get jsonStorageDartType => _jsonWireMap;

  // A deprecated property emits `@deprecated`, which is a `dart:core`
  // constant — not `package:meta`'s. This class used to add a meta
  // import for it, which was never needed; the `@immutable` case that
  // genuinely needs meta comes from `SchemaUsage.usesMetaAnnotations`.

  // isNullable means it's optional for the server, use nullable storage.
  //
  // A property with a default is non-nullable: an absent key means the
  // default, so no input produces a null and a nullable field would only
  // let a caller emit `{"x": null}` for a property whose schema forbids
  // it. A schema that does permit null is unaffected — that nullability
  // comes from the property's own type, not from here.
  bool propertyDartIsNullable({
    required String jsonName,
    required SchemaRenderer context,
    required bool propertyHasDefaultValue,
  }) {
    final inRequiredList = requiredProperties.contains(jsonName);
    return !inRequiredList && !propertyHasDefaultValue;
  }

  /// Whether property [jsonName] renders as a nullable Dart field. The
  /// field declaration and every read of it — JSON (de)serialization, the
  /// multipart/form-data field assembly — must agree on this, so they all
  /// go through here. An optional property is *not* nullable when it has a
  /// (possibly quirk-synthesized) default: an optional array under the
  /// `allListsDefaultToEmpty` quirk is a non-nullable `List<T> = const []`,
  /// not a `List<T>?`.
  bool propertyRendersNullable(
    String jsonName,
    RenderSchema property,
    SchemaRenderer context,
  ) =>
      propertyDartIsNullable(
        jsonName: jsonName,
        context: context,
        propertyHasDefaultValue: property.hasDefaultValue(context),
      ) ||
      property.common.nullable;

  @visibleForTesting
  String argumentLine(
    String jsonName,
    RenderSchema property,
    SchemaRenderer context, {
    required bool isRequired,
  }) {
    final line = StringBuffer();
    if (property.isDeprecated) {
      line.write('@deprecated ');
    }
    if (isRequired) {
      line.write('required ');
    }
    final dartName = variableSafeName(context.quirks, jsonName);
    if (property.hasNonConstDefaultValue(context)) {
      final nullableTypeName = property.nullableTypeName(context);
      line.write('$nullableTypeName $dartName');
    } else {
      line.write('this.$dartName');
      if (property.hasDefaultValue(context)) {
        // `this.foo = <default>` — the field type is the slot type, so an
        // enum default drops its prefix (`= .cruise`).
        final value = property.slotDefaultExpression(context);
        line.write(' = ${_maybeRuntimeSource(value)}');
      }
    }
    return line.toString();
  }

  @visibleForTesting
  String? assignmentsLine(
    String jsonName,
    RenderSchema property,
    SchemaRenderer context, {
    required bool isRequired,
  }) {
    final dartName = variableSafeName(context.quirks, jsonName);
    if (property.hasNonConstDefaultValue(context)) {
      // `this.foo = foo ?? <default>` — the field type is the slot type.
      final value = property.slotDefaultExpression(context);
      final source = _maybeRuntimeSource(value);
      return 'this.$dartName = $dartName ?? $source';
    }
    return null;
  }

  String propertyStorageTypeDeclaration({
    required RenderSchema property,
    required SchemaRenderer context,
    required bool dartIsNullable,
    required int indent,
  }) {
    final newlineWithIndent = '\n${' ' * indent}';
    final buffer = StringBuffer();
    if (property.isDeprecated) {
      // OpenAPI has no deprecation string.
      buffer.write('@deprecated$newlineWithIndent');
    }
    if (!context.quirks.mutableModels) {
      buffer.write('final ');
    }
    if (dartIsNullable) {
      buffer.write('${property.nullableTypeName(context)} ');
    } else {
      buffer.write('${property.typeName} ');
    }
    return buffer.toString();
  }

  /// `this` is the schema of the object containing the property.
  /// [property] is the schema of the property itself.
  Map<String, dynamic> propertyTemplateContext({
    required String jsonName,
    required RenderSchema property,
    required SchemaRenderer context,
  }) {
    final dartName = variableSafeName(context.quirks, jsonName);
    // A property pinned to a constant — a named enum member (the `allOf:
    // [{$ref: E}]` idiom) or a bare inline lone `const` scalar (#240) —
    // renders as a fixed getter rather than a constructor parameter: the
    // value is fully determined by the class, so the caller neither passes
    // it nor can set it wrong. It has no storage, no constructor argument,
    // no JSON read and no part in equality, so it gets a context of its own
    // rather than a full one with most keys discarded. The lookup is bound
    // to a local so flow analysis keeps `constValue` non-null for the
    // builder, which [rendersAsConstGetter]'s `bool` return cannot give it.
    final constValue = constProperties[jsonName];
    if (constValue != null && rendersAsConstGetter(jsonName, property)) {
      return _constGetterPropertyContext(
        jsonName: jsonName,
        dartName: dartName,
        property: property,
        constValue: constValue,
        context: context,
      );
    }
    final hasDefaultValue = property.hasDefaultValue(context);
    final jsonKeyIsRequired = requiredProperties.contains(jsonName);
    final jsonIsNullable = !jsonKeyIsRequired || property.common.nullable;
    final dartIsNullable = propertyRendersNullable(jsonName, property, context);
    // OpenAPI 3.1 lets a property be both `required` and accept `null`
    // as its value (`type: [T, "null"]` + `required: [key]`). A plain
    // `json[key] as T?` cast would then accept a missing key as a null
    // value, silently violating `required`. Route the read through
    // `checkedKey`, which throws `FormatException` when the key is
    // absent — other combinations still read `json[key]` directly.
    final jsonRead = jsonKeyIsRequired && property.common.nullable
        ? callFunction(ModelHelpers.checkedKey, [
            const DartIdentifier('json'),
            DartLiteral(jsonName),
          ])
        : DartIndex(
            target: const DartIdentifier('json'),
            index: DartLiteral(jsonName),
          );

    // Means that the constructor parameter is required which is only true if
    // both the json property is required and it does not have a default.
    final isRequired =
        requiredProperties.contains(jsonName) && !hasDefaultValue;
    return {
      'dartName': dartName,
      'jsonName': quoteString(jsonName),
      'property_doc_comment': createDocComment(
        common: property.common,
        indent: 4,
      ),
      // Required named params must precede optional ones in the
      // constructor (`always_put_required_named_parameters_first`); see
      // the required/optional split in the object template context.
      'isRequired': isRequired,
      'isConstGetter': false,
      'argumentLine': argumentLine(
        jsonName,
        property,
        context,
        isRequired: isRequired,
      ),
      'assignmentsLine': assignmentsLine(
        jsonName,
        property,
        context,
        isRequired: isRequired,
      ),
      'storageTypeDeclaration': propertyStorageTypeDeclaration(
        property: property,
        context: context,
        dartIsNullable: dartIsNullable,
        indent: 4,
      ),
      'equals': property.equalsExpression(dartName, context),
      'hashCode': property.hashCodeExpression(dartName),
      // A nullable slot whose schema forbids null holds null to mean "the
      // key was absent", so emitting it would produce `{"x": null}` — a
      // value the spec rejects. The template drops the key with a
      // null-aware map entry (`'x': ?value`) instead. When the schema does
      // permit null there is nothing to hide: null is a legal value and
      // the key is always emitted.
      'omitWhenNull': dartIsNullable && !property.common.nullable,
      'toJson': _runtimeSource(
        property.toJsonExpression(
          DartIdentifier(dartName),
          context,
          dartIsNullable: dartIsNullable,
        ),
      ),
      'fromJson': _maybeRuntimeSource(
        _defaultOnAbsence(
          property.fromJsonExpression(
            jsonRead,
            context,
            dartIsNullable: dartIsNullable,
            jsonIsNullable: jsonIsNullable,
          ),
          property: property,
          context: context,
          jsonName: jsonName,
          jsonKeyIsRequired: jsonKeyIsRequired,
        ),
      ),
    };
  }

  /// [read], guarded so a declared default lands only when the key is
  /// absent.
  ///
  /// Only applies where the schema permits null and the key is optional:
  /// there the wire has three states (absent, null, value) and `??` — which
  /// [RenderSchema.orDefault] would otherwise use — collapses the first two.
  /// Every other combination either cannot be absent or cannot be null, so
  /// the plain read already carries the right value.
  DartExpression? _defaultOnAbsence(
    DartExpression? read, {
    required RenderSchema property,
    required SchemaRenderer context,
    required String jsonName,
    required bool jsonKeyIsRequired,
  }) {
    if (read == null || jsonKeyIsRequired || !property.common.nullable) {
      return read;
    }
    // The default is the else-branch of `json.containsKey(k) ? read : default`,
    // assigned into the typed field, so an enum default reads as `.member`.
    final defaultValue = property.slotDefaultExpression(context);
    if (defaultValue == null) return read;
    return DartConditional(
      condition: DartMethodCall(
        target: const DartIdentifier('json'),
        name: 'containsKey',
        arguments: [DartLiteral(jsonName)],
      ),
      thenValue: read,
      elseValue: defaultValue,
    );
  }

  /// The pinned value of a const property as a Dart expression: an enum
  /// member (`E.member`) when the property is that enum, the newtype
  /// constructor (`E(1)`) for an int newtype, or the literal itself
  /// (`'list'`, `5`) for a bare inline scalar.
  String _pinnedValueExpression(RenderSchema property, Object constValue) {
    if (property is RenderEnum) {
      return property.constExpression(constValue);
    }
    if (property is RenderIntNewtype) {
      // Wrap the pinned int in the newtype's (validating, non-const)
      // constructor so the getter's declared type matches its value —
      // `CallbackType get type => CallbackType(1);`.
      return serializeExpression(
        DartInvocation(
          type: property.dartType,
          arguments: [DartLiteral(constValue)],
          isConstConstructor: false,
        ),
        isConstContext: false,
      );
    }
    return serializeExpression(DartLiteral(constValue), isConstContext: true);
  }

  /// Template context for a property pinned to a single value, which
  /// renders as a fixed getter. Deliberately much narrower than the stored-
  /// property context: a const getter appears only in the field declaration,
  /// `operator[]` and `toJson`, so those are the only keys it carries. The
  /// getter returns [RenderSchema.typeName], so it is never nullable and
  /// `toJson` must not reach through it with `?.`.
  ///
  /// The getter body is [_pinnedValueExpression] — an enum member
  /// (`E.member`), an int-newtype constructor (`E(1)`), or the literal itself
  /// (`'list'`, `5`) for a bare inline scalar.
  Map<String, dynamic> _constGetterPropertyContext({
    required String jsonName,
    required String dartName,
    required RenderSchema property,
    required Object constValue,
    required SchemaRenderer context,
  }) {
    final constExpression = _pinnedValueExpression(property, constValue);
    return {
      'dartName': dartName,
      'jsonName': quoteString(jsonName),
      'property_doc_comment': createDocComment(
        common: property.common,
        indent: 4,
      ),
      'isConstGetter': true,
      'constGetter': '${property.typeName} get $dartName => $constExpression;',
      // The getter returns a pinned value and is never null, so the key is
      // always emitted — there is no absent case to represent.
      'omitWhenNull': false,
      'toJson': _runtimeSource(
        property.toJsonExpression(
          DartIdentifier(dartName),
          context,
          dartIsNullable: false,
        ),
      ),
    };
  }

  String? buildAssignmentsLine(List<Map<String, dynamic>> renderProperties) {
    final assignmentsLine = renderProperties
        .map((p) => p['assignmentsLine'])
        .whereType<String>()
        .join(', ');
    return assignmentsLine.isEmpty ? null : ': $assignmentsLine';
  }

  /// The `validate*` statements for the constructor body: constraint checks
  /// (`validatePattern`, `validateMaximum`, `validateMinimumItems`, ...) for
  /// inline properties whose values aren't validated anywhere else. Because
  /// `fromJson` routes through this constructor, these also reject invalid
  /// JSON on decode.
  ///
  /// Two kinds of property are skipped:
  /// - **newtype-typed** (`createsNewType`): the wrapped value is validated in
  ///   the newtype's own constructor. Calling `validate` on the extension type
  ///   here wouldn't resolve — the extension method is defined on the
  ///   underlying `String`/`num`/`List`, not the newtype. Mirrors the
  ///   API-boundary skip in `RenderOperation.validationStatements`.
  /// - **const getters**: pinned to a fixed value, no storage to check.
  ///
  /// Everything else — inline strings/numbers/arrays carrying `pattern`,
  /// `maxLength`, `maximum`, `minItems`, ... — is validated here.
  List<String> constructorValidationStatements(SchemaRenderer context) {
    final statements = <String>[];
    for (final entry in properties.entries) {
      final jsonName = entry.key;
      final property = entry.value;
      if (rendersAsConstGetter(jsonName, property)) continue;
      if (property.createsNewType) continue;
      final call = property.validationCall;
      if (call == null) continue;
      final dartName = variableSafeName(context.quirks, jsonName);
      // The body references the field/parameter by its bare Dart name. That
      // name is nullable when the storage slot is (optional or spec-nullable)
      // or when a non-const default makes the parameter itself nullable
      // (`Foo? x`, coalesced to the default in the initializer list) — in
      // which case a passed null skips validation and the default (assumed
      // valid) stands.
      final receiverIsNullable =
          propertyDartIsNullable(
            jsonName: jsonName,
            context: context,
            propertyHasDefaultValue: property.hasDefaultValue(context),
          ) ||
          property.common.nullable ||
          property.hasNonConstDefaultValue(context);
      final access = receiverIsNullable ? '?.' : '.';
      statements.add('$dartName$access$call;');
    }
    return statements;
  }

  /// Template context for an object schema.
  @override
  Map<String, dynamic> toTemplateContext(SchemaRenderer context) {
    // Built in one pass so the two lists stay in spec order and the
    // const-getter question is asked once, through [rendersAsConstGetter],
    // rather than re-derived from a key in the map we just built.
    //
    // [storedProperties] is the properties with actual storage. A const getter
    // is fully determined by the class, so it takes no constructor argument,
    // is not read back in `fromJson`, and plays no part in equality — every
    // site that cares about storage iterates it instead of walking all
    // [properties] and skipping as it goes.
    final renderProperties = <Map<String, dynamic>>[];
    final storedProperties = <Map<String, dynamic>>[];
    for (final entry in properties.entries) {
      final propertyContext = propertyTemplateContext(
        jsonName: entry.key,
        property: entry.value,
        context: context,
      );
      renderProperties.add(propertyContext);
      if (!rendersAsConstGetter(entry.key, entry.value)) {
        storedProperties.add(propertyContext);
      }
    }

    final assignmentsLine = buildAssignmentsLine(storedProperties);
    final validationStatements = constructorValidationStatements(context);

    final valueSchema = additionalProperties;
    final hasAdditionalProperties = valueSchema != null;
    if (renderProperties.isEmpty && !hasAdditionalProperties) {
      throw StateError('Object schema has no properties: $this');
    }
    // The constructor-braces and single-property-hashCode decisions count
    // only stored properties, for the same reason.
    final realPropertiesCount =
        storedProperties.length + (hasAdditionalProperties ? 1 : 0);
    // Force named properties to be rendered if hasAdditionalProperties is true.
    final hasProperties = realPropertiesCount > 0;
    const isNullable = false;
    // Wrap the class-level description in a `{@template <snakeName>}`
    // block so the same prose can be reused as the constructor's
    // dartdoc via a `{@macro}` reference. Matches the handwritten
    // Dart convention.
    final hasClassDescription =
        common.title != null || common.description != null;
    final templateName = hasClassDescription ? common.snakeName : null;
    // Objects with no-JSON properties (today: `format: binary` →
    // `Uint8List`) can't round-trip through JSON. The object lives on
    // because it's the method parameter type, but toJson/fromJson must
    // throw wholesale — otherwise the per-property throws become dead
    // code after the first no-JSON property. Matches what the user gets
    // if they accidentally call toJson on a multipart body.
    final hasNoJsonProperty = properties.values.any((p) => p is RenderNoJson);
    // The generated `operator[]` returns whichever value the key selects — a
    // named property or the overflow — so its type must cover them all, and it
    // is always nullable (an absent key yields null).
    final operatorIndexType = valueSchema == null
        ? null
        : DartType.commonType([
            for (final property in properties.values) property.dartType,
            valueSchema.dartType,
          ]).asNullable().toString();
    return {
      'doc_comment': createDocComment(
        common: common,
        templateName: templateName,
      ),
      'constructor_doc_comment': createMacroDocComment(
        templateName: templateName,
        indent: 4,
      ),
      'from_json_doc_comment': wrappedClassDocComment(
        single:
            'Converts a `Map<String, dynamic>` to ${aOrAn(typeName)} '
            '[$typeName].',
        first: 'Converts a `Map<String, dynamic>` to ${aOrAn(typeName)}',
        second: '[$typeName].',
      ),
      'to_json_doc_comment': wrappedClassDocComment(
        single:
            'Converts ${aOrAn(typeName)} [$typeName] to a '
            '`Map<String, dynamic>`.',
        first: 'Converts ${aOrAn(typeName)} [$typeName]',
        second: 'to a `Map<String, dynamic>`.',
      ),
      'typeName': typeName,
      'nullableTypeName': nullableTypeName(context),
      // Class-level `static const`s for optional single-value scalar props
      // (the value a stripped `String?`/`int?` field would otherwise lose).
      'staticConstants': staticConstantContexts(context),
      'hasProperties': hasProperties,
      // Special case behavior hashCode with only one property.
      'hasOneProperty': realPropertiesCount == 1,
      'properties': renderProperties,
      'storedProperties': storedProperties,
      // Constructor named params, partitioned so `required` ones come
      // first (`always_put_required_named_parameters_first`). Each
      // group keeps its spec order, so the result matches a stable sort.
      // Fields, `toJson`, `fromJson`, and equality keep spec order via
      // `properties`; only the constructor reorders. The required
      // `entries` param (additionalProperties) renders between the two
      // groups in the template — last among required, matching the
      // stable sort.
      'requiredConstructorProperties': storedProperties
          .where((p) => p['isRequired'] == true)
          .toList(),
      'optionalConstructorProperties': storedProperties
          .where((p) => p['isRequired'] != true)
          .toList(),
      'hasAdditionalProperties': hasAdditionalProperties,
      'hasNoJsonProperty': hasNoJsonProperty,
      'assignmentsLine': assignmentsLine,
      // Constraint checks (`validatePattern`, `validateMaximum`, ...) for
      // inline non-newtype properties, emitted as the constructor body so
      // both direct construction and `fromJson` reject invalid values.
      'constructorValidation': validationStatements,
      'hasConstructorValidation': validationStatements.isNotEmpty,
      // The constructor can be `const` when the class is `@immutable`
      // (fields are `final`) and there's no initializer list — the only
      // initializers we emit are `this.x = x ?? <non-const default>`,
      // which reference the runtime parameter and so aren't const.
      // Const-constructible `@immutable` classes trip
      // `prefer_const_constructors_in_immutables` otherwise. The sealed
      // parent of a smooshed variant already declares `const`, so
      // variants can be const too.
      'canBeConst': canBeConst(context),
      'additionalPropertiesName': 'entries', // Matching OpenAPI.
      'valueSchema': valueSchema?.typeName,
      'operatorIndexType': operatorIndexType,
      // Per-entry to/from JSON expressions used in the additional-
      // properties for-loop (key/value extracted via `entry.key` /
      // `entry.value`). The for-loop filters out keys that belong to
      // the named properties so a round-trip doesn't accidentally
      // sweep them into `entries`.
      'entryValueToJson': _maybeRuntimeSource(
        valueSchema?.toJsonExpression(
          const DartPropertyAccess(
            target: DartIdentifier('entry'),
            name: 'value',
          ),
          context,
          dartIsNullable: isNullable,
        ),
      ),
      'entryValueFromJson': _maybeRuntimeSource(
        valueSchema?.fromJsonExpression(
          const DartPropertyAccess(
            target: DartIdentifier('entry'),
            name: 'value',
          ),
          context,
          jsonIsNullable: isNullable,
          dartIsNullable: isNullable,
        ),
      ),
      // The set of named-property JSON keys to exclude from
      // `entries` on round-trip. A `const <String>{...}` literal —
      // empty when there are no named properties (always-false
      // contains).
      'namedPropertyKeysSet': properties.isEmpty
          ? 'const <String>{}'
          : 'const {${properties.keys.map(quoteString).join(', ')}}',
      'fromJsonJsonType': context.fromJsonJsonType,
      'castFromJsonArg': context.quirks.dynamicJson,
      'mutableModels': context.quirks.mutableModels,
      'isDeprecated': isDeprecated,
      // When non-null, the template emits `final class X extends Y`
      // and an `@override` on `toJson()`. Set by the naming pass for
      // smooshable inline variants — see [parentSealedTypeName].
      'parentSealedTypeName': parentSealedTypeName,
    };
  }

  @override
  DartExpression fromJsonExpression(
    DartExpression jsonValue,
    SchemaRenderer context, {
    required bool jsonIsNullable,
    required bool dartIsNullable,
  }) => parsedFromJson(
    jsonValue,
    context,
    jsonIsNullable: jsonIsNullable,
    dartIsNullable: dartIsNullable,
  );

  // This would probably be easier if we did a copyWith and then compared with
  // normal equals provided by Equatable.
  @override
  bool equalsIgnoringName(RenderSchema other) {
    if (other is! RenderObject) {
      return false;
    }
    if (!const SetEquality<String>().equals(
      properties.keys.toSet(),
      other.properties.keys.toSet(),
    )) {
      return false;
    }
    for (final entry in properties.entries) {
      final otherEntry = other.properties[entry.key];
      if (otherEntry == null) {
        return false;
      }
      if (!entry.value.equalsIgnoringName(otherEntry)) {
        return false;
      }
    }
    if (!RenderSchema.maybeEqualsIgnoringName(
      additionalProperties,
      other.additionalProperties,
    )) {
      return false;
    }
    if (!const ListEquality<String>().equals(
      requiredProperties,
      other.requiredProperties,
    )) {
      return false;
    }
    return super.equalsIgnoringName(other);
  }

  /// Whether property [jsonName] renders as a fixed const getter rather than
  /// a constructor field. Two shapes qualify, both carried by
  /// [constProperties]: the `allOf: [{$ref: E}]` + single-value `enum` idiom
  /// pinning the property to one member of enum `E` (getter returns
  /// `E.member`), and a bare inline lone `const` on a scalar property
  /// (getter returns the literal itself — issue #240). Such properties are
  /// absent from the constructor, `fromJson`, equality, and example
  /// synthesis.
  ///
  /// The definition of the const-getter shape. Written as a lookup rather
  /// than `containsKey` so it stays a single test even if
  /// `constProperties` ever gains nullable values.
  ///
  /// Gated on `required`: a const getter serializes its value
  /// unconditionally and drops the constructor parameter, so it only models
  /// an *always-present* property. An optional property whose schema admits
  /// one value is "absent, or that value" — a real, omittable field, not a
  /// fixed getter that would force the value into every payload. Such a
  /// property renders as a plain nullable field, with the constant exposed as
  /// a `static const` for callers who want to set it (see
  /// [staticConstantContexts]); the `allOf`-ref pin keeps its named enum,
  /// whose member is already an accessible symbolic value.
  bool rendersAsConstGetter(String jsonName, RenderSchema property) =>
      requiredProperties.contains(jsonName) &&
      constProperties[jsonName] != null &&
      _isConstGetterType(property);

  /// The render types a const getter can pin: a named string enum (returns
  /// `E.member`), a closed-set int newtype (returns `E(value)`), or a plain
  /// inline string/int scalar (returns the literal). The bare-inline-`const`
  /// parser strips its property down to one of the scalars, so those are the
  /// only extra shapes reachable here.
  ///
  /// [RenderIntNewtype] is admitted because its getter returns a properly
  /// typed `E(value)`, not a raw literal. Other named scalar newtypes are
  /// not: an inline scalar getter returns a raw literal (`String get x =>
  /// 'a'`), which only type-checks when the getter's type is the built-in
  /// `String`/`int`; a wrapper-typed getter returning a raw literal wouldn't
  /// compile, so those keep the stored-field shape (`createsNewType` gate).
  static bool _isConstGetterType(RenderSchema property) =>
      property is RenderEnum ||
      property is RenderIntNewtype ||
      ((property is RenderString || property is RenderInteger) &&
          !property.createsNewType);

  /// Class-level `static const` declarations for optional properties fixed to
  /// a single scalar value. The parser strips such a property's `const`/`enum`
  /// down to a plain scalar (so no throwaway single-value enum type is minted)
  /// and records the value in [constProperties]. When the property is
  /// *required* it collapses to a const getter ([rendersAsConstGetter]); when
  /// *optional* it stays an omittable `String?`/`int?` field, and stripping to
  /// a bare scalar would otherwise discard the one legal value. This surfaces
  /// it back as `static const <field>Value = <literal>;`, so a caller can set
  /// the field explicitly (`Foo(apiVersion: Foo.apiVersionValue)`) without a
  /// magic literal.
  ///
  /// Inline scalars only: an `allOf`-ref pin keeps its named enum, whose
  /// member (`E.member`) is already a symbolic value, so it needs no
  /// duplicate constant.
  List<Map<String, dynamic>> staticConstantContexts(SchemaRenderer context) {
    final constants = <Map<String, dynamic>>[];
    for (final entry in properties.entries) {
      final jsonName = entry.key;
      final property = entry.value;
      final constValue = constProperties[jsonName];
      if (constValue == null) continue;
      if (rendersAsConstGetter(jsonName, property)) continue;
      // Only the stripped bare scalars — a named enum (allOf-ref pin) already
      // exposes its value as `E.member`.
      final isInlineScalar =
          (property is RenderString || property is RenderInteger) &&
          !property.createsNewType;
      if (!isInlineScalar) continue;
      final dartName = variableSafeName(context.quirks, jsonName);
      final valueExpression = _pinnedValueExpression(property, constValue);
      constants.add({
        // `$dartName` as a code span, not a `[$dartName]` doc reference: in a
        // mutable model the field is a bare `Type name;`, which the
        // `comment_references` resolver doesn't track, so a symbol link would
        // trip a spurious file-wide ignore directive (issue #363).
        'doc_comment': createDocCommentFromParts(
          body:
              'The single legal value of `$dartName`, exposed so it can be set '
              'explicitly.',
          indent: 4,
        ),
        'declaration':
            'static const ${property.typeName} ${dartName}Value = '
            '$valueExpression;',
      });
    }
    return constants;
  }

  /// Whether the generated constructor is declared `const`.
  ///
  /// Equivalent to the template's gate (`!mutableModels &&
  /// assignmentsLine == null`) but stated directly against the
  /// properties, so it can be asked before the per-property template
  /// contexts are built. A mutable model has non-final fields; an
  /// aggregate assignments line exists exactly when some property that
  /// isn't a const getter has a non-const default (see
  /// [assignmentsLine] and [buildAssignmentsLine]).
  bool canBeConst(SchemaRenderer context) {
    if (context.quirks.mutableModels) return false;
    // A constructor with a validation body isn't a `const` constructor.
    if (constructorValidationStatements(context).isNotEmpty) return false;
    return !properties.entries.any(
      (entry) =>
          !rendersAsConstGetter(entry.key, entry.value) &&
          entry.value.hasNonConstDefaultValue(context),
    );
  }

  @override
  DartExpression? exampleValue(SchemaRenderer context) {
    final args = <String, DartExpression>{};
    for (final entry in properties.entries) {
      final jsonName = entry.key;
      if (!requiredProperties.contains(jsonName)) continue;
      final property = entry.value;
      // Pinned tags are fixed getters, not constructor parameters.
      if (rendersAsConstGetter(jsonName, property)) continue;
      final example = property.exampleValue(context);
      if (example == null) return null;
      // A JSON-required property that also has a default renders as an
      // optional constructor param `= <default>`; passing an example
      // equal to that default is redundant
      // (`avoid_redundant_argument_values`), so omit it — the field
      // still takes the same value. Only a const default's string can
      // match the example here (a `?? DateTime.parse(...)` initializer
      // reads differently from `DateTime.utc(...)`), so this can't drop
      // a genuinely-needed argument.
      //
      // Structural equality between two expression trees, which is the
      // question actually being asked: do these spell the same argument?
      if (property.defaultValueExpression(context) == example) continue;
      final dartName = variableSafeName(context.quirks, jsonName);
      args[dartName] = example;
    }
    // When the schema has `additionalProperties`, the generated class
    // carries a synthetic required `entries` Map field whose value type
    // matches `additionalProperties.typeName` (`dynamic` for open
    // additionalProperties, or the specific type for
    // `additionalProperties: { type: string }` etc). Without this
    // the round-trip test emits a missing-required-arg error for
    // every schema that uses additionalProperties — `copilot_*`,
    // `integration_permissions`, and the `checks_create_request_one_of_*`
    // family on the GitHub spec all hit this.
    final additional = additionalProperties;
    if (additional != null) {
      // An empty map literal is a constant expression, so this argument
      // never costs const-ness.
      args['entries'] = DartMapLiteral(
        keyType: DartType.string,
        valueType: additional.dartType,
      );
    }
    // Any non-const argument makes the whole construction non-const even
    // when the constructor itself is `const` — [DartInvocation.canBeConst]
    // folds that over the arguments.
    return DartInvocation(
      type: dartType,
      namedArguments: args,
      isConstConstructor: canBeConst(context),
    );
  }

  /// Empty map: any required property will fail its type cast inside
  /// `parseFromJson`, which rewraps the TypeError as FormatException.
  /// When there are no required properties, `{}` is a valid instance
  /// and we have no guaranteed-invalid input. The parser drops names
  /// listed in `required` that don't match a real property (with a
  /// warn-log), so [requiredProperties] only ever contains names
  /// that will actually fail the cast — except const-getter properties,
  /// which aren't read from JSON at all, so their absence doesn't make
  /// `{}` invalid.
  @override
  String? invalidJsonExample(SchemaRenderer context) {
    final hasFailingRequired = requiredProperties.any((name) {
      final property = properties[name];
      return property != null && !rendersAsConstGetter(name, property);
    });
    return hasFailingRequired ? '<String, dynamic>{}' : null;
  }
}

class RenderArray extends RenderSchema {
  const RenderArray({
    required super.common,
    required this.items,
    this.defaultValue,
    this.maxItems,
    this.minItems,
    this.uniqueItems = false,
    super.createsNewType = false,
    super.assignedName,
    super.assignedSnakeName,
  });

  /// The items of the resolved schema.
  final RenderSchema items;

  @override
  Iterable<RenderSchema> get children => [items];

  @override
  final dynamic defaultValue;

  /// The maximum number of items in the array.
  final int? maxItems;

  /// The minimum number of items in the array.
  final int? minItems;

  /// Whether the items in the array must be unique.
  final bool uniqueItems;

  @override
  String? get validationCall => validateCall([
    if (minItems != null) 'minItems: $minItems',
    if (maxItems != null) 'maxItems: $maxItems',
    if (uniqueItems) 'unique: true',
  ]);

  // A newtype needs its own `toJson` called (to unwrap the wrapper); a
  // plain inline array needs it only when its items do.
  @override
  bool get shouldCallToJson => createsNewType || items.shouldCallToJson;

  // A `List`-backed newtype has the List's reference equality, so its
  // round-trip test compares JSON rather than `==`/`hashCode`.
  @override
  bool get roundTripByJson => createsNewType;

  // Inline arrays show up as a oneOf variant; the shape-dispatch
  // wrapper class is `<ParentTypeName>List`. A top-level array *newtype*
  // still shape-dispatches on the `List` shape, but its conversion goes
  // through the newtype (below) rather than inlining the item mapping.
  // (A string newtype opts out of shape dispatch entirely because a bare
  // `String` shape rarely discriminates; a `List` shape reliably does.)
  @override
  String? get wrapperTag => 'List';

  @override
  String? get jsonShapeKey => 'List<dynamic>';

  @override
  _VariantConversion? _variantConversion(SchemaRenderer context) {
    // A newtype variant is wrapped by name — the wrapper holds a
    // `Foo`, built with `Foo.fromJson(v)` and serialized via its own
    // `toJson`. This keeps the union referencing the newtype (so import
    // collection sees it) instead of inlining the item type, which the
    // walker no longer descends into.
    if (createsNewType) {
      final name = typeName;
      return _VariantConversion(
        valueType: name,
        fromJson: '$name.fromJson(v)',
        toJson: 'value.toJson()',
      );
    }
    return _VariantConversion(
      valueType: 'List<${items.typeName}>',
      fromJson: _elementsFromJson('v', context),
      toJson: _elementsToJson(context),
    );
  }

  /// The wire-`List<dynamic>`-to-`List<item>` conversion, reading from
  /// [source]. A json-native item (`String`, `int`) casts directly;
  /// anything whose Dart type differs from its wire type — a newtype, an
  /// enum, a `Uri`/`DateTime` pod — maps through the item's own `fromJson`,
  /// because a bare `.cast<Uri>()` over a `List<String>` is a lazy view
  /// that throws on access. Shared by the newtype factory body
  /// ([toTemplateContext], reading `json`) and the oneOf shape-variant
  /// conversion ([_variantConversion], reading the matched `v`).
  String _elementsFromJson(String source, SchemaRenderer context) {
    final itemTypeName = items.typeName;
    if (!items.shouldCallToJson) {
      return '$source.cast<$itemTypeName>()';
    }
    final itemFrom = _runtimeSource(
      items.requireFromJsonExpression(
        const DartIdentifier('e'),
        context,
        jsonIsNullable: false,
        dartIsNullable: false,
      ),
    );
    return '$source.map<$itemTypeName>((e) => $itemFrom).toList()';
  }

  /// The `List<item>`-to-wire conversion, reading from the newtype's
  /// `value` field. Symmetric with [_elementsFromJson]: json-native items
  /// pass through, others map through the item's own `toJson`.
  String _elementsToJson(SchemaRenderer context) {
    if (!items.shouldCallToJson) {
      return 'value';
    }
    final itemTo = items.toJsonExpression(
      const DartIdentifier('e'),
      context,
      dartIsNullable: false,
    );
    return 'value.map((e) => ${_runtimeSource(itemTo)}).toList()';
  }

  /// The type name of this schema. A named top-level array component is
  /// its own newtype (`extension type const Foo._(List<T> value)`), so it
  /// references by class name; an inline array is a bare `List<T>`.
  @override
  DartType get dartType => createsNewType
      ? DartType(_requireAssignedName())
      : DartType.list(items.dartType);

  /// The `List<T>` this newtype wraps — its representation type, and what
  /// the `extension type` `implements`. Only meaningful when
  /// [createsNewType].
  DartType get _newtypeValueType => DartType.list(items.dartType);

  @override
  String equalsExpression(String name, SchemaRenderer context) =>
      '${ModelHelpers.listsEqual}(${_equalsReceiver(name)}, other.$name)';

  @override
  String hashCodeExpression(String name) => '${ModelHelpers.listHash}($name)';

  @override
  DartExpression? defaultValueExpression(SchemaRenderer context) {
    final value = defaultValue;
    if (value == null) {
      return null;
    }
    final listDefault = value as List;
    final DartExpression list;
    if (listDefault.isEmpty) {
      // Type annotation is not needed for empty lists.
      list = DartListLiteral.empty;
    } else {
      list = DartListLiteral(
        elementType: items.dartType,
        elements: listDefault.map(DartLiteral.new).toList(),
      );
    }
    // A newtype field is typed by its class name, so its default has to be
    // wrapped in the newtype constructor rather than left a bare `List`.
    return createsNewType ? _wrapInNewtype(list) : list;
  }

  /// `Foo([...])` — the array value wrapped in the newtype's constructor.
  /// Non-const so it always compiles regardless of element const-ness; the
  /// post-render `dart fix` promotes it to `const` where the elements allow.
  DartExpression _wrapInNewtype(DartExpression list) => DartInvocation(
    type: dartType,
    arguments: [list],
    isConstConstructor: false,
  );

  @override
  DartType get jsonStorageDartType => DartType.list();

  @override
  DartExpression toJsonExpression(
    DartExpression dartName,
    SchemaRenderer context, {
    required bool dartIsNullable,
  }) {
    // A newtype hides the element-mapping inside its own `toJson`; the use
    // site just calls it, like every other newtype.
    if (createsNewType) {
      return DartMethodCall(
        target: dartName,
        name: 'toJson',
        isNullAware: dartIsNullable,
      );
    }
    // Pod types don't need toJson.
    if (!items.shouldCallToJson) {
      return dartName;
    }
    final itemsToJson = items.toJsonExpression(
      const DartIdentifier('e'),
      context,
      dartIsNullable: false,
    );
    return DartMethodCall(
      target: DartMethodCall(
        target: dartName,
        name: 'map',
        arguments: [
          DartLambda(parameters: const ['e'], body: itemsToJson),
        ],
        isNullAware: dartIsNullable,
      ),
      name: 'toList',
    );
  }

  @override
  DartExpression fromJsonExpression(
    DartExpression jsonValue,
    SchemaRenderer context, {
    required bool jsonIsNullable,
    required bool dartIsNullable,
  }) {
    // A newtype parses through its own `fromJson`/`maybeFromJson` factory,
    // like every other newtype — the element-mapping lives there.
    if (createsNewType) {
      return parsedFromJson(
        jsonValue,
        context,
        jsonIsNullable: jsonIsNullable,
        dartIsNullable: dartIsNullable,
      );
    }
    // Cast through a bare `List` first, then convert to the item type —
    // the wire value is a list of anything whatever the items are.
    final cast = jsonCast(jsonValue, jsonIsNullable: jsonIsNullable);
    // Only a truly json-native item (Dart type == wire type: String, int,
    // bool, num) can be cast directly. Items that need conversion — newtypes,
    // enums, and pods like `Uri`/`DateTime` whose wire type is a String —
    // must be mapped through `fromJsonExpression`; a bare `.cast<Uri>()` is a
    // lazy view over the wire Strings that throws on element access.
    final DartExpression converted;
    if (items.shouldCallToJson) {
      const element = DartIdentifier('e');
      converted = DartMethodCall(
        target: DartMethodCall(
          target: cast,
          name: 'map',
          typeArguments: [items.dartType],
          arguments: [
            DartLambda(
              parameters: [element.name],
              body: items.requireFromJsonExpression(
                element,
                context,
                dartIsNullable: false,
                // Unless the item schema itself is nullable, always false.
                jsonIsNullable: false,
              ),
            ),
          ],
          isNullAware: jsonIsNullable,
        ),
        name: 'toList',
      );
    } else {
      converted = DartMethodCall(
        target: cast,
        name: 'cast',
        typeArguments: [items.dartType],
        isNullAware: jsonIsNullable,
      );
    }
    return orDefault(
      converted,
      context: context,
      jsonIsNullable: jsonIsNullable,
      dartIsNullable: dartIsNullable,
    );
  }

  @override
  Map<String, dynamic> toTemplateContext(SchemaRenderer context) {
    final itemTypeName = items.typeName;
    // The newtype's own `fromJson`/`toJson` bodies read from `json`/`value`
    // and map each element through the item schema — the same conversion an
    // inline array does, moved inside the wrapper. A json-native item
    // (`String`, `int`) casts; anything needing conversion (a newtype, enum,
    // or a `Uri`/`DateTime` pod) maps through the item's own factory.
    final String fromJsonBody;
    final String toJsonBody;
    if (items.shouldCallToJson) {
      final itemFrom = _runtimeSource(
        items.requireFromJsonExpression(
          const DartIdentifier('e'),
          context,
          jsonIsNullable: false,
          dartIsNullable: false,
        ),
      );
      fromJsonBody = 'json.map<$itemTypeName>((e) => $itemFrom).toList()';
      final itemTo = items.toJsonExpression(
        const DartIdentifier('e'),
        context,
        dartIsNullable: false,
      );
      toJsonBody = 'value.map((e) => ${_runtimeSource(itemTo)}).toList()';
    } else {
      fromJsonBody = 'json.cast<$itemTypeName>()';
      toJsonBody = 'value';
    }
    final call = validationCall;
    return {
      'doc_comment': createDocComment(common: common),
      'typeName': typeName,
      'nullableTypeName': nullableTypeName(context),
      'valueType': _newtypeValueType.toString(),
      'hasValidations': call != null,
      'validationBody': call == null ? '' : 'value.$call;',
      'fromJsonBody': fromJsonBody,
      'toJsonBody': toJsonBody,
    };
  }

  @override
  bool equalsIgnoringName(RenderSchema other) {
    if (other is! RenderArray) {
      return false;
    }
    if (!items.equalsIgnoringName(other.items)) {
      return false;
    }
    return super.equalsIgnoringName(other);
  }

  @override
  DartExpression? exampleValue(SchemaRenderer context) {
    final inner = items.exampleValue(context);
    if (inner == null) return null;
    // Enough copies to satisfy `minItems` — one otherwise, preserving the
    // single-element example for the common unconstrained case. A round-trip
    // test constructs this instance, so it now has to clear the array's own
    // `validateMinimumItems`/`validateUniqueItems` (#204).
    final minCount = minItems ?? 0;
    final count = minCount < 1 ? 1 : minCount;
    // `uniqueItems` with more than one element would need distinct synthesized
    // values, and `maxItems < count` is an unsatisfiable bound; in both cases
    // synthesis can't produce a valid example, so skip it (the object/newtype
    // then skips its round-trip test, as for any null example).
    if (count > 1 && uniqueItems) return null;
    final maxCount = maxItems;
    if (maxCount != null && count > maxCount) return null;
    final list = DartListLiteral(
      elementType: items.dartType,
      elements: List.filled(count, inner),
    );
    // A newtype example constructs the wrapper around the list literal.
    return createsNewType ? _wrapInNewtype(list) : list;
  }
}

class RenderMap extends RenderSchema {
  const RenderMap({
    required super.common,
    required this.valueSchema,
    required this.keySchema,
    required this.maxProperties,
    required this.minProperties,
    this.defaultValue,
  }) : super(createsNewType: false);

  final RenderSchema valueSchema;

  /// The maximum number of entries this map may carry (`maxProperties`), or
  /// null when unconstrained. Emitted as a `validate(maxProperties: ...)`
  /// argument — the map analog of [RenderArray.maxItems].
  final int? maxProperties;

  /// The minimum number of entries this map must carry (`minProperties`), or
  /// null when unconstrained.
  final int? minProperties;

  @override
  String? get validationCall => validateCall([
    if (minProperties != null) 'minProperties: $minProperties',
    if (maxProperties != null) 'maxProperties: $maxProperties',
  ]);

  /// Optional typed key schema. JSON object keys are strings on the wire, so
  /// a key can only be typed by a schema whose wire form is a string that
  /// round-trips through `fromJson`/`toJson` — a string enum, or a constrained
  /// string rendered as a validated newtype. When null, the map has plain
  /// `String` keys.
  final RenderSchema? keySchema;

  @override
  Iterable<RenderSchema> get children {
    // Local so the null-check promotes — `keySchema` is a public field.
    final key = keySchema;
    return [valueSchema, if (key != null) key];
  }

  @override
  final dynamic defaultValue;

  // Map shape — `Map<String, dynamic>` on the wire. Inline maps
  // (additionalProperties on a parent, or `additionalProperties: true`
  // sibling in a oneOf) use this as their dispatch shape. Typed maps
  // would collide with object variants on the same shape key, but
  // `_canShapeDispatch`'s key-uniqueness gate rejects that case.
  @override
  String? get wrapperTag => 'Map';

  @override
  String? get jsonShapeKey => _mapShapeKey;

  @override
  _VariantConversion? _variantConversion(SchemaRenderer context) {
    // When the entries are JSON-native (no key enum, no value
    // conversion), the matched `v` is already the right shape — just
    // store it. Otherwise walk each entry through the inner schemas'
    // expressions. RenderMap.fromJsonExpression always casts
    // `v as Map<String, dynamic>`, redundantly after the
    // pattern-match, so we build the entry conversion here instead
    // of reusing it.
    final keyEnum = keySchema;
    final value = valueSchema;
    if (keyEnum == null && !value.shouldCallToJson) {
      return _VariantConversion(
        valueType: typeName,
        fromJson: 'v',
        toJson: 'value',
      );
    }
    final keyFromJson = keyEnum == null
        ? 'k'
        : '${keyEnum.typeName}.fromJson(k)';
    final valueFromJson = _runtimeSource(
      value.requireFromJsonExpression(
        const DartIdentifier('val'),
        context,
        jsonIsNullable: false,
        dartIsNullable: false,
      ),
    );
    final keyToJson = keyEnum == null ? 'k' : 'k.toJson()';
    final valueToJson = value.toJsonExpression(
      const DartIdentifier('val'),
      context,
      dartIsNullable: false,
    );
    return _VariantConversion(
      valueType: typeName,
      fromJson: 'v.map((k, val) => MapEntry($keyFromJson, $valueFromJson))',
      toJson: 'value.map((k, val) => MapEntry($keyToJson, $valueToJson))',
    );
  }

  @override
  bool get shouldCallToJson =>
      keySchema != null || valueSchema.shouldCallToJson;

  @override
  DartType get dartType => DartType.map(
    keySchema?.dartType ?? DartType.string,
    valueSchema.dartType,
  );

  @override
  String equalsExpression(String name, SchemaRenderer context) =>
      '${ModelHelpers.mapsEqual}(${_equalsReceiver(name)}, other.$name)';

  @override
  String hashCodeExpression(String name) => '${ModelHelpers.mapHash}($name)';

  @override
  DartType get jsonStorageDartType => _jsonWireMap;

  @override
  DartExpression toJsonExpression(
    DartExpression dartName,
    SchemaRenderer context, {
    required bool dartIsNullable,
  }) {
    const key = DartIdentifier('key');
    const value = DartIdentifier('value');
    // A string-enum key serializes via its `toJson`; a plain String key is
    // already the wire form.
    final keyToJson = keySchema == null
        ? key
        : const DartMethodCall(target: key, name: 'toJson');
    final valueToJson = valueSchema.toJsonExpression(
      value,
      context,
      dartIsNullable: false,
    );
    // Nothing to do if neither side transforms — the same question, and
    // now the same structural answer, as [fromJsonExpression]. Asking the
    // built expression rather than predicting from the schema is what
    // keeps the two directions from disagreeing about what counts as
    // identity.
    if (keyToJson == key && valueToJson == value) {
      return dartName;
    }
    return DartMethodCall(
      target: dartName,
      name: 'map',
      arguments: [
        DartLambda(
          parameters: [key.name, value.name],
          body: DartType.mapEntry.construct([keyToJson, valueToJson]),
        ),
      ],
      isNullAware: dartIsNullable,
    );
  }

  @override
  DartExpression fromJsonExpression(
    DartExpression jsonValue,
    SchemaRenderer context, {
    required bool jsonIsNullable,
    required bool dartIsNullable,
  }) {
    // We could probably do a smaller cast if the value schema is only json
    // types.
    const key = DartIdentifier('key');
    const value = DartIdentifier('value');
    final keySchema = this.keySchema;
    // A string-enum key parses via its `fromJson`; a plain String key is
    // already the wire form.
    final keyFromJson = keySchema == null
        ? key
        : keySchema._fromJsonCall(key, jsonIsNullable: false);
    final valueFromJson = valueSchema.requireFromJsonExpression(
      value,
      context,
      jsonIsNullable: false,
      dartIsNullable: false,
    );
    // TODO(eseidel): Support orDefault?
    // Should this have a leading ? to skip the key on null?
    //
    // When neither side transforms, there is nothing to map: every entry
    // would be rebuilt exactly as it came in, so the `.map` only copies.
    // The cast alone already has the right static type, because the Dart
    // type of a map whose key and value are both json types *is* the json
    // storage type. Identity is a structural question: did each side hand
    // back the identifier it was given?
    final cast = jsonCast(jsonValue, jsonIsNullable: jsonIsNullable);
    if (keyFromJson == key && valueFromJson == value) {
      return cast;
    }
    return DartMethodCall(
      target: cast,
      name: 'map',
      arguments: [
        DartLambda(
          parameters: [key.name, value.name],
          body: DartType.mapEntry.construct([keyFromJson, valueFromJson]),
        ),
      ],
      isNullAware: jsonIsNullable,
    );
  }

  @override
  Map<String, dynamic> toTemplateContext(SchemaRenderer context) =>
      throw UnimplementedError('RenderMap.toTemplateContext');

  @override
  bool equalsIgnoringName(RenderSchema other) {
    if (other is! RenderMap) {
      return false;
    }
    return valueSchema.equalsIgnoringName(other.valueSchema) &&
        RenderSchema.maybeEqualsIgnoringName(keySchema, other.keySchema) &&
        super.equalsIgnoringName(other);
  }

  @override
  DartExpression? exampleValue(SchemaRenderer context) {
    final value = valueSchema.exampleValue(context);
    if (value == null) return null;
    final key = keySchema?.exampleValue(context) ?? const DartLiteral('key');
    return DartMapLiteral.untyped([DartMapEntry(key, value)]);
  }
}

/// Render-tree counterpart to [ResolvedEnum], for the enums that stay Dart
/// enums: string enums, and integer enums whose members have meaningful
/// spec-provided names ([RenderStringEnum] / [RenderIntEnum]). A nameless
/// integer enum renders as a [RenderIntNewtype] instead (#352). Branch points
/// where Dart-emission differs (literal form, JSON storage type, invalid-JSON
/// sentinel) become abstract methods on the parent.
abstract class RenderEnum<T extends Object> extends RenderNewType {
  const RenderEnum({
    required super.common,
    required this.values,
    required this.names,
    required this.descriptions,
    this.defaultValue,
    super.assignedName,
    super.assignedSnakeName,
  }) : assert(
         names.length == values.length,
         'names and values must have the same length',
       );
  // Invariant: if descriptions is non-null, descriptions.length ==
  // values.length. Enforced at parse time (see parser.dart), so we
  // don't re-check here.

  @visibleForTesting
  static List<String> variableNamesFor(Quirks quirks, List<String> values) {
    final commonPrefix = sharedPrefixFromSnakeNames(values);
    String toShortVariableName(String value) {
      var dartName = variableSafeName(
        quirks,
        value,
        // Enum values — and only enum values — honor the SCREAMING_CAPS
        // preservation quirk. For every other identifier (parameters,
        // properties) camelCase is the right Dart style.
        preserveCase: quirks.screamingCapsEnums,
      );
      // OpenAPI also removes shared prefixes from enum values.
      dartName = dartName.replaceAll(commonPrefix, '');
      // Avoid reserved words again in case removing the prefix caused
      // a reserved word collision.
      dartName = avoidReservedWord(dartName);
      return dartName;
    }

    return _uniqueNames(values.map(toShortVariableName).toList());
  }

  /// Disambiguate names that collapsed to the same Dart identifier after
  /// sanitization, so the generated enum has no duplicate members. The
  /// values `g` and `μg`, for example, both reduce to `g` once the
  /// non-ASCII `μ` is dropped; the second becomes `g2`. The first
  /// occurrence keeps the bare name; each later duplicate takes the
  /// smallest free numeric suffix (`g`, `g2`, `g3`). No underscore — the
  /// suffix stays lowerCamelCase.
  static List<String> _uniqueNames(List<String> names) {
    final seen = <String>{};
    final result = <String>[];
    for (final name in names) {
      var unique = name;
      var suffix = 2;
      while (!seen.add(unique)) {
        unique = '$name$suffix';
        suffix++;
      }
      result.add(unique);
    }
    return result;
  }

  @override
  final T? defaultValue;

  /// The enum values.
  final List<T> values;

  /// The Dart variable names of [values], parallel.
  final List<String> names;

  /// Optional per-value dartdoc descriptions, parallel to [values].
  final List<String>? descriptions;

  /// Dart literal for one enum value as it appears after `._(` in the
  /// generated enum declaration. For string enums this quotes; for
  /// int enums it's the int's bare numeric form.
  String enumValueLiteral(T value);

  /// The bare Dart type name of the enum's underlying value (e.g.
  /// `String`, `int`). Drives the template's `final <type> value`
  /// declaration and `<type> toJson()` return type. Derived from
  /// [jsonStorageDartType] — an enum's value type is its JSON wire type.
  String get valueDartType => jsonStorageDartType.toString();

  @override
  String? get wrapperTag => typeName;

  @override
  String? get jsonShapeKey => valueDartType;

  @override
  _VariantConversion? _variantConversion(SchemaRenderer context) =>
      _newtypeConversion(typeName);

  /// Template context for an enum schema.
  @override
  Map<String, dynamic> toTemplateContext(SchemaRenderer context) {
    Map<String, dynamic> enumValueToTemplateContext(int index) {
      final value = values[index];
      final description = descriptions?[index];
      return {
        'enumValueName': variableNameFor(value),
        'enumValue': enumValueLiteral(value),
        'enum_value_doc_comment': createDocCommentFromParts(
          body: description,
          indent: 4,
        ),
      };
    }

    return {
      'doc_comment': createDocComment(common: common),
      'typeName': typeName,
      'nullableTypeName': nullableTypeName(context),
      'valueDartType': valueDartType,
      // A string enum's `value` is already a `String`, so `toString()`
      // returns it directly; an int enum must convert (see the template).
      'valueIsString': jsonStorageDartType == DartType.string,
      'enumValues': [
        for (var i = 0; i < values.length; i++) enumValueToTemplateContext(i),
      ],
    };
  }

  /// The default value of this schema, as an expression.
  @override
  DartExpression? defaultValueExpression(SchemaRenderer context) {
    final value = defaultValue;
    if (value == null) return null;
    return DartType(className).member(variableNameFor(value));
  }

  /// In a context-typed slot the enum type is already known, so the member
  /// reference drops its prefix: `ShipNavFlightMode.cruise` becomes `.cruise`
  /// (Dart 3.10 dot shorthand). See [RenderSchema.slotDefaultExpression].
  @override
  DartExpression? slotDefaultExpression(SchemaRenderer context) {
    final value = defaultValue;
    if (value == null) return null;
    return DartShorthandMember(variableNameFor(value));
  }

  /// Renders [value] as a reference to this enum's member (e.g.
  /// `ActionType.blockMessage`) — used when a property is pinned to a
  /// single constant of this enum and rendered as a fixed getter.
  String constExpression(Object value) =>
      '$className.${variableNameFor(value as T)}';

  @override
  DartExpression fromJsonExpression(
    DartExpression jsonValue,
    SchemaRenderer context, {
    required bool jsonIsNullable,
    required bool dartIsNullable,
  }) => parsedFromJson(
    jsonValue,
    context,
    jsonIsNullable: jsonIsNullable,
    dartIsNullable: dartIsNullable,
  );

  String variableNameFor(T value) => names[values.indexOf(value)];

  @override
  bool equalsIgnoringName(RenderSchema other) {
    if (other is! RenderEnum) {
      return false;
    }
    if (other.runtimeType != runtimeType) return false;
    if (!const ListEquality<Object>().equals(values, other.values)) {
      return false;
    }
    if (!const ListEquality<String>().equals(names, other.names)) {
      return false;
    }
    return super.equalsIgnoringName(other);
  }

  @override
  DartExpression? exampleValue(SchemaRenderer context) {
    // Name the first member directly rather than going through
    // `values.first`: a static member reference is a constant
    // expression, where `values.first` is a getter call and isn't. It
    // also reads better in the generated test.
    final first = names.firstOrNull;
    if (first == null) return null;
    return dartType.member(first);
  }
}

class RenderStringEnum extends RenderEnum<String> {
  const RenderStringEnum({
    required super.common,
    required super.values,
    required super.names,
    required super.descriptions,
    super.defaultValue,
    super.assignedName,
    super.assignedSnakeName,
  });

  @override
  String enumValueLiteral(String value) => quoteString(value);

  @override
  DartType get jsonStorageDartType => DartType.string;

  @override
  String? invalidJsonExample(SchemaRenderer context) =>
      "'__invalid_enum_value__'";
}

/// An integer `enum` whose members have meaningful spec-provided names
/// (Discord's `oneOf` of `const`s with a `title:`), so it stays a Dart enum
/// — the same call as a string enum. A nameless integer enum, whose only
/// names would be synthetic `value<N>`, renders as a [RenderIntNewtype]
/// instead (see the routing in `toRenderSchema` and #352).
class RenderIntEnum extends RenderEnum<int> {
  const RenderIntEnum({
    required super.common,
    required super.values,
    required super.names,
    required super.descriptions,
    super.defaultValue,
    super.assignedName,
    super.assignedSnakeName,
  });

  @override
  String enumValueLiteral(int value) => value.toString();

  @override
  DartType get jsonStorageDartType => DartType.int_;

  @override
  String? invalidJsonExample(SchemaRenderer context) {
    // Pick a value outside the spec'd range. -1 works for almost every
    // real spec (most int enums use small non-negative values like
    // bitfield flags or component-type tags). Falls back to a
    // distinctly-large negative if -1 is somehow in the value set.
    if (!values.contains(-1)) return '-1';
    return '-999999';
  }
}

/// A nameless integer `enum` — a closed set of allowed int values — rendered
/// as a validated int newtype rather than a Dart enum. Emits the same
/// `schema_number_newtype` `extension type` as a bounded integer newtype
/// (it *is* a [RenderInteger]), but with a set-membership validation and
/// the oneOf-variant behavior of the enum it replaces.
///
/// A bounded numeric newtype gates [wrapperTag]/[jsonShapeKey]/
/// [_variantConversion] on `!createsNewType` (a plain scalar newtype is
/// referenced by name, not shape-dispatched). A closed-set int, like the
/// Dart enum it supersedes, *is* shape-dispatchable — matched by
/// `json is int` and wrapped under its own type name in a oneOf — so these
/// are un-gated here. Keeping [ResolvedIntEnum] through the resolve layer
/// means the oneOf dispatch/naming is unchanged; only this type's own file
/// flips from `enum` to `extension type`. See #352.
class RenderIntNewtype extends RenderInteger {
  const RenderIntNewtype({
    required super.common,
    required this.allowedValues,
    super.defaultValue,
    super.assignedName,
    super.assignedSnakeName,
  }) : super(
         maximum: null,
         minimum: null,
         exclusiveMaximum: null,
         exclusiveMinimum: null,
         multipleOf: null,
         createsNewType: true,
       );

  /// The set of int values the spec's `enum` allows, in spec order.
  /// Rendered as a `value.validate(enumValues: [...])` membership check.
  final List<int> allowedValues;

  // A dedicated membership check rather than the multi-bound `validate(...)`
  // sugar: an int enum never carries min/max/multipleOf (the parser routes
  // `enum` away from the bounded-numeric path), so membership is the sole
  // rule and reads better called directly.
  @override
  String? get validationCall =>
      'validateEnumValues([${allowedValues.join(', ')}])';

  @override
  String? get wrapperTag => typeName;

  @override
  String? get jsonShapeKey => 'int';

  @override
  _VariantConversion? _variantConversion(SchemaRenderer context) =>
      _newtypeConversion(typeName);

  @override
  DartExpression? exampleValue(SchemaRenderer context) =>
      newtypeWrappedExample(DartLiteral(allowedValues.first));

  @override
  String? invalidJsonExample(SchemaRenderer context) {
    // A value outside the allowed set. -1 works for almost every real spec
    // (int enums use small non-negative values — bitfield flags, tags);
    // fall back to a distinctly-large negative if -1 is itself allowed.
    if (!allowedValues.contains(-1)) return '-1';
    return '-999999';
  }

  // The allowed set is what distinguishes one closed-set int from another
  // (and from a plain bounded integer), so structural equality must compare
  // it — otherwise two different int enums would dedupe together in the
  // import-collection pass. RenderNumeric.equalsIgnoringName ignores it.
  @override
  bool equalsIgnoringName(RenderSchema other) =>
      other is RenderIntNewtype &&
      const ListEquality<int>().equals(allowedValues, other.allowedValues) &&
      super.equalsIgnoringName(other);
}

class RenderOneOf extends RenderNewType {
  const RenderOneOf({
    required super.common,
    required this.schemas,
    required this.discriminator,
    required this.source,
    this.wrapperNames = const [],
    super.assignedName,
    super.assignedSnakeName,
  });

  /// The schemas of the resolved schema.
  final List<RenderSchema> schemas;

  /// Optional discriminator dispatch table. When present, [schemas] are
  /// rendered as final wrapper subclasses of the sealed parent and the
  /// generated `fromJson` reads the discriminator property to pick the
  /// right variant. When absent, today's renderer falls back to the
  /// UnimplementedError stub — a gap to close in a follow-up.
  final RenderDiscriminator? discriminator;

  /// The source resolved oneOf/anyOf this RenderOneOf was built from,
  /// when there is one. Carried so [toTemplateContext] can call
  /// [decideDispatch] on the resolved tree (where dispatch belongs —
  /// pure spec, no Dart names) and then translate the decision into
  /// mustache context using render-side names + per-variant Dart
  /// conversions. The variants of `source.schemas` and [schemas] are
  /// parallel: index `i` is the resolved/render pair.
  ///
  /// Null for synthesized RenderOneOfs that don't correspond to a
  /// resolved oneOf — e.g. the placeholder built for range-mixed
  /// multi-status responses. These always render as [NoDispatch] /
  /// the legacy `UnimplementedError` stub.
  final ResolvedSchemaCollection? source;

  /// Wrapper subclass class name per variant — index parallel to
  /// [schemas]. Populated by [SpecResolver.toRenderSchema] from the
  /// naming pass's wrapper enumeration. Empty for synthesized
  /// RenderOneOfs (no `source`) and for genuine [NoDispatch] oneOfs
  /// (no wrappers emitted). [wrapperTypeName] looks up by index.
  final List<String?> wrapperNames;

  /// The smooshed inline-object variants of this oneOf — variant
  /// classes that are emitted as `final class X extends Y` inline in
  /// this oneOf's `.dart` file (rather than getting their own file).
  /// Used by the test renderer to synthesize per-variant round-trip
  /// tests in the parent's test file: with smoosh, the variants no
  /// longer have their own `.dart` file and so no longer pick up an
  /// auto-generated test file from the per-schema path. The parent
  /// owns their coverage.
  List<RenderObject> get smooshedVariants =>
      schemas.whereType<RenderObject>().where((v) => v.isSmooshed).toList();

  @override
  Iterable<RenderSchema> get children => schemas;

  @override
  bool equalsIgnoringName(RenderSchema other) {
    if (other is! RenderOneOf) {
      return false;
    }
    if (schemas.length != other.schemas.length) {
      return false;
    }
    for (var i = 0; i < schemas.length; i++) {
      if (!schemas[i].equalsIgnoringName(other.schemas[i])) {
        return false;
      }
    }
    if (discriminator != other.discriminator) {
      return false;
    }
    return super.equalsIgnoringName(other);
  }

  @override
  DartType get jsonStorageDartType =>
      schemas.any((s) => s is RenderPod) ? DartType.dynamic_ : _jsonWireMap;

  /// Looks up the wrapper subclass class name assigned by the naming
  /// pass for [variant]. Variant identity is by index in [schemas]
  /// (which is parallel to `source.schemas`); the naming pass keyed
  /// each wrapper name by `(parentPointer, variantIndex)` and stored
  /// it under [AssignedNames.wrapperPointer]. We thread the resolved
  /// names from there through [wrapperNames] at construction.
  ///
  /// Today's algorithm composes the wrapper name as
  /// `<ParentTypeName><wrapperTag>` (computed in `naming.dart`). A
  /// future PR will swap to shortest-unique-with-fallback; render
  /// doesn't need to know.
  String wrapperTypeName(RenderSchema variant) {
    final i = schemas.indexWhere((s) => identical(s, variant));
    if (i == -1) {
      throw StateError("Variant $variant not in this oneOf's schemas.");
    }
    final name = wrapperNames[i];
    if (name == null) {
      throw StateError(
        'Naming pass did not assign a wrapper name for variant $i '
        'of ${common.pointer}.',
      );
    }
    return name;
  }

  /// Wrapper-variant context for the object-only dispatch paths
  /// (discriminator, required-field, hybrid Map sub-arms). Each
  /// produces a `Map<String, dynamic> toJson() => value.toJson()`
  /// wrapper around the variant's own newtype.
  Map<String, dynamic> objectWrapperContext(RenderSchema variant) => {
    'wrapperTypeName': wrapperTypeName(variant),
    'valueType': variant.typeName,
    'toJsonReturnType': 'Map<String, dynamic>',
    'toJsonBody': 'value.toJson()',
    'positionalBoolIgnore': false,
  };

  /// Per-variant info needed to emit a dispatch arm + wrapper subclass.
  /// Returns null when [variant] isn't representable in the dispatch
  /// (unsupported shape, or runtime-type test would conflict with
  /// another variant). Takes [context] because some variants (Map,
  /// Array) compose with their inner schemas' fromJson/toJson.
  ///
  /// Each variant subclass owns the conversion specifics via
  /// [RenderSchema._variantConversion]; this method just composes the
  /// wrapper class name (parent + tag) and shape key around it.
  _VariantPlan? _planVariant(RenderSchema variant, SchemaRenderer context) {
    // Gate on `wrapperTag != null` — variants with no tag don't
    // participate in shape dispatch (and the naming pass also
    // skipped them, so [wrapperTypeName] would throw). Treating
    // "no tag" as "no plan" keeps the gate semantically the same as
    // before the wrapper-name lift.
    if (variant.wrapperTag == null) return null;
    final shapeKey = variant.jsonShapeKey;
    if (shapeKey == null) return null;
    final conversion = variant._variantConversion(context);
    if (conversion == null) return null;
    return _VariantPlan(
      wrapperTypeName: wrapperTypeName(variant),
      valueType: conversion.valueType,
      jsonTestType: shapeKey,
      fromJson: conversion.fromJson,
      toJson: conversion.toJson,
      positionalBoolIgnore: conversion.positionalBoolIgnore,
    );
  }

  /// Whether the emitted body dispatches on the variants — and so
  /// names them — or falls back to the `UnimplementedError` stub, which
  /// names nothing.
  ///
  /// This is the `decideDispatch(source) is! NoDispatch` prediction that
  /// [additionalImports] below deliberately stopped asking. It is sound
  /// here and unsound there for the same reason: the case that broke it
  /// is a oneOf whose dispatch fires with *no* variants, which emits no
  /// `@immutable` but also has no variant to name. A prediction only
  /// hurts where it can disagree with what was emitted.
  bool get emitsVariantDispatch {
    final src = source;
    return src != null && decideDispatch(src) is! NoDispatch;
  }

  @override
  Iterable<Import> get additionalImports => [
    ...super.additionalImports,
    // The dispatch path emits `@immutable` wrappers that override == /
    // hashCode; the legacy UnimplementedError stub doesn't.
    //
    // Gated on the body naming `immutable` rather than on a
    // `decideDispatch(source) is! NoDispatch` prediction, which this
    // used to ask. The prediction was wrong for a oneOf with no
    // variants — dispatch fires, but the emitted body is a bare
    // `switch (json) { _ => throw }` with no annotation — so the import
    // was unused. Asking what was emitted cannot disagree with it.
    const Import(Libraries.meta),
  ];

  @override
  Map<String, dynamic> toTemplateContext(SchemaRenderer context) {
    final ctx = <String, dynamic>{
      'doc_comment': createDocComment(common: common),
      'typeName': typeName,
      'nullableTypeName': nullableTypeName(context),
    };
    _applyDispatchMode(_pickDispatchMode(context), ctx);
    return ctx;
  }

  /// Picks the dispatch mode for this oneOf. Decision-making (the
  /// structural "which strategy fits this oneOf") is delegated to
  /// [decideDispatch], which operates on the resolved tree without
  /// any Dart-name knowledge. This method is the render-side
  /// translator: it converts the abstract [DispatchDecision] back
  /// into the render-coupled [_DispatchMode] template-context bag,
  /// using [wrapperTypeName] / [_planVariant] / [_VariantConversion]
  /// to splice in Dart-name and per-variant conversion strings.
  _DispatchMode _pickDispatchMode(SchemaRenderer context) {
    final src = source;
    if (src == null) return const _NoDispatchMode();
    return _decisionToMode(decideDispatch(src), context);
  }

  /// Translates a structural [DispatchDecision] into a [_DispatchMode].
  /// The resolved → render variant mapping uses index parity:
  /// `source.schemas[i]` corresponds to [schemas]`[i]` (preserved by
  /// [SpecResolver.toRenderSchema]).
  _DispatchMode _decisionToMode(
    DispatchDecision decision,
    SchemaRenderer context,
  ) {
    // [_pickDispatchMode] short-circuits to NoDispatchMode when source
    // is null, so any decision other than NoDispatch came from a real
    // resolved oneOf — `source!` is sound here.
    final src = source!;
    RenderSchema renderOf(ResolvedSchema resolved) {
      final i = src.schemas.indexWhere((s) => identical(s, resolved));
      if (i == -1) {
        throw StateError(
          'Decision references variant not in source.schemas: $resolved',
        );
      }
      return schemas[i];
    }

    return switch (decision) {
      final DiscriminatorDispatch d => _buildDiscriminatorMode(
        d,
        renderOf,
        context,
      ),
      final ShapeDispatch d => _buildShapeMode(d, renderOf, context),
      final HybridDispatch d => _buildHybridMode(d, renderOf, context),
      final PredicateDispatch d => _buildPredicateMode(d, renderOf, context),
      NoDispatch() => const _NoDispatchMode(),
    };
  }

  /// Format a discriminator value as the Dart literal that goes into a
  /// `switch (json[propertyName])` case key. String values are quoted
  /// (`'creation'`); int values are emitted raw (`1`). Generated as a
  /// pre-formatted string at render time so the template can splice
  /// it without further quoting.
  String _discriminatorCaseLiteral(Object value) {
    if (value is String) return quoteString(value);
    return value.toString();
  }

  /// Build a [_DiscriminatorMode], splitting variants into smooshed
  /// (the variant data class extends the sealed parent directly,
  /// inlined in the parent's file) and non-smooshed (today's wrapper-
  /// subclass + `value:` indirection). Each `dispatch` entry's
  /// `caseExpression` already contains the full Dart expression to
  /// `return`, so the template emits it directly.
  _DiscriminatorMode _buildDiscriminatorMode(
    DiscriminatorDispatch dispatch,
    RenderSchema Function(ResolvedSchema) renderOf,
    SchemaRenderer context,
  ) {
    final cases = <Map<String, dynamic>>[];
    for (final entry in dispatch.mapping) {
      final renderVariant = renderOf(entry.variant);
      final fromJson = '${renderVariant.typeName}.fromJson(json)';
      cases.add({
        'caseLiteral': _discriminatorCaseLiteral(entry.value),
        'caseExpression': renderVariant.isSmooshed
            ? fromJson
            : '${wrapperTypeName(renderVariant)}($fromJson)',
      });
    }
    final variants = <Map<String, dynamic>>[];
    final smooshedVariants = <Map<String, dynamic>>[];
    for (final v in dispatch.variants) {
      final renderVariant = renderOf(v);
      if (renderVariant.isSmooshed) {
        smooshedVariants.add(renderVariant.toTemplateContext(context));
      } else {
        variants.add(objectWrapperContext(renderVariant));
      }
    }
    return _DiscriminatorMode(
      discriminatorProperty: dispatch.propertyName,
      dispatch: cases,
      variants: variants,
      smooshedVariants: smooshedVariants,
    );
  }

  /// Build a [_ShapeMode], splitting variants into smooshed (the
  /// variant data class extends the sealed parent directly, inlined
  /// in the parent's file) and non-smooshed (today's wrapper-subclass
  /// + `value:` indirection). Each `dispatch` entry's `caseExpression`
  /// is the full Dart expression to `return` from its switch arm.
  _ShapeMode _buildShapeMode(
    ShapeDispatch shapeDispatch,
    RenderSchema Function(ResolvedSchema) renderOf,
    SchemaRenderer context,
  ) {
    final dispatch = <Map<String, dynamic>>[];
    final variants = <Map<String, dynamic>>[];
    final smooshedVariants = <Map<String, dynamic>>[];
    for (final arm in shapeDispatch.arms) {
      final renderVariant = renderOf(arm.variant);
      if (renderVariant.isSmooshed) {
        // Smooshed object variants are always Map-shaped; the case
        // arm constructs the variant directly. The wrapper subclass
        // is gone, the variant data class is inlined into the parent
        // file as a direct sealed subclass. We skip `_planVariant`
        // here because its `wrapperTypeName(variant)` lookup would
        // throw — the naming pass intentionally skipped the wrapper
        // claim for smooshable variants.
        dispatch.add({
          'jsonTestType': _mapShapeKey,
          'caseExpression': '${renderVariant.typeName}.fromJson(v)',
        });
        smooshedVariants.add(renderVariant.toTemplateContext(context));
      } else {
        final plan = _planVariant(renderVariant, context)!;
        dispatch.add({
          'jsonTestType': plan.jsonTestType,
          'caseExpression': '${plan.wrapperTypeName}(${plan.fromJson})',
        });
        variants.add(_shapeWrapperContext(plan));
      }
    }
    return _ShapeMode(
      dispatch: dispatch,
      variants: variants,
      smooshedVariants: smooshedVariants,
    );
  }

  /// Build a [_HybridMode], splitting variants by smooshed/not.
  /// Hybrid has up to five arm flavors — non-collision shape arms,
  /// predicate-guarded Map arms, an optional unguarded Map fallback,
  /// predicate-guarded List arms, and an optional unguarded List
  /// fallback — each of which composes the same `caseExpression`: a
  /// direct `<Variant>.fromJson(v)` for smooshed variants and the
  /// wrapper-class call for the rest. Variants that get a wrapper
  /// land in `variants`; smooshed ones in `smooshedVariants` and are
  /// inlined into the parent's file by the schema_object partial.
  _HybridMode _buildHybridMode(
    HybridDispatch dispatch,
    RenderSchema Function(ResolvedSchema) renderOf,
    SchemaRenderer context,
  ) {
    final variants = <Map<String, dynamic>>[];
    final smooshedVariants = <Map<String, dynamic>>[];

    // Smoosh-aware case expression for a Map-shaped variant:
    // smooshed → bare `<Variant>.fromJson(v)`; otherwise wrap in
    // the variant's wrapper subclass.
    String mapCaseExpression(RenderSchema variant) {
      final fromJson = '${variant.typeName}.fromJson(v)';
      return variant.isSmooshed
          ? fromJson
          : '${wrapperTypeName(variant)}($fromJson)';
    }

    // Wrapped case expression for any non-Map variant (List, primitive).
    // None of these are smoosh-eligible: array variants are excluded
    // structurally, and primitives can't extend a sealed class.
    String wrappedCaseExpression(RenderSchema variant) {
      final plan = _planVariant(variant, context)!;
      return '${plan.wrapperTypeName}(${plan.fromJson})';
    }

    // Pick the right case-expression form based on the arm's shape
    // key. Map-shaped arms take the smoosh-aware path; everything
    // else (List + primitives) goes through the wrapped form.
    String shapeArmCaseExpression(RenderSchema variant, String shapeKey) =>
        shapeKey == _mapShapeKey
        ? mapCaseExpression(variant)
        : wrappedCaseExpression(variant);

    final renderedShapeArms = <Map<String, dynamic>>[];
    for (final arm in dispatch.shapeArms) {
      final renderVariant = renderOf(arm.variant);
      renderedShapeArms.add({
        'jsonTestType': arm.shapeKey,
        'caseExpression': shapeArmCaseExpression(renderVariant, arm.shapeKey),
      });
    }

    final renderedMapArms = <Map<String, dynamic>>[];
    for (final arm in dispatch.mapArms) {
      renderedMapArms.add({
        'predicateTest': arm.predicate.dartIfTest('v'),
        'caseExpression': mapCaseExpression(renderOf(arm.variant)),
      });
    }

    final renderedMapFallback = dispatch.mapFallback == null
        ? null
        : {
            'caseExpression': mapCaseExpression(
              renderOf(dispatch.mapFallback!),
            ),
          };

    final renderedListArms = <Map<String, dynamic>>[];
    for (final arm in dispatch.listArms) {
      renderedListArms.add({
        'predicateTest': arm.predicate.dartIfTest('v'),
        'caseExpression': wrappedCaseExpression(renderOf(arm.variant)),
      });
    }

    final renderedListFallback = dispatch.listFallback == null
        ? null
        : {
            'caseExpression': wrappedCaseExpression(
              renderOf(dispatch.listFallback!),
            ),
          };

    // A variant lands in one of three buckets, in priority order:
    //   1. Smooshed → `smooshedVariants` (variant data class extends
    //      the sealed parent directly, inlined into the parent file).
    //   2. Map-shaped → `objectWrapperContext` (wrapper's
    //      `toJson` delegates to `value.toJson()`, returning
    //      `Map<String, dynamic>`). Includes both Map sub-dispatch
    //      arms (`mapArms`/`mapFallback`) and the single-Map shape
    //      arm case where one Map variant sits beside multi-variant
    //      List collisions.
    //   3. Otherwise (string, int, list) → `_shapeWrapperContext`
    //      (wrapper's `toJson` returns `dynamic` and stores the
    //      JSON-typed value verbatim).
    for (final v in dispatch.declarationOrder) {
      final renderVariant = renderOf(v);
      if (renderVariant.isSmooshed) {
        smooshedVariants.add(renderVariant.toTemplateContext(context));
      } else if (renderVariant.jsonShapeKey == _mapShapeKey) {
        variants.add(objectWrapperContext(renderVariant));
      } else {
        final plan = _planVariant(renderVariant, context)!;
        variants.add(_shapeWrapperContext(plan));
      }
    }
    return _HybridMode(
      shapeArms: renderedShapeArms,
      mapArms: renderedMapArms,
      mapFallback: renderedMapFallback,
      listArms: renderedListArms,
      listFallback: renderedListFallback,
      variants: variants,
      smooshedVariants: smooshedVariants,
    );
  }

  _PredicateDispatchMode _buildPredicateMode(
    PredicateDispatch predicateDispatch,
    RenderSchema Function(ResolvedSchema) renderOf,
    SchemaRenderer context,
  ) {
    final kind = predicateDispatch.kind;
    final dispatch = <Map<String, dynamic>>[];
    Map<String, dynamic>? fallback;
    final variants = <Map<String, dynamic>>[];
    final smooshedVariants = <Map<String, dynamic>>[];
    for (final arm in predicateDispatch.arms) {
      final renderVariant = renderOf(arm.variant);
      // Smooshed variants (today: only inline-object variants under
      // required-field dispatch) are emitted as direct subclasses of
      // the sealed parent, *inline* in the parent's file — Dart's
      // `sealed` modifier requires direct subclasses to live in the
      // same library. The dispatch case arm constructs the variant
      // itself (no outer wrap call); the wrapper-subclass form is
      // skipped entirely. Non-smooshed variants keep the wrapper
      // form and continue to render to their own file.
      final Map<String, dynamic> armCtx;
      switch (kind) {
        case PredicateDispatchKind.requiredField:
          final fromJson = '${renderVariant.typeName}.fromJson(json)';
          armCtx = {
            'caseExpression': renderVariant.isSmooshed
                ? fromJson
                : '${wrapperTypeName(renderVariant)}($fromJson)',
          };
          if (renderVariant.isSmooshed) {
            smooshedVariants.add(renderVariant.toTemplateContext(context));
          } else {
            variants.add(objectWrapperContext(renderVariant));
          }
        case PredicateDispatchKind.arrayElement:
          // Each array variant wraps `List<X>` and serializes via
          // the items' own conversion. Wrapper class names splice
          // the items type so sibling array variants don't collide
          // on the shared `wrapperTag = 'List'`; the naming pass
          // composed the splice when it enumerated wrappers, and we
          // read it back here through the standard lookup. Array-
          // element variants are never smoosh-eligible (the variant
          // is a list, not an object), so this path always emits a
          // wrapper.
          final wrapperName = wrapperTypeName(renderVariant);
          final plan = _planVariant(renderVariant, context)!;
          armCtx = {
            'caseExpression': '$wrapperName(${plan.fromJson})',
          };
          variants.add({
            'wrapperTypeName': wrapperName,
            'valueType': plan.valueType,
            'jsonTestType': plan.jsonTestType,
            'fromJson': plan.fromJson,
            'toJsonBody': plan.toJson,
            'toJsonReturnType': 'dynamic',
            'positionalBoolIgnore': plan.positionalBoolIgnore,
          });
      }
      if (arm.isFallback) {
        fallback = armCtx;
      } else {
        armCtx['predicateTest'] = arm.predicate.dartIfTest(
          kind == PredicateDispatchKind.arrayElement ? 'v' : 'json',
        );
        dispatch.add(armCtx);
      }
    }
    final factoryParamType = kind == PredicateDispatchKind.arrayElement
        ? 'dynamic'
        : 'Map<String, dynamic>';
    final preamble = kind == PredicateDispatchKind.arrayElement
        ? const [
            {'line': 'final v = json as List;'},
          ]
        : false;
    final throwMessage = kind == PredicateDispatchKind.arrayElement
        ? 'No variant of $typeName matched first array element'
        : 'No variant of $typeName matched json keys: '
              r'${json.keys.toList()}';
    final toJsonReturnType = kind == PredicateDispatchKind.arrayElement
        ? 'dynamic'
        : 'Map<String, dynamic>';
    return _PredicateDispatchMode(
      dispatch: dispatch,
      fallback: fallback,
      variants: variants,
      smooshedVariants: smooshedVariants,
      factoryParamType: factoryParamType,
      preamble: preamble,
      throwMessage: throwMessage,
      toJsonReturnType: toJsonReturnType,
    );
  }

  @override
  DartExpression fromJsonExpression(
    DartExpression jsonValue,
    SchemaRenderer context, {
    required bool jsonIsNullable,
    required bool dartIsNullable,
  }) => _fromJsonCall(
    jsonCast(jsonValue, jsonIsNullable: jsonIsNullable),
    jsonIsNullable: jsonIsNullable,
  );

  @override
  dynamic get defaultValue => null;

  @override
  DartExpression? exampleValue(SchemaRenderer context) {
    // A oneOf / anyOf currently renders as a sealed class with no
    // subclasses (the template at `schema_one_of.mustache` emits only
    // the base class and an `UnimplementedError`-throwing fromJson).
    // There is therefore no Dart value of the sealed type that can be
    // constructed at compile time — returning a branch's own example
    // doesn't type-check against the enclosing field, which produces
    // errors like `String can't be assigned to IssuesCreateRequestTitle`
    // in the generated round-trip tests.
    //
    // Opting out via `null` propagates through the containing object,
    // which skips the round-trip test for it entirely. We lose
    // coverage for every schema that transitively depends on a
    // oneOf/anyOf, but today's coverage is fake anyway — the tests
    // don't compile. Restoring real coverage requires real
    // discriminator-aware subclass emission (#99).
    return null;
  }
}

/// Wire-source expression for decoding a response body. Returns
/// `jsonDecode(response.body)` for JSON content (or unspecified —
/// most specs imply JSON), and the raw `response.body` for everything
/// else (`text/plain`, `text/html`, `application/octet-stream`, …).
/// Used by both the single-schema return path and the per-arm
/// decode in multi-status dispatch.
/// `response.body`, the raw string an api method gets back.
const _responseBody = DartPropertyAccess(
  target: DartIdentifier('response'),
  name: 'body',
);

/// `response.bodyBytes`, the raw `Uint8List` an api method gets back for a
/// binary response body ([RenderBinary]). Sourced instead of [_responseBody]
/// so a `Uint8List` return type isn't handed a `String`.
const _responseBodyBytes = DartPropertyAccess(
  target: DartIdentifier('response'),
  name: 'bodyBytes',
);

/// Where an api method reads its response body from.
///
/// An enum rather than the expression alone because callers branch on
/// *which* of the two it is — a raw body skips `fromJson` entirely — and
/// recovering that by comparing the rendered text against
/// `'response.body'` is the coupling `doc/dart_expression.md` calls out.
enum _ResponseBodySource {
  /// The body is JSON and has to be decoded before parsing.
  // Not `call(...)`: a const initializer needs the constructor directly.
  json(DartFunctionCall(name: 'jsonDecode', arguments: [_responseBody])),

  /// A non-JSON content type: the body is the value.
  raw(_responseBody);

  const _ResponseBodySource(this.expression);

  final DartExpression expression;

  static _ResponseBodySource of(String? contentType) =>
      contentType == null || contentType == 'application/json' ? json : raw;
}

/// One status-code entry in a multi-status response: the status, the
/// wrapper subclass name (`<Parent>200`), the body schema (null for
/// empty-body statuses like 204), and the wire content type (drives
/// `jsonDecode` vs raw `response.body` per status). Owns the per-
/// status projection into the two template contexts it feeds —
/// keeps the body / no-body branch in one place per output instead
/// of fanning out across the caller's loop.
@immutable
final class _StatusInfo {
  const _StatusInfo({
    required this.statusCode,
    required this.wrapperTypeName,
    required this.body,
    required this.contentType,
  });

  final int statusCode;
  final String wrapperTypeName;
  final RenderSchema? body;
  final String? contentType;

  /// Mustache context for the wrapper class definition emitted by the
  /// `_multi_status_response` partial.
  Map<String, dynamic> wrapperClassDef() {
    final body = this.body;
    if (body == null) {
      return {
        'wrapperTypeName': wrapperTypeName,
        'statusCode': statusCode,
        'hasBody': false,
      };
    }
    return {
      'wrapperTypeName': wrapperTypeName,
      'valueType': body.typeName,
      'hasBody': true,
    };
  }

  /// Mustache context for one `case` in the api method's
  /// `switch (response.statusCode)`.
  Map<String, dynamic> switchCase(SchemaRenderer context) {
    final body = this.body;
    final String construction;
    if (body == null) {
      construction = 'const $wrapperTypeName()';
    } else {
      final decoded = _runtimeSource(
        body.requireFromJsonExpression(
          _ResponseBodySource.of(contentType).expression,
          context,
          jsonIsNullable: false,
          dartIsNullable: false,
        ),
      );
      construction = '$wrapperTypeName($decoded)';
    }
    return {
      'statusCode': statusCode,
      'construction': construction,
    };
  }
}

/// Pre-built template context for a multi-status operation.
@immutable
final class _MultiStatusContext {
  const _MultiStatusContext({
    required this.typeName,
    required this.wrapperClassDefs,
    required this.switchCases,
  });

  /// Synthesized sealed-class name (e.g. `ReposGetResponse`).
  final String typeName;

  /// One mustache context per wrapper subclass to emit, consumed by
  /// the `_multi_status_response` partial. Carries `wrapperTypeName`,
  /// `hasBody`, and either `valueType` (body present) or `statusCode`
  /// (empty body, used for the identity-only `hashCode`).
  final List<Map<String, dynamic>> wrapperClassDefs;

  /// One mustache context per `case` in the api method's
  /// `switch (response.statusCode)`. Carries `statusCode` and
  /// `construction` (the Dart expression that builds the wrapper).
  final List<Map<String, dynamic>> switchCases;
}

/// The JSON shape key shared by every object-like variant
/// ([RenderObject], [RenderEmptyObject], [RenderMap]). Centralized so
/// the hybrid dispatch's "Map collision" detection has a single
/// authoritative spelling.
const String _mapShapeKey = 'Map<String, dynamic>';

/// Wrapper-variant context for the shape-dispatch paths (pure shape
/// and the non-Map arms of hybrid). The wrapper stores the matched
/// JSON value verbatim and `toJson()` returns it — for primitive
/// variants the return type can't be `Map<String, dynamic>` since it
/// might be `int`, `String`, etc., so we use `dynamic`.
Map<String, dynamic> _shapeWrapperContext(_VariantPlan p) => {
  'wrapperTypeName': p.wrapperTypeName,
  'valueType': p.valueType,
  'jsonTestType': p.jsonTestType,
  'fromJson': p.fromJson,
  'toJsonBody': p.toJson,
  'toJsonReturnType': 'dynamic',
  'positionalBoolIgnore': p.positionalBoolIgnore,
};

/// Which dispatch mode a [RenderOneOf] picks for its `fromJson`
/// body. Subtypes are mutually exclusive — exactly one is
/// constructed per oneOf — and each carries the typed data its
/// template branch needs. The Dart-side switch in
/// [RenderOneOf.toTemplateContext] is the single place that
/// projects a mode onto the Mustache `has_*_dispatch` bools and
/// per-mode keys, so the "exactly one bool true with the matching
/// data" invariant lives in the type system instead of by
/// convention.
sealed class _DispatchMode {
  const _DispatchMode();
}

/// Discriminator dispatch — `switch (json[propertyName])`.
class _DiscriminatorMode extends _DispatchMode {
  const _DiscriminatorMode({
    required this.discriminatorProperty,
    required this.dispatch,
    required this.variants,
    required this.smooshedVariants,
  });

  final String discriminatorProperty;

  /// Per-arm contexts: each entry has the discriminator string `value`
  /// and a `caseExpression` (the full Dart expression to `return` —
  /// already includes the wrapper-class call when the variant has a
  /// wrapper, or just `Variant.fromJson(json)` when smooshed).
  final List<Map<String, dynamic>> dispatch;

  /// Non-smooshed variants — wrapper subclass declarations, in
  /// declaration order. Smooshed variants (those whose data class
  /// extends the sealed parent directly) are in [smooshedVariants];
  /// the union of the two preserves declaration order.
  final List<Map<String, dynamic>> variants;

  /// Smooshed variants — emitted *inline in the parent's file* as
  /// direct sealed subclasses, no wrapper shim. Each entry is the
  /// variant's full `toTemplateContext` so the schema_object partial
  /// can render the class body unchanged. Same shape as
  /// [_PredicateDispatchMode.smooshedVariants].
  final List<Map<String, dynamic>> smooshedVariants;
}

/// Pure shape dispatch — `switch (json) { T v => ... }`.
class _ShapeMode extends _DispatchMode {
  const _ShapeMode({
    required this.dispatch,
    required this.variants,
    required this.smooshedVariants,
  });

  /// Per-arm contexts: each entry has `jsonTestType` (the case
  /// pattern type, e.g. `int`, `Map<String, dynamic>`) and
  /// `caseExpression` (the full Dart expression to `return` —
  /// includes the wrapper-class call when the variant has a wrapper,
  /// or just `Variant.fromJson(v)` when smooshed).
  final List<Map<String, dynamic>> dispatch;

  /// Non-smooshed variants — wrapper subclass declarations, in
  /// declaration order. Smooshed variants (those whose data class
  /// extends the sealed parent directly) are in [smooshedVariants];
  /// the union of the two preserves declaration order.
  final List<Map<String, dynamic>> variants;

  /// Smooshed variants — emitted *inline in the parent's file* as
  /// direct sealed subclasses, no wrapper shim. Each entry is the
  /// variant's full `toTemplateContext` so the schema_object partial
  /// can render the class body unchanged.
  final List<Map<String, dynamic>> smooshedVariants;
}

/// Hybrid dispatch — single-variant shape arms followed by Map and
/// List sub-dispatches (each checked-then-fallback). Used when 2+
/// variants collide on `Map<String, dynamic>`, `List<dynamic>`, or
/// both. Single-variant shapes (string, int, single Map, single List)
/// pass through unchanged in [shapeArms].
class _HybridMode extends _DispatchMode {
  const _HybridMode({
    required this.shapeArms,
    required this.mapArms,
    required this.mapFallback,
    required this.listArms,
    required this.listFallback,
    required this.variants,
    required this.smooshedVariants,
  });

  /// Per-arm contexts for single-variant shape arms (no collision).
  /// Each entry has `jsonTestType` and `caseExpression` (the full
  /// Dart expression to `return`).
  final List<Map<String, dynamic>> shapeArms;

  /// Per-arm contexts for predicate-guarded Map arms. Each entry has
  /// `predicateTest` (the `v.containsKey('foo')` check) and
  /// `caseExpression`. Empty when at most one Map variant exists.
  final List<Map<String, dynamic>> mapArms;

  /// `null` when no fallback applies (the Map sub-dispatch ends in a
  /// throw, or there's no Map sub-dispatch at all). Otherwise has
  /// just `caseExpression`. Projects to `false` at the template
  /// boundary; the mustache inverted section fires on null/false
  /// alike.
  final Map<String, dynamic>? mapFallback;

  /// Per-arm contexts for predicate-guarded List arms. Each entry
  /// has `predicateTest` (the `v.first is X` check) and
  /// `caseExpression`. Empty when at most one List variant exists.
  final List<Map<String, dynamic>> listArms;

  /// `null` when no fallback applies (the List sub-dispatch ends in
  /// a throw, or there's no List sub-dispatch at all). Same shape as
  /// [mapFallback].
  final Map<String, dynamic>? listFallback;

  /// Non-smooshed variants — wrapper subclass declarations, in
  /// declaration order. Smooshed variants (those whose data class
  /// extends the sealed parent directly) are in [smooshedVariants];
  /// the union of the two preserves declaration order.
  final List<Map<String, dynamic>> variants;

  /// Smooshed variants — emitted *inline in the parent's file* as
  /// direct sealed subclasses, no wrapper shim. Each entry is the
  /// variant's full `toTemplateContext` so the schema_object partial
  /// can render the class body unchanged.
  final List<Map<String, dynamic>> smooshedVariants;
}

/// Predicate-driven if-chain dispatch — covers every mode whose
/// generated `fromJson` is "test predicate, return wrapper" repeated
/// per arm with an optional unguarded fallback. Currently:
///
/// - **Required-field / property-presence**: factory takes a
///   `Map<String, dynamic>` directly; predicates run `containsKey`
///   on it; wrappers wrap the Map back as `value.toJson()`.
/// - **Array-element**: factory takes `dynamic`, casts to `List` in
///   the preamble, predicates peek the first element; wrappers wrap
///   `List<X>` and serialize element-wise.
///
/// The two differ in five knobs: factory parameter type, optional
/// preamble line, per-arm wrapper construction, the throw message
/// used when no arm matches, and the `toJson()` return type. Adding
/// a new predicate kind that fits the if-chain shape (e.g. peeking
/// a property's array, an `int`-valued tag) is a new picker that
/// builds this mode with different knob values — no new mode class,
/// no new template branch.
class _PredicateDispatchMode extends _DispatchMode {
  const _PredicateDispatchMode({
    required this.dispatch,
    required this.fallback,
    required this.variants,
    required this.smooshedVariants,
    required this.factoryParamType,
    required this.preamble,
    required this.throwMessage,
    required this.toJsonReturnType,
  });

  /// Per-arm contexts for each checked branch. Each entry has a
  /// `predicateTest` key and a `caseExpression` key (the full Dart
  /// expression to `return` — already includes the wrapper-class
  /// call when the variant has a wrapper, or just the variant's
  /// `fromJson(json)` when the variant is smooshed).
  final List<Map<String, dynamic>> dispatch;

  /// Unguarded fallback at the end of the if-chain (no `if`).
  /// Same per-arm shape as [dispatch] entries.
  final Map<String, dynamic>? fallback;

  /// Non-smooshed variants — wrapper subclass declarations, in
  /// declaration order. Smooshed variants (those whose data class
  /// extends the sealed parent directly) are in [smooshedVariants];
  /// the union of the two preserves declaration order.
  final List<Map<String, dynamic>> variants;

  /// Smooshed variants (today: only inline `RenderObject` variants
  /// under required-field dispatch) — emitted *inline in the parent
  /// file* as direct subclasses of the sealed class, with no wrapper
  /// shim. Each entry is the variant's full `toTemplateContext` so
  /// the schema_object partial can render the class body unchanged.
  /// Sealed subclasses must live in the same library, which is why
  /// these can't be separate files like non-smooshed variants are.
  final List<Map<String, dynamic>> smooshedVariants;

  /// Type of the `fromJson(... json)` parameter — `Map<String, dynamic>`
  /// for object-shaped dispatches, `dynamic` for ones whose preamble
  /// performs the cast.
  final String factoryParamType;

  /// Truthy-or-`false` mustache section value: a single-element list
  /// `[{'line': '...'}]` to emit one preamble line, or `false` to
  /// emit nothing. Modes that need to bind a local before the
  /// if-chain (e.g. `final v = json as List;`) use this; modes that
  /// run predicates directly on the factory parameter pass `false`.
  final Object preamble;

  /// Message inside the unguarded-fallback `throw FormatException(...)`.
  /// Pre-substitutes the parent typeName so mustache only splices.
  final String throwMessage;

  /// Wrapper `toJson()` return type — `Map<String, dynamic>` when
  /// every variant's wrapped value is itself a Map, `dynamic` when
  /// any variant wraps a non-Map value (List, primitive, etc).
  final String toJsonReturnType;
}

/// No dispatch picked — emits the legacy `UnimplementedError` stub.
class _NoDispatchMode extends _DispatchMode {
  const _NoDispatchMode();
}

/// Project [mode] onto the Mustache context [ctx] — seeds every
/// `has_*_dispatch` flag to false (mustache section tags require
/// the key to exist), flips the matching one to true, and writes
/// that mode's per-template-branch keys. The exhaustive switch is
/// the single place that maps each mode to its template keys, so
/// the per-mode key lists read side-by-side.
void _applyDispatchMode(_DispatchMode mode, Map<String, dynamic> ctx) {
  ctx['has_discriminator_dispatch'] = false;
  ctx['has_shape_dispatch'] = false;
  ctx['has_hybrid_dispatch'] = false;
  ctx['has_predicate_dispatch'] = false;
  ctx['no_dispatch'] = false;
  // Modes that take a Map argument override below; shape / hybrid /
  // no-dispatch keep `dynamic` since the matched JSON might be a
  // primitive.
  ctx['maybeFromJsonParamType'] = 'dynamic';
  switch (mode) {
    case _DiscriminatorMode(
      :final discriminatorProperty,
      :final dispatch,
      :final variants,
      :final smooshedVariants,
    ):
      ctx['has_discriminator_dispatch'] = true;
      ctx['discriminatorProperty'] = discriminatorProperty;
      ctx['dispatch'] = dispatch;
      ctx['variants'] = variants;
      ctx['smooshedVariants'] = smooshedVariants;
      ctx['maybeFromJsonParamType'] = 'Map<String, dynamic>?';
    case _ShapeMode(:final dispatch, :final variants, :final smooshedVariants):
      ctx['has_shape_dispatch'] = true;
      ctx['dispatch'] = dispatch;
      ctx['variants'] = variants;
      ctx['smooshedVariants'] = smooshedVariants;
    case _HybridMode(
      :final shapeArms,
      :final mapArms,
      :final mapFallback,
      :final listArms,
      :final listFallback,
      :final variants,
      :final smooshedVariants,
    ):
      ctx['has_hybrid_dispatch'] = true;
      ctx['shapeArms'] = shapeArms;
      ctx['mapArms'] = mapArms;
      ctx['mapFallback'] = mapFallback ?? false;
      ctx['hasMapSubDispatch'] = mapArms.isNotEmpty || mapFallback != null;
      ctx['listArms'] = listArms;
      ctx['listFallback'] = listFallback ?? false;
      ctx['hasListSubDispatch'] = listArms.isNotEmpty || listFallback != null;
      ctx['variants'] = variants;
      ctx['smooshedVariants'] = smooshedVariants;
    case _PredicateDispatchMode(
      :final dispatch,
      :final fallback,
      :final variants,
      :final smooshedVariants,
      :final factoryParamType,
      :final preamble,
      :final throwMessage,
      :final toJsonReturnType,
    ):
      ctx['has_predicate_dispatch'] = true;
      ctx['dispatch'] = dispatch;
      ctx['fallback'] = fallback ?? false;
      ctx['variants'] = variants;
      ctx['smooshedVariants'] = smooshedVariants;
      ctx['factoryParamType'] = factoryParamType;
      ctx['preamble'] = preamble;
      ctx['throwMessage'] = throwMessage;
      ctx['toJsonReturnType'] = toJsonReturnType;
      // [maybeFromJson]'s parameter mirrors the factory's. A `Map`
      // factory pairs with `Map?`; `dynamic` already accepts null so
      // we leave the default.
      if (factoryParamType == 'Map<String, dynamic>') {
        ctx['maybeFromJsonParamType'] = 'Map<String, dynamic>?';
      }
    case _NoDispatchMode():
      ctx['no_dispatch'] = true;
  }
}

/// The schema-specific bits of a shape-dispatch wrapper: how the
/// wrapper's `value` field is typed, how it's constructed from the
/// pattern-matched variable `v`, and how it's serialized back. The
/// parent ([RenderOneOf]) layers the wrapper class name and the
/// `case T v =>` shape key around these.
///
/// Each [RenderSchema] subclass that participates in shape dispatch
/// returns one of these from [RenderSchema._variantConversion]. Schemas
/// that don't participate (newtypes that own their class, or types
/// with no shape key) return null.
@immutable
class _VariantConversion {
  const _VariantConversion({
    required this.valueType,
    required this.fromJson,
    required this.toJson,
    this.positionalBoolIgnore = false,
  });

  /// The wrapper's `value` field type.
  final String valueType;

  /// Expression building the wrapper's `value` from the
  /// pattern-matched variable `v`.
  final String fromJson;

  /// Expression returned by the wrapper's `toJson()`. References the
  /// wrapper's `value` field.
  final String toJson;

  /// True for `bool`-valued wrappers; see [_VariantPlan].
  final bool positionalBoolIgnore;
}

/// Conversion for an inline-pod variant (int / num / String / bool):
/// the wrapper just stores the matched JSON value verbatim, since
/// pods are JSON-native on both sides.
_VariantConversion _inlinePodConversion(
  String dartType, {
  bool positionalBoolIgnore = false,
}) => _VariantConversion(
  valueType: dartType,
  fromJson: 'v',
  toJson: 'value',
  positionalBoolIgnore: positionalBoolIgnore,
);

/// Conversion for a newtype variant (RenderObject, RenderEnum,
/// RenderEmptyObject, etc.): the wrapper holds the parsed value and
/// forwards `fromJson`/`toJson` to the variant's own class.
_VariantConversion _newtypeConversion(String typeName) => _VariantConversion(
  valueType: typeName,
  fromJson: '$typeName.fromJson(v)',
  toJson: 'value.toJson()',
);

/// One arm of the shape-based dispatch: how a single variant in a
/// non-discriminator [RenderOneOf] turns into a wrapper subclass and a
/// `case T v =>` arm in the parent's `fromJson`.
@immutable
class _VariantPlan {
  const _VariantPlan({
    required this.wrapperTypeName,
    required this.valueType,
    required this.jsonTestType,
    required this.fromJson,
    required this.toJson,
    this.positionalBoolIgnore = false,
  });

  /// The wrapper subclass name (e.g. `FooInt`, `FooBar`).
  final String wrapperTypeName;

  /// The wrapper's `value` field type (e.g. `int`, `Bar`).
  final String valueType;

  /// The Dart type used in the `case` pattern (e.g. `int`,
  /// `Map<String, dynamic>`). All test types in a single dispatch must
  /// be pairwise distinct so the dispatch is unambiguous.
  final String jsonTestType;

  /// Expression that constructs the wrapper's `value` from the matched
  /// variable `v` (the JSON, already promoted to [jsonTestType]).
  final String fromJson;

  /// Expression that the wrapper's `toJson()` returns. References
  /// `value` (the wrapper field).
  final String toJson;

  /// True for `bool`-valued wrappers; the template emits an
  /// `// ignore: avoid_positional_boolean_parameters` above the
  /// constructor since the wrapper has exactly one positional arg by
  /// design.
  final bool positionalBoolIgnore;
}

/// Render-side discriminator dispatch table for a [RenderOneOf].
/// Each [mapping] value is one of the entries in
/// [RenderOneOf.schemas] (same instance), so the renderer can look up
/// wrapper names by variant.
@immutable
class RenderDiscriminator extends Equatable {
  const RenderDiscriminator({
    required this.propertyName,
    required this.mapping,
  });

  final String propertyName;
  final Map<Object, RenderSchema> mapping;

  @override
  List<Object?> get props => [propertyName, mapping];
}

class RenderParameter implements CanBeParameter {
  const RenderParameter({
    required this.description,
    required this.name,
    required this.type,
    required this.isRequired,
    required this.isDeprecated,
    required this.inLocation,
    required this.example,
    required this.examples,
    required this.queryEncoding,
  });

  /// The name of the parameter.
  final String name;

  /// How this parameter's value goes on the wire, decided by the resolver
  /// — null for every location other than `query`.
  final QueryEncoding? queryEncoding;

  @override
  String dartParameterName(Quirks quirks) => variableSafeName(quirks, name);

  /// The description of the parameter.
  final String? description;

  /// The type of the parameter.
  final RenderSchema type;

  /// The in location of the parameter.
  final ParameterLocation inLocation;

  /// Whether the parameter is required.
  @override
  final bool isRequired;

  /// Whether the parameter is deprecated.
  final bool isDeprecated;

  /// A single example value for this parameter, from the spec's
  /// `example` keyword. Surfaced in the endpoint's doc comment.
  final dynamic example;

  /// Multiple example values for this parameter, from the spec's
  /// `examples` keyword. Surfaced in the endpoint's doc comment.
  final List<dynamic>? examples;

  /// All example values declared for this parameter, in the order they
  /// will be surfaced in the endpoint's doc comment. Combines the
  /// singular [example] (if any) with each entry of [examples].
  Iterable<dynamic> get allExamples sync* {
    if (example != null) yield example;
    final examples = this.examples;
    if (examples != null) yield* examples;
  }

  /// Whether the Dart storage for this parameter is nullable — the
  /// inverse of [isRequired]. Named for the use site rather than the
  /// underlying flag so callers read "is this nullable" directly.
  bool get isNullable => !isRequired;

  /// The parameter's name wrapped in `{ }` for URL-path interpolation,
  /// e.g. `{petId}` when [name] is `petId`.
  String get bracketedName => '{$name}';

  /// The Dart expression that serializes this parameter's value. Wraps
  /// [RenderSchema.toJsonExpression] with the right [dartParameterName]
  /// and nullability for this parameter.
  DartExpression toJsonExpression(SchemaRenderer context) {
    return type.toJsonExpression(
      DartIdentifier(dartParameterName(context.quirks)),
      context,
      dartIsNullable: isNullable,
    );
  }

  @override
  String? get validationCall => type.validationCall;

  /// Only the keys `api.mustache` actually reads from an iterated
  /// parameter context: the named/positional slot in the method
  /// signature. Everything else (name, bracketedName, toJson, ...)
  /// is reachable via typed accessors on this instance and used
  /// directly by the Dart-side invoke-args builder.
  @override
  Map<String, dynamic> toTemplateContext(SchemaRenderer context) => {
    'dartName': dartParameterName(context.quirks),
    'required': isRequired,
    'hasDefaultValue': type.defaultValue != null,
    'defaultValue': _maybeRuntimeSource(type.slotDefaultExpression(context)),
    'type': type.typeName,
    'nullableType': type.nullableTypeName(context),
  };
}

class RenderUnknown extends RenderSchema {
  const RenderUnknown({required super.common}) : super(createsNewType: false);

  @override
  dynamic get defaultValue => null;

  @override
  DartType get dartType => DartType.dynamic_;

  // We never deserialize or serialize unknown types.
  @override
  bool get shouldCallToJson => false;

  @override
  DartType get jsonStorageDartType => DartType.dynamic_;

  // We might need to jsonDecode(jsonEncode(dartName)) to get everything into
  // json types.
  @override
  DartExpression toJsonExpression(
    DartExpression dartName,
    SchemaRenderer context, {
    required bool dartIsNullable,
  }) => dartName;

  @override
  DartExpression fromJsonExpression(
    DartExpression jsonValue,
    SchemaRenderer context, {
    required bool jsonIsNullable,
    required bool dartIsNullable,
  }) => jsonValue;

  @override
  Map<String, dynamic> toTemplateContext(SchemaRenderer context) =>
      throw UnimplementedError('RenderUnknown.toTemplateContext');

  @override
  DartExpression? exampleValue(SchemaRenderer context) => const DartMapLiteral(
    keyType: DartType.string,
    valueType: DartType.dynamic_,
  );
}

class RenderVoid extends RenderNoJson {
  const RenderVoid({required super.common});

  @override
  dynamic get defaultValue =>
      throw UnimplementedError('RenderVoid.defaultValue');

  @override
  DartType get dartType => DartType.void_;

  @override
  String equalsExpression(String name, SchemaRenderer context) =>
      'throw UnimplementedError("RenderVoid.equalsExpression")';

  /// Null, not an expression: a void return has no value to convert.
  /// The sole caller checks for a void return before asking.
  @override
  DartExpression? fromJsonExpression(
    DartExpression jsonValue,
    SchemaRenderer context, {
    required bool jsonIsNullable,
    required bool dartIsNullable,
  }) => null;

  @override
  DartExpression? exampleValue(SchemaRenderer context) => null;
}

/// A schema that represents a type which cannot be converted to json.
abstract class RenderNoJson extends RenderSchema {
  const RenderNoJson({required super.common}) : super(createsNewType: false);

  @override
  bool get shouldCallToJson => false;

  // No JSON representation: [jsonStorageType] is overridden to emit a `throw`
  // expression where a type name would go, so [jsonStorageDartType] is never
  // rendered.
  @override
  DartType get jsonStorageDartType =>
      throw UnsupportedError('$runtimeType has no JSON storage type');

  @override
  String jsonStorageType({required bool isNullable}) =>
      'throw UnimplementedError("$runtimeType.jsonStorageType")';

  @override
  DartExpression toJsonExpression(
    DartExpression dartName,
    SchemaRenderer context, {
    required bool dartIsNullable,
  }) => DartThrow(
    DartType.unimplementedError.construct([
      DartLiteral('$runtimeType.toJson'),
    ]),
  );

  @override
  DartExpression? fromJsonExpression(
    DartExpression jsonValue,
    SchemaRenderer context, {
    required bool jsonIsNullable,
    required bool dartIsNullable,
  }) => DartThrow(
    DartType.unimplementedError.construct([
      DartLiteral('$runtimeType.fromJson'),
    ]),
  );

  @override
  Map<String, dynamic> toTemplateContext(SchemaRenderer context) =>
      throw UnimplementedError('$runtimeType.toTemplateContext');

  /// No-JSON types (void, binary) can't round-trip via JSON so they
  /// have no example value.
  @override
  DartExpression? exampleValue(SchemaRenderer context) => null;
}

class RenderBinary extends RenderNoJson {
  const RenderBinary({required super.common});

  @override
  dynamic get defaultValue => null;

  @override
  Iterable<Import> get additionalImports => [
    ...super.additionalImports,
    const Import(Libraries.dartTypedData),
  ];

  @override
  DartType get dartType => DartType.uint8List;

  @override
  String equalsExpression(String name, SchemaRenderer context) =>
      '${ModelHelpers.listsEqual}(${_equalsReceiver(name)}, other.$name)';

  @override
  String hashCodeExpression(String name) => '${ModelHelpers.listHash}($name)';
}

/// Base64-encoded binary string. Wire format is a JSON `String`; Dart-
/// side type is `Uint8List`. `fromJson` runs `base64.decode`, `toJson`
/// runs `base64.encode`. Inline only — top-level newtype mode is a
/// follow-up if a real spec needs it.
class RenderBase64Bytes extends RenderSchema {
  const RenderBase64Bytes({required super.common})
    : super(createsNewType: false);

  @override
  dynamic get defaultValue => null;

  @override
  Iterable<Import> get additionalImports => [
    ...super.additionalImports,
    // `shown: ['Uint8List']` flags this for re-export from the
    // api.dart barrel. `dart:convert` is imported without a `shown:`
    // list since `base64` is only used internally by the encoded
    // fromJson/toJson and never appears in a public field signature.
    //
    // Both are gated on the emitted code naming them: a nullable field
    // reaches its bytes through `maybeBase64Decode` from
    // `model_helpers.dart`, so the body names neither `base64` nor
    // (if no field is non-nullable) `Uint8List`.
    const Import(Libraries.dartTypedData, shown: ['Uint8List']),
    const Import(Libraries.dartConvert),
  ];

  @override
  DartType get dartType => DartType.uint8List;

  @override
  bool get shouldCallToJson => false;

  @override
  DartType get jsonStorageDartType => DartType.string;

  @override
  String equalsExpression(String name, SchemaRenderer context) =>
      '${ModelHelpers.listsEqual}(${_equalsReceiver(name)}, other.$name)';

  @override
  String hashCodeExpression(String name) => '${ModelHelpers.listHash}($name)';

  @override
  DartExpression fromJsonExpression(
    DartExpression jsonValue,
    SchemaRenderer context, {
    required bool jsonIsNullable,
    required bool dartIsNullable,
  }) {
    final cast = jsonCast(jsonValue, jsonIsNullable: jsonIsNullable);
    // The nullable case goes through the model_helpers wrapper so
    // `Uint8List?` parses cleanly without the call site writing its own
    // null check (a ternary on a public-property `Uint8List?` doesn't
    // promote).
    return jsonIsNullable
        ? callFunction(ModelHelpers.maybeBase64Decode, [cast])
        : DartMethodCall(
            target: const DartIdentifier('base64'),
            name: 'decode',
            arguments: [cast],
          );
  }

  @override
  DartExpression toJsonExpression(
    DartExpression dartName,
    SchemaRenderer context, {
    required bool dartIsNullable,
  }) {
    if (dartIsNullable) {
      // Same reasoning as `fromJsonExpression`: nullable `Uint8List`
      // doesn't promote in a ternary at a property access site.
      return DartInvocation(
        type: const DartType(ModelHelpers.maybeBase64Encode),
        arguments: [dartName],
        isConstConstructor: false,
      );
    }
    return DartMethodCall(
      target: const DartIdentifier('base64'),
      name: 'encode',
      arguments: [dartName],
    );
  }

  @override
  DartExpression? exampleValue(SchemaRenderer context) =>
      _uint8ListFromList([0]);

  @override
  Map<String, dynamic> toTemplateContext(SchemaRenderer context) =>
      throw UnimplementedError('RenderBase64Bytes.toTemplateContext');
}

/// An RFC 3339 full-date (`format: date`). Renders as the generated `Date`
/// value class (a calendar day: year/month/day, no time/timezone), never a
/// `DateTime`. Wire format is a JSON `String`; `Date.fromJson` / `.toJson`
/// handle the boundary. The single canonical `Date` type is emitted once per
/// package (`lib/date.dart`) and imported wherever a date field appears.
/// See doc/date_type.md.
class RenderDate extends RenderSchema {
  const RenderDate({required super.common, required this.defaultValue})
    : super(createsNewType: false);

  /// A `YYYY-MM-DD` default from the spec, if any.
  @override
  final String? defaultValue;

  @override
  DartType get dartType => _dateType;

  @override
  DartType get jsonStorageDartType => DartType.string;

  @override
  bool get shouldCallToJson => true;

  @override
  DartExpression? defaultValueExpression(SchemaRenderer context) {
    final value = defaultValue;
    if (value == null) return null;
    return const DartType(
      'Date',
    ).construct([DartLiteral(value)], name: 'fromJson');
  }

  @override
  DartExpression fromJsonExpression(
    DartExpression jsonValue,
    SchemaRenderer context, {
    required bool jsonIsNullable,
    required bool dartIsNullable,
  }) => parsedFromJson(
    jsonValue,
    context,
    jsonIsNullable: jsonIsNullable,
    dartIsNullable: dartIsNullable,
  );

  @override
  DartExpression toJsonExpression(
    DartExpression dartName,
    SchemaRenderer context, {
    required bool dartIsNullable,
  }) => DartMethodCall(
    target: dartName,
    name: 'toJson',
    isNullAware: dartIsNullable,
  );

  @override
  DartExpression? exampleValue(SchemaRenderer context) =>
      // The generated `Date` has a const constructor (`date.dart`).
      const DartType('Date').constConstruct(const [
        DartLiteral(2024),
        DartLiteral(1),
        DartLiteral(1),
      ]);

  // `Date.fromJson` parses through `DateTime.parse`, which rejects garbage
  // with a FormatException — so the round-trip test has a guaranteed-invalid
  // input to assert on.
  @override
  String? invalidJsonExample(SchemaRenderer context) => "'not a date'";

  @override
  Map<String, dynamic> toTemplateContext(SchemaRenderer context) =>
      throw UnimplementedError('RenderDate.toTemplateContext');
}

class RenderEmptyObject extends RenderNewType {
  const RenderEmptyObject({
    required super.common,
    super.assignedName,
    super.assignedSnakeName,
  });

  @override
  dynamic get defaultValue => null;

  // EmptyObject is always a newtype with a Map<String, dynamic> wire
  // shape. Participates in shape dispatch (when the only Map-shaped
  // variant in a oneOf) and in required-field dispatch as the
  // fallback variant (since it requires no fields). A second Map-
  // shaped sibling collides on shape key; `_canShapeDispatch` rejects
  // that path and required-field dispatch's no-fallback gate would
  // also bail.
  @override
  String? get wrapperTag => typeName;

  @override
  String? get jsonShapeKey => _mapShapeKey;

  @override
  _VariantConversion? _variantConversion(SchemaRenderer context) =>
      _newtypeConversion(typeName);

  @override
  DartType get jsonStorageDartType => _jsonWireMap;

  @override
  DartExpression toJsonExpression(
    DartExpression dartName,
    SchemaRenderer context, {
    required bool dartIsNullable,
  }) => DartMethodCall(
    target: dartName,
    name: 'toJson',
    isNullAware: dartIsNullable,
  );

  @override
  DartExpression fromJsonExpression(
    DartExpression jsonValue,
    SchemaRenderer context, {
    required bool jsonIsNullable,
    required bool dartIsNullable,
  }) => _fromJsonCall(
    jsonCast(jsonValue, jsonIsNullable: jsonIsNullable),
    jsonIsNullable: jsonIsNullable,
  );

  @override
  Map<String, dynamic> toTemplateContext(SchemaRenderer context) => {
    'doc_comment': createDocComment(common: common),
    'typeName': typeName,
    'typeArticle': aOrAn(typeName),
    'nullableTypeName': nullableTypeName(context),
  };

  @override
  DartExpression? exampleValue(SchemaRenderer context) =>
      dartType.constConstruct(const []);
}

/// A cycle-break marker: appears where a $ref would otherwise recurse back
/// into a schema already being resolved (e.g. Node -> left/right -> Node).
/// At render time it behaves as a type reference — emits the target's class
/// name and the standard newtype toJson/fromJson calls — but never renders a
/// file of its own (the target is inlined elsewhere in the tree and renders
/// there).
///
/// The target is always an object-shaped newtype today: Object, OneOf,
/// AllOf, AnyOf, or EmptyObject. In theory a cycle could also go through a
/// top-level Array or Map newtype (their child schema can `$ref` back), but
/// space_gen doesn't render those as standalone classes yet — see the "Map
/// & Array newtype via explicitly named schema?" TODO in README.md. All the
/// currently-supported targets serialize as `Map<String, dynamic>` with a
/// `toJson()` / `fromJson(Map)` contract, so those assumptions are
/// hard-coded here. If top-level Array/Map newtypes ever ship, this class
/// needs to delegate `jsonStorageType`/expressions to the target instead of
/// hard-coding — probably via a pointer -> RenderSchema lookup on the
/// renderer.
class RenderRecursiveRef extends RenderSchema {
  const RenderRecursiveRef({
    required super.common,
    required this.targetPointer,
    super.assignedName,
    super.assignedSnakeName,
  }) : super(createsNewType: true);

  final JsonPointer targetPointer;

  @override
  dynamic get defaultValue => null;

  @override
  bool get shouldCallToJson => true;

  @override
  DartType get dartType => DartType(_requireAssignedName());

  @override
  DartType get jsonStorageDartType => _jsonWireMap;

  @override
  DartExpression toJsonExpression(
    DartExpression dartName,
    SchemaRenderer context, {
    required bool dartIsNullable,
  }) {
    return DartMethodCall(
      target: dartName,
      name: 'toJson',
      isNullAware: dartIsNullable,
    );
  }

  @override
  DartExpression fromJsonExpression(
    DartExpression jsonValue,
    SchemaRenderer context, {
    required bool jsonIsNullable,
    required bool dartIsNullable,
  }) => orDefault(
    _fromJsonCall(
      jsonCast(jsonValue, jsonIsNullable: jsonIsNullable),
      jsonIsNullable: jsonIsNullable,
    ),
    context: context,
    jsonIsNullable: jsonIsNullable,
    dartIsNullable: dartIsNullable,
  );

  @override
  Map<String, dynamic> toTemplateContext(SchemaRenderer context) =>
      throw UnimplementedError('RenderRecursiveRef does not render a template');

  /// Recursive refs by definition loop back through themselves — any
  /// attempt to build an example value would recurse indefinitely.
  /// Returning null here propagates up the tree so the enclosing
  /// schema opts out of test generation.
  @override
  DartExpression? exampleValue(SchemaRenderer context) => null;
}
