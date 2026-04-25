import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:space_gen/src/parse/spec.dart' show StatusCodeRange;
import 'package:space_gen/src/quirks.dart';
// Any code that depends on SchemaRenderer probably should be moved out
// of this file and into the schema_renderer.dart file.
import 'package:space_gen/src/render/schema_renderer.dart';
import 'package:space_gen/src/resolver.dart';
import 'package:space_gen/src/string.dart';
import 'package:space_gen/src/types.dart';

String avoidReservedWord(String value) {
  if (isReservedWord(value)) {
    return '${value}_';
  }
  return value;
}

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
      .replaceAll("'", '')
      // Since jsonName is a raw string, it could have non-legal characters.
      // We need to escape them.
      // TODO(eseidel): Tweak this to make nicer names.
      .replaceAll(RegExp('[^a-zA-Z0-9_]'), '_');

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
  int indent = 0,
  String? templateName,
}) {
  if (title == null && body == null && example == null && examples == null) {
    return null;
  }
  String quoteIfNeeded(dynamic value) {
    if (value is String) {
      return quoteString(value);
    }
    return value.toString();
  }

  final indentStr = ' ' * indent;
  final hasTemplateContent = title != null || body != null;
  final wrapWithTemplate = templateName != null && hasTemplateContent;
  final lines = <String>[
    if (wrapWithTemplate) '$indentStr/// {@template $templateName}',
    if (title != null) ...wrapDocComment(title, indent: indent),
    if (body != null) ...wrapDocComment(body, indent: indent),
    if (wrapWithTemplate) '$indentStr/// {@endtemplate}',
    if (example != null)
      ...wrapDocComment('example: `${quoteIfNeeded(example)}`', indent: indent),
    if (examples != null)
      ...examples.expand(
        (e) => wrapDocComment('example: `${quoteIfNeeded(e)}`', indent: indent),
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
  Iterable<String> get validationCalls;
}

// Could make this comparable to have a nicer sort for our test results.
@immutable
class Import extends Equatable {
  const Import(this.path, {this.asName, this.shown = const []});

  final String path;
  final String? asName;

  /// Specific identifiers to narrow the import/export with a `show`
  /// clause. Empty means "show all". Only meaningful when `asName` is
  /// null (prefix imports already scope symbols via the prefix). Used
  /// by the public-api barrel to narrow third-party re-exports to the
  /// types the generated API actually references.
  final List<String> shown;

  Map<String, dynamic> toTemplateContext() => {'path': path, 'asName': asName};

  @override
  List<Object?> get props => [path, asName, shown];
}

/// Identifiers emitted by the renderer that are defined in the generated
/// `model_helpers.dart` file. Kept in sync with
/// `lib/templates/model_helpers.mustache`. Used both at emit sites below
/// and by [SchemaUsage] to decide whether to import `model_helpers.dart`.
abstract final class ModelHelpers {
  static const maybeParseDateTime = 'maybeParseDateTime';
  static const maybeParseDate = 'maybeParseDate';
  static const maybeParseUri = 'maybeParseUri';
  static const maybeParseUriTemplate = 'maybeParseUriTemplate';
  static const listsEqual = 'listsEqual';
  static const mapsEqual = 'mapsEqual';
  static const listHash = 'listHash';
  static const mapHash = 'mapHash';
  static const parseFromJson = 'parseFromJson';
  static const checkedKey = 'checkedKey';

  static const List<String> all = [
    maybeParseDateTime,
    maybeParseDate,
    maybeParseUri,
    maybeParseUriTemplate,
    listsEqual,
    mapsEqual,
    listHash,
    mapHash,
    parseFromJson,
    checkedKey,
  ];
}

class SpecResolver {
  const SpecResolver(this.quirks);

  final Quirks quirks;

  RenderSchema? maybeRenderSchema(ResolvedSchema? schema) {
    if (schema == null) {
      return null;
    }
    return toRenderSchema(schema);
  }

  RenderSchema toRenderSchema(ResolvedSchema schema) {
    switch (schema) {
      case ResolvedRecursiveRef():
        return RenderRecursiveRef(
          common: schema.common,
          targetPointer: schema.targetPointer,
        );
      case ResolvedEnum():
        return RenderEnum(
          common: schema.common,
          values: schema.values,
          names: RenderEnum.variableNamesFor(quirks, schema.values),
          descriptions: schema.descriptions,
        );
      case ResolvedObject():
        return RenderObject(
          common: schema.common,
          properties: schema.properties.map(
            (name, value) => MapEntry(name, toRenderSchema(value)),
          ),
          additionalProperties: maybeRenderSchema(schema.additionalProperties),
          requiredProperties: schema.requiredProperties,
        );
      case ResolvedPod():
        return RenderPod(
          common: schema.common,
          type: schema.type,
          createsNewType: schema.createsNewType,
          defaultValue: schema.defaultValue,
        );
      case ResolvedString():
        return RenderString(
          common: schema.common,
          createsNewType: schema.createsNewType,
          defaultValue: schema.defaultValue,
          maxLength: schema.maxLength,
          minLength: schema.minLength,
          pattern: schema.pattern,
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
        );
      case ResolvedArray():
        var defaultValue = schema.defaultValue;
        // I don't think this is quite right.  OpenAPI does not show this fake
        // default in cases where the schema is being used as a parameter.
        if (defaultValue == null && quirks.allListsDefaultToEmpty) {
          defaultValue = List<dynamic>.empty();
        }
        return RenderArray(
          common: schema.common,
          items: toRenderSchema(schema.items),
          defaultValue: defaultValue,
          maxItems: schema.maxItems,
          minItems: schema.minItems,
          uniqueItems: schema.uniqueItems,
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
            final renderMapping = <String, RenderSchema>{};
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
        );
      case ResolvedAllOf():
        // Generate a synthetic object type for allOf.
        final properties = <String, RenderSchema>{};
        for (final schema in schema.schemas) {
          final renderSchema = toRenderSchema(schema);
          if (renderSchema is RenderObject) {
            properties.addAll(renderSchema.properties);
          }
        }
        return RenderObject(common: schema.common, properties: properties);
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
        );
      case ResolvedMap():
        final keyEnum = schema.keySchema;
        return RenderMap(
          common: schema.common,
          valueSchema: toRenderSchema(schema.valueSchema),
          keySchema: keyEnum == null
              ? null
              : toRenderSchema(keyEnum) as RenderEnum,
        );
      case ResolvedEmptyObject():
        return RenderEmptyObject(common: schema.common);
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
      type: toRenderSchema(parameter.schema),
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
    }
  }

  RenderSchema _determineReturnType(ResolvedOperation operation) {
    // Figure out how many different successful responses there are.
    // Successful = explicit 2xx codes plus the `2XX` range if declared.
    final successfulContent = [
      ...operation.responses
          .where((e) => e.statusCode >= 200 && e.statusCode < 300)
          .map((e) => e.content),
      ...operation.rangeResponses
          .where((e) => e.range == StatusCodeRange.success)
          .map((e) => e.content),
    ];
    if (successfulContent.isEmpty) {
      return RenderVoid(
        common: CommonProperties.empty(
          snakeName: '${operation.snakeName}_response',
          pointer: operation.pointer,
        ),
      );
    }
    if (successfulContent.length == 1) {
      return toRenderSchema(successfulContent.first);
    }
    final renderSchemas = successfulContent.map(toRenderSchema).toList();
    // We don't implement hashCode/equals but rather equalsIgnoringName
    final distinctSchemas = <RenderSchema>{};
    for (final schema in renderSchemas) {
      if (!distinctSchemas.any((e) => e.equalsIgnoringName(schema))) {
        distinctSchemas.add(schema);
      }
    }
    // If there are multiple and they are different, generate a OneOf type.
    if (distinctSchemas.length > 1) {
      return RenderOneOf(
        // TODO(eseidel): Should this pass along description?
        common: CommonProperties.empty(
          snakeName: '${operation.snakeName}_response',
          pointer: operation.pointer,
        ),
        schemas: distinctSchemas.toList(),
        discriminator: null,
      );
    }
    return distinctSchemas.first;
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
    final returnType = _determineReturnType(operation);
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
      returnType: returnType,
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

extension on ResolvedSecurityRequirement {
  /// Turn the SecurityRequirements into AuthRequest subclasses to be
  /// resolved at runtime by the ApiClient.  If this requirement has
  /// multiple conditions, wrap them in an AllOfAuth.
  String toArgumentString({int indent = 0}) {
    final indentString = ' ' * indent;
    if (conditions.isEmpty) {
      return '${indentString}NoAuth()';
    }
    // TODO(eseidel): Support scopes/roles in conditions.values.
    final buffer = StringBuffer();
    if (conditions.length > 1) {
      buffer.write('${indentString}AllOfAuth([\n');
      for (final scheme in conditions.keys) {
        buffer.write('${scheme.toArgumentString(indent: indent + 2)},\n');
      }
      buffer.write('$indentString])');
    } else {
      final scheme = conditions.keys.first;
      buffer.write(scheme.toArgumentString(indent: indent));
    }
    return buffer.toString();
  }
}

extension on SecurityScheme {
  /// Turn the SecurityScheme into an AuthRequest subclass to be
  /// resolved at runtime by the ApiClient. Unsupported scheme types
  /// (oauth2 / openIdConnect / mutualTLS) render as `NoAuth()` — the
  /// caller is expected to override `ApiClient.resolveAuth` or set
  /// `defaultHeaders` to inject auth themselves. The parser emits a
  /// warning at generation time so consumers notice.
  String toArgumentString({int indent = 0}) {
    final expression = switch (this) {
      ApiKeySecurityScheme(
        keyName: final keyName,
        inLocation: final inLocation,
      ) =>
        "ApiKeyAuth(name: '$keyName', secretName: '$name', "
            'sendIn: $inLocation)',
      HttpSecurityScheme(scheme: final scheme) =>
        "HttpAuth(scheme: '$scheme', secretName: '$name')",
      UnsupportedSecurityScheme() => 'NoAuth()',
    };
    return '${' ' * indent}$expression';
  }
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
      final dartName = parameter.dartParameterName(quirks);
      final isNullable = !parameter.isRequired;
      final nameCall = isNullable ? '$dartName?.' : '$dartName.';
      for (final call in parameter.validationCalls) {
        statements.add('$nameCall$call;');
      }
    }
    return statements;
  }

  /// Turn the SecurityRequirements into AuthRequest subclasses to be
  /// resolved at runtime by the ApiClient, example:
  /// auth: OneOf([
  ///     MultiAuth([
  ///         HttpAuth(scheme: "Bearer", secretName: "AgentToken"),
  ///         ApiKeyAuth(name: "apiKey", secretName: "ApiKey", sendIn: SendIn.header),
  ///     ]),
  ///     ApiKeyAuth(name: "apiKey", secretName: "ApiKey", sendIn: SendIn.header),
  ///     NoAuth(),
  /// ]),
  String? authArgument({int indent = 0}) {
    if (securityRequirements.isEmpty) {
      return null;
    }

    final indentString = ' ' * indent;
    final buffer = StringBuffer();
    if (securityRequirements.length == 1) {
      buffer.write(securityRequirements.first.toArgumentString(indent: indent));
    } else {
      buffer.write('${indentString}OneOfAuth([\n');
      for (final requirement in securityRequirements) {
        buffer.write('${requirement.toArgumentString(indent: indent + 2)},\n');
      }
      buffer.write('$indentString])');
    }
    return buffer.toString();
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
        ".replaceAll('${p.bracketedName}', "
        "'\${ ${p.toJsonExpression(context)} }')",
      );
    }
    buffer.write(',');
    return buffer.toString();
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
    // come through directly. Items must be `String`, so each item runs
    // through `.toString()` — a no-op when the json expression already
    // produces a `String` (raw string, dateTime/date/uri pods, enums)
    // and the conversion when it doesn't (int/double/bool).
    final dartName = p.dartParameterName(context.quirks);
    final paramType = p.type;
    final String value;
    if (paramType is RenderArray) {
      final itemsToJson = paramType.items.toJsonExpression(
        'e',
        context,
        dartIsNullable: false,
      );
      value = '$dartName.map((e) => $itemsToJson.toString()).toList()';
    } else {
      final scalarToJson = paramType.toJsonExpression(
        dartName,
        context,
        dartIsNullable: false,
      );
      value = '[$scalarToJson.toString()]';
    }
    if (p.isNullable) {
      return "${innerIndent}if ($dartName != null) '${p.name}': $value,";
    }
    return "$innerIndent'${p.name}': $value,";
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
      final itemsToJson = paramType.items.toJsonExpression(
        'e',
        context,
        dartIsNullable: false,
      );
      final mapCall = ".map((e) => $itemsToJson.toString()).join(',')";
      final value = p.isNullable ? '?$dartName?$mapCall' : '$dartName$mapCall';
      return "$innerIndent'${p.name}': $value,";
    }
    final prefix = p.isNullable ? '?' : '';
    return "$innerIndent'${p.name}': $prefix${p.toJsonExpression(context)},";
  }

  List<String> _authRequestLines(String indent) {
    final authArg = authArgument(indent: indent.length)?.trimLeft();
    if (authArg == null) return const [];
    return ['${indent}authRequest: $authArg,'];
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
    final scalars = parts.scalars;
    final files = parts.files;

    final outer = _methodBodyIndent;
    final inner = outer + _nestedStep;
    final lines = <String>[];

    if (body.isRequired) {
      // Body is non-nullable at the Dart call site, so we can read its
      // fields directly into the initializing literals.
      lines
        ..addAll(_multipartFieldsLiteral(outer, inner, scalars))
        ..addAll(_multipartFilesLiteral(outer, inner, files))
        ..addAll(_multipartNullableFieldBlocks(outer, inner, scalars))
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
      for (final s in scalars.where((s) => !s.isNullable)) {
        lines.add(_fieldSetLine(guarded, s.fieldName, s.requiredValueExpr));
      }
      lines.addAll(
        _multipartNullableFieldBlocks(guarded, guardedInner, scalars),
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

  /// Non-nullable scalar fields as a map literal. Only used when the
  /// body itself is non-nullable (otherwise they go inside the null
  /// guard, not a literal).
  List<String> _multipartFieldsLiteral(
    String outer,
    String inner,
    List<MultipartScalarPart> scalars,
  ) {
    final nonNull = scalars.where((s) => !s.isNullable).toList();
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
    List<MultipartScalarPart> scalars,
  ) {
    final out = <String>[];
    for (final s in scalars.where((s) => s.isNullable)) {
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

  @override
  Map<String, dynamic> toTemplateContext(
    SchemaRenderer context, {
    String? removePrefix,
  }) {
    // Parameters as passed to the Dart function call, including the request
    // body if it exists.
    final dartParameters = <CanBeParameter>[...parameters, ?requestBody];

    final responseSchema = operation.returnType;
    final returnType = responseSchema.typeName;
    final isVoidReturn = responseSchema is RenderVoid;
    // When the success response advertises a non-JSON content type
    // (text/plain, text/html, application/octocat-stream, …) the wire
    // body is NOT JSON. Skip `jsonDecode`: `package:http`'s
    // `Response.body` is already a `String`, which matches the
    // `type: string` schema such responses use in practice. github's
    // `/zen`, `/octocat`, `/markdown`, `/markdown/raw` all live here.
    final successContentType = operation.successContentType;
    final isJsonResponse =
        successContentType == null || successContentType == 'application/json';
    final responseFromJson = isJsonResponse
        ? responseSchema.fromJsonExpression(
            'jsonDecode(response.body)',
            context,
            jsonIsNullable: false,
            dartIsNullable: false,
          )
        : 'response.body';

    // Collect error-body schemas from `default:`, `4XX:`, and `5XX:` and
    // deduplicate by structural equality. When they all resolve to the same
    // schema (the common case — most specs alias every error to a single
    // `ErrorResponse`), emit a typed `ApiException<ErrorType>` throw.
    // When they disagree, fall back to untyped — picking one would lie
    // to callers about what they'll actually catch.
    //
    // Skip `RenderNoJson` subclasses (RenderVoid, RenderBinary) — a
    // `default:` response with no content resolves to `RenderVoid`, whose
    // `fromJsonExpression` returns empty string and `typeName` is `void`,
    // which produced uncompilable Dart like `ApiException<void>(body: ,)`
    // before this skip (most famously on petstore, whose 4xx/default
    // responses carry only a description).
    final errorSchemas = <RenderSchema>[
      ?operation.defaultResponse?.content,
      ...operation.rangeResponses
          .where(
            (e) =>
                e.range == StatusCodeRange.clientError ||
                e.range == StatusCodeRange.serverError,
          )
          .map((e) => e.content),
    ];
    final distinctErrorSchemas = <RenderSchema>[];
    for (final schema in errorSchemas) {
      if (schema is RenderNoJson) continue;
      if (!distinctErrorSchemas.any((e) => e.equalsIgnoringName(schema))) {
        distinctErrorSchemas.add(schema);
      }
    }
    final errorSchema = distinctErrorSchemas.length == 1
        ? distinctErrorSchemas.first
        : null;
    final hasErrorType = errorSchema != null;
    final errorType = errorSchema?.typeName;
    final errorFromJson = errorSchema?.fromJsonExpression(
      'jsonDecode(response.body)',
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
      'responseFromJson': responseFromJson,
      'hasErrorType': hasErrorType,
      'errorType': errorType,
      'errorFromJson': errorFromJson,
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
    required this.returnType,
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

  /// The return type of the resolved operation.
  final RenderSchema returnType;

  /// Wire content type of the response that drove [returnType] — first
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

/// Sealed so the endpoint arg-builder can pattern-match exhaustively on
/// the body shape: the multipart path emits `fields:`/`files:`, every
/// other subclass emits `body:`/`bodyContentType:`. Adding a fifth shape
/// (e.g. `application/x-www-form-urlencoded`) is a compile error in
/// consumers until they handle it.
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
  Iterable<String> get validationCalls => schema.validationCalls;

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
    'defaultValue': body.schema.defaultValueString(context),
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
  String bodyExpression(SchemaRenderer context) => schema.toJsonExpression(
    dartParameterName(context.quirks),
    context,
    dartIsNullable: !isRequired,
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

/// One scalar text part in a `multipart/form-data` body.
class MultipartScalarPart extends Equatable {
  const MultipartScalarPart({
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
/// enum) or binary (`format: binary` → `Uint8List`). Scalars become text
/// parts; binaries become file parts in the generated endpoint method.
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

  /// Classify this body's properties into scalar (text) and file parts.
  /// Throws [FormatException] at render time when the schema shape is
  /// outside the v1-supported set — the ground truth for what the
  /// generator will emit. Called once from `_buildMultipartAssembly`
  /// on every render cycle, so schema-shape errors surface even though
  /// no eager validation happens at construction time.
  ({List<MultipartScalarPart> scalars, List<MultipartFilePart> files}) partsFor(
    SchemaRenderer context,
  ) {
    final object = schema;
    if (object is! RenderObject) {
      throw FormatException(
        'multipart/form-data request body schema must be an object '
        '(got ${object.runtimeType}) at ${schema.common.pointer}',
      );
    }
    final paramName = dartParameterName(context.quirks);
    final scalars = <MultipartScalarPart>[];
    final files = <MultipartFilePart>[];
    for (final entry in object.properties.entries) {
      final jsonName = entry.key;
      final property = entry.value;
      final dartName = variableSafeName(context.quirks, jsonName);
      final dartAccess = '$paramName.$dartName';
      final inRequired = object.requiredProperties.contains(jsonName);
      final isNullable = !inRequired || property.common.nullable;

      if (property is RenderBinary) {
        files.add(
          MultipartFilePart(
            fieldName: jsonName,
            dartAccess: dartAccess,
            isNullable: isNullable,
          ),
        );
      } else if (_isMultipartScalar(property)) {
        scalars.add(
          MultipartScalarPart(
            fieldName: jsonName,
            dartAccess: dartAccess,
            isNullable: isNullable,
            // `toJsonExpression` knows how to render each pod correctly
            // (DateTime → .toIso8601String(), newtype → .toJson(), plain
            // Dart types → identity). `.toString()` coerces non-String
            // json types (int, bool, enum with int values) to satisfy
            // Map<String, String>.
            requiredValueExpr: _multipartValueExpr(
              property,
              dartAccess,
              context,
            ),
            nullableValueExpr: _multipartValueExpr(property, 'v', context),
          ),
        );
      } else {
        throw FormatException(
          'multipart/form-data property must be a scalar or binary (got '
          '${property.runtimeType} for "$jsonName") at '
          '${property.common.pointer}',
        );
      }
    }
    return (scalars: scalars, files: files);
  }

  @override
  Map<String, dynamic> toTemplateContext(SchemaRenderer context) =>
      _requestBodyParameterContext(this, context);
}

String _multipartValueExpr(
  RenderSchema property,
  String base,
  SchemaRenderer context,
) {
  final jsonExpr = property.toJsonExpression(
    base,
    context,
    dartIsNullable: false,
  );
  final jsonType = property.jsonStorageType(isNullable: false);
  return jsonType == 'String' ? jsonExpr : '$jsonExpr.toString()';
}

bool _isMultipartScalar(RenderSchema schema) {
  return schema is RenderString ||
      schema is RenderInteger ||
      schema is RenderNumber ||
      schema is RenderPod ||
      schema is RenderEnum;
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

abstract class RenderSchema extends Equatable implements ToTemplateContext {
  const RenderSchema({required this.common, required this.createsNewType});

  final CommonProperties common;

  /// The snake name of the resolved schema.
  String get snakeName => common.snakeName;

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

  /// Whether the defaultValue can be const constructed.
  bool get defaultCanConstConstruct;

  bool hasNonConstDefaultValue(SchemaRenderer context) =>
      hasDefaultValue(context) && !defaultCanConstConstruct;

  Iterable<Import> get additionalImports => const [];

  // TODO(eseidel): This should be abstract and all classes should override.
  // This should include validations for the entire subtree of schemas
  // stopping at any branches that are new types since those can validate
  // themselves during construction.
  Iterable<String> get validationCalls => const [];

  /// Whether this schema should call toJson to convert to json.
  /// Subclasses should override this to return true if the schema should call
  /// toJson to convert to json.
  bool get shouldCallToJson => createsNewType;

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

  @override
  List<Object?> get props => [snakeName, pointer];

  String orDefaultExpression({
    required SchemaRenderer context,
    required bool jsonIsNullable,
    required bool dartIsNullable,
  }) {
    final defaultValue = defaultValueString(context);
    if (defaultValue == null) {
      if (jsonIsNullable && !dartIsNullable) {
        // Belt-and-braces: a non-nullable Dart slot fed by a nullable
        // JSON value with no default would silently produce a null-cast
        // crash at runtime. That combination only arises today via the
        // [nonNullableDefaultValues] quirk, which only forces non-null
        // when the property has a default — so reaching here means the
        // generator violated its own invariant, not user error.
        throw StateError('No default value for nullable property: $this');
      }
      return '';
    }
    if (!jsonIsNullable) return '';
    // Non-null Dart slot fed by nullable JSON: an `as T?` cast would
    // crash on null. Substitute the default whether the default is
    // const or not.
    if (!dartIsNullable) return ' ?? $defaultValue';
    // Nullable Dart slot with a const default: the constructor uses
    // `this.foo = default`, which only fires when the param is omitted.
    // `fromJson` always passes a value (possibly null), so substitute
    // the default at the cast site — otherwise a missing JSON key
    // produces `null` instead of the spec's default. Surfaced by a
    // real spec with `bool` properties marked `default: false` outside
    // the `required` array.
    if (defaultCanConstConstruct) return ' ?? $defaultValue';
    // Nullable Dart slot with a non-const default: the constructor uses
    // an initializer list (`: foo = foo ?? default`) that substitutes
    // on null too, so the default lands without `fromJson`'s help.
    return '';
  }

  /// This is the resolved Dart type name for the schema.
  /// e.g. 'String', 'Uri', or the class name of a new type.
  String get typeName;

  /// This is the resolved Dart type name for the schema, with a ? if it is
  /// nullable.
  /// e.g. 'String?', 'Uri?', or the ClassName? of a new type.
  String nullableTypeName(SchemaRenderer context) {
    return typeName.endsWith('?') ? typeName : '$typeName?';
  }

  String equalsExpression(String name, SchemaRenderer context) =>
      'this.$name == other.$name';

  /// Expression to feed into the generated `hashCode` `Object.hashAll(...)`
  /// call for a field named [name]. Default is the field itself —
  /// primitives and newtypes hash fine that way. List/Map fields
  /// (and Uint8List) override to use [ModelHelpers.listHash] /
  /// [ModelHelpers.mapHash] so the hash stays consistent with the
  /// deep-equality `==`.
  String hashCodeExpression(String name) => name;

  String jsonStorageType({required bool isNullable});

  String toJsonExpression(
    String dartName,
    SchemaRenderer context, {
    required bool dartIsNullable,
  });

  String fromJsonExpression(
    String jsonValue,
    SchemaRenderer context, {
    required bool jsonIsNullable,
    required bool dartIsNullable,
  });

  /// A Dart expression that constructs a valid in-memory instance of
  /// this schema, used by generated round-trip tests. Returns `null`
  /// when the generator cannot produce a safe example — e.g. a
  /// [RenderRecursiveRef] in a non-nullable slot would loop forever.
  /// Callers treat `null` as a signal to skip emitting a round-trip
  /// test for the enclosing type.
  String? exampleValue(SchemaRenderer context);

  /// A Dart expression of type [jsonStorageType] that is guaranteed to
  /// fail this schema's `fromJson`/`maybeFromJson` with a
  /// `FormatException`. Used by generated tests to lock in the parse
  /// contract at the type boundary. Returns `null` when no such input
  /// exists (e.g. a string newtype that accepts any string) or when
  /// the rejection path isn't through `FormatException` — callers skip
  /// emitting the negative test for those.
  String? invalidJsonExample(SchemaRenderer context) => null;

  /// The default value of this schema as a string.
  String? defaultValueString(SchemaRenderer context) {
    if (defaultValue == null) {
      return null;
    }
    if (defaultValue is String) {
      return quoteString(defaultValue as String);
    }
    return defaultValue.toString();
  }

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
// renders to its own file as an extension type wrapping [dartType]. When
// false the schema is inline and uses [dartType] directly at the use
// site.
class RenderPod extends RenderSchema {
  const RenderPod({
    required super.common,
    required this.type,
    required super.createsNewType,
    this.defaultValue,
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
      PodType.dateTime ||
      PodType.uri ||
      PodType.uriTemplate ||
      PodType.date => true,
    };
  }

  @override
  bool get defaultCanConstConstruct {
    // Newtype defaults wrap dartType in a constructor call; const-ness
    // depends on whether the wrapped expression is const.
    return switch (type) {
      PodType.dateTime ||
      PodType.uri ||
      PodType.uriTemplate ||
      PodType.date => false,
      PodType.boolean || PodType.email || PodType.uuid => true,
    };
  }

  @override
  List<Object?> get props => [super.props, type, defaultValue];

  /// The Dart type that represents this pod at the use site (when inline)
  /// or that the newtype wraps (when a newtype).
  String get dartType => switch (type) {
    PodType.boolean => 'bool',
    PodType.dateTime => 'DateTime',
    PodType.uri => 'Uri',
    PodType.uriTemplate => 'UriTemplate',
    // email and uuid are String subsets.
    PodType.email => 'String',
    PodType.uuid => 'String',
    PodType.date => 'DateTime',
  };

  @override
  String get typeName => createsNewType ? camelFromSnake(snakeName) : dartType;

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
  String jsonStorageType({required bool isNullable}) {
    return switch (type) {
      PodType.dateTime ||
      PodType.uri ||
      PodType.uriTemplate ||
      PodType.email ||
      PodType.uuid ||
      PodType.date => isNullable ? 'String?' : 'String',
      PodType.boolean => isNullable ? 'bool?' : 'bool',
    };
  }

  /// The default value of this schema as a string.
  @override
  String? defaultValueString(SchemaRenderer context) {
    if (defaultValue == null) {
      return null;
    }
    final raw = switch (type) {
      PodType.dateTime ||
      PodType.date => 'DateTime.parse(${quoteString(defaultValue as String)})',
      PodType.uri => 'Uri.parse(${quoteString(defaultValue as String)})',
      PodType.uriTemplate =>
        'UriTemplate(${quoteString(defaultValue as String)})',
      PodType.email || PodType.uuid => quoteString(defaultValue as String),
      PodType.boolean => defaultValue.toString(),
    };
    return createsNewType ? '$typeName($raw)' : raw;
  }

  @override
  Iterable<Import> get additionalImports => [
    ...super.additionalImports,
    if (type == PodType.uriTemplate)
      const Import('package:uri/uri.dart', shown: ['UriTemplate']),
  ];

  /// Converts `value` (of type [dartType]) to its JSON representation.
  /// Used both at the inline use site and inside the newtype's toJson.
  String _valueToJsonBody(String name, {required bool nameIsNullable}) {
    final nameCall = nameIsNullable ? '$name?' : name;
    return switch (type) {
      PodType.dateTime => '$nameCall.toIso8601String()',
      // Full-date: YYYY-MM-DD, the first 10 chars of ISO-8601.
      PodType.date => '$nameCall.toIso8601String().substring(0, 10)',
      PodType.uri => '$nameCall.toString()',
      PodType.uriTemplate => '$nameCall.toString()',
      // String- and bool-backed types: no conversion; `name` already
      // has the correct nullable/non-nullable type.
      PodType.email || PodType.uuid || PodType.boolean => name,
    };
  }

  /// Converts `json` (of type jsonStorageType) to [dartType]. Used inside
  /// the newtype's fromJson factory body and (non-nullable only) at the
  /// inline use site.
  String _jsonToValueBody(String jsonName) => switch (type) {
    PodType.dateTime || PodType.date => 'DateTime.parse($jsonName)',
    PodType.uri => 'Uri.parse($jsonName)',
    PodType.uriTemplate => 'UriTemplate($jsonName)',
    PodType.email || PodType.uuid || PodType.boolean => jsonName,
  };

  @override
  String toJsonExpression(
    String dartName,
    SchemaRenderer context, {
    required bool dartIsNullable,
  }) {
    if (createsNewType) {
      return dartIsNullable ? '$dartName?.toJson()' : '$dartName.toJson()';
    }
    return _valueToJsonBody(dartName, nameIsNullable: dartIsNullable);
  }

  @override
  String fromJsonExpression(
    String jsonValue,
    SchemaRenderer context, {
    required bool jsonIsNullable,
    required bool dartIsNullable,
  }) {
    final jsonType = jsonStorageType(isNullable: jsonIsNullable);
    final orDefault = orDefaultExpression(
      context: context,
      jsonIsNullable: jsonIsNullable,
      dartIsNullable: dartIsNullable,
    );
    final castedValue = '$jsonValue as $jsonType';

    if (createsNewType) {
      final jsonMethod = jsonIsNullable ? 'maybeFromJson' : 'fromJson';
      return '$typeName.$jsonMethod($castedValue)$orDefault';
    }

    // Inline: convert json String -> Dart value at the use site. For
    // nullable values we call a helper (so the expression remains a
    // single nullable-aware expression), for non-nullable we inline.
    switch (type) {
      case PodType.dateTime:
        if (jsonIsNullable) {
          return '${ModelHelpers.maybeParseDateTime}($castedValue)$orDefault';
        }
        return 'DateTime.parse($castedValue)';
      case PodType.date:
        if (jsonIsNullable) {
          return '${ModelHelpers.maybeParseDate}($castedValue)$orDefault';
        }
        return 'DateTime.parse($castedValue)';
      case PodType.uri:
        if (jsonIsNullable) {
          return '${ModelHelpers.maybeParseUri}($castedValue)$orDefault';
        }
        return 'Uri.parse($castedValue)';
      case PodType.uriTemplate:
        if (jsonIsNullable) {
          final call = '${ModelHelpers.maybeParseUriTemplate}($castedValue)';
          return '$call$orDefault';
        }
        return 'UriTemplate($castedValue)';
      case PodType.boolean || PodType.email || PodType.uuid:
        // 'as' has higher precedence than '??' so no parens are needed.
        return '$castedValue$orDefault';
    }
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
      'dartType': dartType,
      'jsonType': jsonStorageType(isNullable: false),
      'fromJsonBody': _jsonToValueBody('json'),
      'toJsonBody': _valueToJsonBody('value', nameIsNullable: false),
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
  String? exampleValue(SchemaRenderer context) {
    final raw = switch (type) {
      PodType.boolean => 'false',
      PodType.dateTime => 'DateTime.utc(2024, 1, 1)',
      // Local (not UTC) so `value.toIso8601String().substring(0, 10)`
      // round-trips back through `DateTime.parse` (which returns a
      // local DateTime).
      PodType.date => 'DateTime(2024, 1, 1)',
      PodType.uri => "Uri.parse('https://example.com')",
      PodType.uriTemplate => "UriTemplate('https://example.com/{id}')",
      PodType.email => "'user@example.com'",
      PodType.uuid => "'00000000-0000-0000-0000-000000000000'",
    };
    return createsNewType ? '$typeName($raw)' : raw;
  }

  /// Only date/dateTime pods parse through `DateTime.parse`, which
  /// rejects garbage with FormatException. Uri.parse is famously
  /// lenient; UriTemplate accepts most strings; string/bool/email/uuid
  /// pods don't validate at all — so no guaranteed-invalid input.
  @override
  String? invalidJsonExample(SchemaRenderer context) => switch (type) {
    PodType.dateTime || PodType.date => "'not a date'",
    _ => null,
  };
}

abstract class RenderNewType extends RenderSchema {
  const RenderNewType({required super.common}) : super(createsNewType: true);

  @override
  bool get shouldCallToJson => true;

  /// The class name of the new type. Used by subclasses.
  String get className => camelFromSnake(snakeName);

  @override
  String get typeName => className;

  @override
  String toJsonExpression(
    String dartName,
    SchemaRenderer context, {
    required bool dartIsNullable,
  }) {
    final nameCall = dartIsNullable ? '$dartName?' : dartName;
    return '$nameCall.toJson()';
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
  bool get defaultCanConstConstruct => true;

  @override
  List<Object?> get props => [super.props, defaultValue, maxLength, minLength];

  @override
  String get typeName => createsNewType ? camelFromSnake(snakeName) : 'String';

  /// The default value of this schema as a string.
  @override
  String? defaultValueString(SchemaRenderer context) {
    final value = defaultValue;
    return value == null ? null : quoteString(value);
  }

  @override
  Iterable<String> get validationCalls {
    return [
      if (maxLength != null) 'validateMaximumLength($maxLength)',
      if (minLength != null) 'validateMinimumLength($minLength)',
      if (pattern != null) 'validatePattern(${quoteString(pattern!)})',
    ];
  }

  @override
  Map<String, dynamic> toTemplateContext(SchemaRenderer context) => {
    'doc_comment': createDocComment(common: common),
    'typeName': typeName,
    'nullableTypeName': nullableTypeName(context),
  };

  @override
  String? get wrapperTag => createsNewType ? null : 'String';

  @override
  String? get jsonShapeKey => createsNewType ? null : 'String';

  @override
  String jsonStorageType({required bool isNullable}) =>
      isNullable ? 'String?' : 'String';

  String newTypeFromJsonExpression(
    String jsonValue,
    SchemaRenderer context, {
    required bool jsonIsNullable,
    required bool dartIsNullable,
  }) {
    final orDefault = orDefaultExpression(
      context: context,
      jsonIsNullable: jsonIsNullable,
      dartIsNullable: dartIsNullable,
    );
    final jsonMethod = jsonIsNullable ? 'maybeFromJson' : 'fromJson';
    final className = camelFromSnake(snakeName);
    final jsonType = jsonStorageType(isNullable: jsonIsNullable);
    final castedValue = '$jsonValue as $jsonType';
    return '$className.$jsonMethod($castedValue)$orDefault';
  }

  @override
  String fromJsonExpression(
    String jsonValue,
    SchemaRenderer context, {
    required bool jsonIsNullable,
    required bool dartIsNullable,
  }) {
    if (createsNewType) {
      return newTypeFromJsonExpression(
        jsonValue,
        context,
        jsonIsNullable: jsonIsNullable,
        dartIsNullable: dartIsNullable,
      );
    }
    final jsonType = jsonStorageType(isNullable: jsonIsNullable);
    final orDefault = orDefaultExpression(
      context: context,
      jsonIsNullable: jsonIsNullable,
      dartIsNullable: dartIsNullable,
    );
    final castedValue = '$jsonValue as $jsonType';
    return '$castedValue$orDefault';
  }

  @override
  String toJsonExpression(
    String dartName,
    SchemaRenderer context, {
    required bool dartIsNullable,
  }) {
    if (createsNewType) {
      return dartIsNullable ? '$dartName?.toJson()' : '$dartName.toJson()';
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

  @override
  String? exampleValue(SchemaRenderer context) =>
      createsNewType ? "$typeName('example')" : "'example'";
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
  List<Object?> get props => [
    super.props,
    defaultValue,
    maximum,
    minimum,
    exclusiveMaximum,
    exclusiveMinimum,
    multipleOf,
  ];

  // Careful, this might not be true depending on validations.
  @override
  bool get defaultCanConstConstruct => true;

  @override
  String? defaultValueString(SchemaRenderer context) {
    if (defaultValue == null) {
      return null;
    }
    if (createsNewType) {
      final typeName = camelFromSnake(snakeName);
      return '$typeName($defaultValue)';
    }
    return defaultValue.toString();
  }

  @override
  Iterable<String> get validationCalls {
    return [
      if (maximum != null) 'validateMaximum($maximum)',
      if (minimum != null) 'validateMinimum($minimum)',
      if (exclusiveMaximum != null)
        'validateExclusiveMaximum($exclusiveMaximum)',
      if (exclusiveMinimum != null)
        'validateExclusiveMinimum($exclusiveMinimum)',
      if (multipleOf != null) 'validateMultipleOf($multipleOf)',
    ];
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
      'dartType': '$T',
      'jsonType': jsonStorageType(isNullable: false),
      'nullableTypeName': nullableTypeName(context),
      'jsonToDartCall': jsonToDartCall(jsonIsNullable: false),
    };
  }

  String jsonToDartCall({required bool jsonIsNullable});

  String newTypeFromJsonExpression(
    String jsonValue,
    SchemaRenderer context, {
    required bool jsonIsNullable,
    required bool dartIsNullable,
  }) {
    final orDefault = orDefaultExpression(
      context: context,
      jsonIsNullable: jsonIsNullable,
      dartIsNullable: dartIsNullable,
    );
    final jsonMethod = jsonIsNullable ? 'maybeFromJson' : 'fromJson';
    final className = camelFromSnake(snakeName);
    final jsonType = jsonStorageType(isNullable: jsonIsNullable);
    final castedValue = '$jsonValue as $jsonType';
    return '$className.$jsonMethod($castedValue)$orDefault';
  }

  @override
  String fromJsonExpression(
    String jsonValue,
    SchemaRenderer context, {
    required bool jsonIsNullable,
    required bool dartIsNullable,
  }) {
    if (createsNewType) {
      return newTypeFromJsonExpression(
        jsonValue,
        context,
        jsonIsNullable: jsonIsNullable,
        dartIsNullable: dartIsNullable,
      );
    }
    final jsonType = jsonStorageType(isNullable: jsonIsNullable);
    final orDefault = orDefaultExpression(
      context: context,
      jsonIsNullable: jsonIsNullable,
      dartIsNullable: dartIsNullable,
    );
    final toDartCall = jsonToDartCall(jsonIsNullable: jsonIsNullable);
    return '($jsonValue as $jsonType)$toDartCall$orDefault';
  }

  @override
  String toJsonExpression(
    String dartName,
    SchemaRenderer context, {
    required bool dartIsNullable,
  }) {
    if (createsNewType) {
      return dartIsNullable ? '$dartName?.toJson()' : '$dartName.toJson()';
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
  });

  @override
  String get typeName => createsNewType ? camelFromSnake(snakeName) : 'double';

  @override
  String jsonStorageType({required bool isNullable}) =>
      isNullable ? 'num?' : 'num';

  @override
  String jsonToDartCall({required bool jsonIsNullable}) =>
      jsonIsNullable ? '?.toDouble()' : '.toDouble()';

  @override
  String? exampleValue(SchemaRenderer context) =>
      createsNewType ? '$typeName(0.0)' : '0.0';
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
  });

  @override
  String get typeName => createsNewType ? camelFromSnake(snakeName) : 'int';

  @override
  String? get wrapperTag => createsNewType ? null : 'Int';

  @override
  String? get jsonShapeKey => createsNewType ? null : 'int';

  @override
  String jsonStorageType({required bool isNullable}) =>
      isNullable ? 'int?' : 'int';

  // jsonType and dartType are both int, so we don't need to do anything.
  @override
  String jsonToDartCall({required bool jsonIsNullable}) => '';

  @override
  String? exampleValue(SchemaRenderer context) =>
      createsNewType ? '$typeName(0)' : '0';
}

class RenderObject extends RenderNewType {
  const RenderObject({
    required super.common,
    required this.properties,
    this.additionalProperties,
    this.requiredProperties = const [],
  });

  /// The properties of the resolved schema.
  final Map<String, RenderSchema> properties;

  /// The additional properties of the resolved schema.
  final RenderSchema? additionalProperties;

  /// The required properties of the resolved schema.
  final List<String> requiredProperties;

  @override
  String? get wrapperTag => typeName;

  @override
  String? get jsonShapeKey => 'Map<String, dynamic>';

  @override
  List<Object?> get props => [
    super.props,
    properties,
    additionalProperties,
    requiredProperties,
  ];

  @override
  dynamic get defaultValue => null;

  // We could do something smarter here, to determine if the object has a
  // const constructor, but it's not worth the complexity for now.
  @override
  bool get defaultCanConstConstruct => false;

  @override
  String jsonStorageType({required bool isNullable}) {
    return isNullable ? 'Map<String, dynamic>?' : 'Map<String, dynamic>';
  }

  @override
  Iterable<Import> get additionalImports => [
    ...super.additionalImports,
    if (properties.values.any((p) => p.isDeprecated))
      const Import('package:meta/meta.dart'),
  ];

  // isNullable means it's optional for the server, use nullable storage.
  bool propertyDartIsNullable({
    required String jsonName,
    required SchemaRenderer context,
    required bool propertyHasDefaultValue,
  }) {
    final inRequiredList = requiredProperties.contains(jsonName);
    if (context.quirks.nonNullableDefaultValues) {
      return !inRequiredList && !propertyHasDefaultValue;
    }
    return !inRequiredList;
  }

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
        line.write(' = ${property.defaultValueString(context)}');
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
      return 'this.$dartName = $dartName '
          '?? ${property.defaultValueString(context)}';
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
    final hasDefaultValue = property.hasDefaultValue(context);
    final jsonKeyIsRequired = requiredProperties.contains(jsonName);
    final jsonIsNullable = !jsonKeyIsRequired || property.common.nullable;
    final dartIsNullable =
        propertyDartIsNullable(
          jsonName: jsonName,
          context: context,
          propertyHasDefaultValue: hasDefaultValue,
        ) ||
        property.common.nullable;
    // OpenAPI 3.1 lets a property be both `required` and accept `null`
    // as its value (`type: [T, "null"]` + `required: [key]`). A plain
    // `json[key] as T?` cast would then accept a missing key as a null
    // value, silently violating `required`. Route the read through
    // `checkedKey`, which throws `FormatException` when the key is
    // absent — other combinations still read `json[key]` directly.
    final jsonRead = jsonKeyIsRequired && property.common.nullable
        ? "${ModelHelpers.checkedKey}(json, '$jsonName')"
        : "json['$jsonName']";

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
      'toJson': property.toJsonExpression(
        dartName,
        context,
        dartIsNullable: dartIsNullable,
      ),
      'fromJson': property.fromJsonExpression(
        jsonRead,
        context,
        dartIsNullable: dartIsNullable,
        jsonIsNullable: jsonIsNullable,
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

  /// Template context for an object schema.
  @override
  Map<String, dynamic> toTemplateContext(SchemaRenderer context) {
    final renderProperties = properties.entries.map((entry) {
      final jsonName = entry.key;
      final schema = entry.value;
      return propertyTemplateContext(
        jsonName: jsonName,
        property: schema,
        context: context,
      );
    }).toList();

    final assignmentsLine = buildAssignmentsLine(renderProperties);

    final valueSchema = additionalProperties;
    final hasAdditionalProperties = valueSchema != null;
    // Force named properties to be rendered if hasAdditionalProperties is true.
    final hasProperties =
        renderProperties.isNotEmpty || hasAdditionalProperties;
    const isNullable = false;
    final propertiesCount =
        renderProperties.length + (hasAdditionalProperties ? 1 : 0);
    if (propertiesCount == 0) {
      throw StateError('Object schema has no properties: $this');
    }
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
      'hasProperties': hasProperties,
      // Special case behavior hashCode with only one property.
      'hasOneProperty': propertiesCount == 1,
      'properties': renderProperties,
      'hasAdditionalProperties': hasAdditionalProperties,
      'hasNoJsonProperty': hasNoJsonProperty,
      'assignmentsLine': assignmentsLine,
      'additionalPropertiesName': 'entries', // Matching OpenAPI.
      'valueSchema': valueSchema?.typeName,
      'valueToJson': valueSchema?.toJsonExpression(
        'value',
        context,
        dartIsNullable: isNullable,
      ),
      'valueFromJson': valueSchema?.fromJsonExpression(
        'value',
        context,
        jsonIsNullable: isNullable,
        dartIsNullable: isNullable,
      ),
      'fromJsonJsonType': context.fromJsonJsonType,
      'castFromJsonArg': context.quirks.dynamicJson,
      'mutableModels': context.quirks.mutableModels,
      'isDeprecated': isDeprecated,
    };
  }

  @override
  String fromJsonExpression(
    String jsonValue,
    SchemaRenderer context, {
    required bool jsonIsNullable,
    required bool dartIsNullable,
  }) {
    final jsonType = jsonStorageType(isNullable: jsonIsNullable);
    final orDefault = orDefaultExpression(
      context: context,
      jsonIsNullable: jsonIsNullable,
      dartIsNullable: dartIsNullable,
    );
    final jsonMethod = jsonIsNullable ? 'maybeFromJson' : 'fromJson';
    return '$className.$jsonMethod($jsonValue as $jsonType)$orDefault';
  }

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

  @override
  String? exampleValue(SchemaRenderer context) {
    final args = <String>[];
    for (final entry in properties.entries) {
      final jsonName = entry.key;
      if (!requiredProperties.contains(jsonName)) continue;
      final property = entry.value;
      final example = property.exampleValue(context);
      if (example == null) return null;
      final dartName = variableSafeName(context.quirks, jsonName);
      args.add('$dartName: $example');
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
      args.add('entries: <String, ${additional.typeName}>{}');
    }
    return '$typeName(${args.join(', ')})';
  }

  /// Empty map: any required property will fail its type cast inside
  /// `parseFromJson`, which rewraps the TypeError as FormatException.
  /// When there are no required properties, `{}` is a valid instance
  /// and we have no guaranteed-invalid input.
  @override
  String? invalidJsonExample(SchemaRenderer context) =>
      requiredProperties.isEmpty ? null : '<String, dynamic>{}';
}

class RenderArray extends RenderSchema {
  const RenderArray({
    required super.common,
    required this.items,
    this.defaultValue,
    this.maxItems,
    this.minItems,
    this.uniqueItems = false,
  }) : super(createsNewType: false);

  /// The items of the resolved schema.
  final RenderSchema items;

  @override
  final dynamic defaultValue;

  /// The maximum number of items in the array.
  final int? maxItems;

  /// The minimum number of items in the array.
  final int? minItems;

  /// Whether the items in the array must be unique.
  final bool uniqueItems;

  @override
  Iterable<String> get validationCalls {
    return [
      if (maxItems != null) 'validateMaximumItems($maxItems)',
      if (minItems != null) 'validateMinimumItems($minItems)',
      if (uniqueItems) 'validateUniqueItems()',
    ];
  }

  @override
  bool get defaultCanConstConstruct {
    final dValue = defaultValue as List?;
    if (dValue is List && dValue.isEmpty) {
      return true;
    }
    // In the null case we're falling through to here, but this will also never
    // be called in that case.
    return items.defaultCanConstConstruct;
  }

  @override
  List<Object?> get props => [
    super.props,
    items,
    defaultValue,
    maxItems,
    minItems,
    uniqueItems,
  ];

  @override
  bool get shouldCallToJson => items.shouldCallToJson;

  // Inline arrays show up as a oneOf variant; the shape-dispatch
  // wrapper class is `<ParentTypeName>List`.
  @override
  String? get wrapperTag => 'List';

  @override
  String? get jsonShapeKey => 'List<dynamic>';

  /// The type name of this schema.
  @override
  String get typeName => 'List<${items.typeName}>';

  @override
  String equalsExpression(String name, SchemaRenderer context) =>
      '${ModelHelpers.listsEqual}(this.$name, other.$name)';

  @override
  String hashCodeExpression(String name) => '${ModelHelpers.listHash}($name)';

  @override
  String? defaultValueString(SchemaRenderer context) {
    if (defaultValue == null) {
      return null;
    }
    final listDefault = defaultValue as List;
    if (listDefault.isEmpty) {
      // Type annotation is not needed for empty lists.
      return 'const []';
    }
    final maybeConst = items.defaultCanConstConstruct ? 'const ' : '';
    final itemType = items.typeName;
    String toString(dynamic value) =>
        value is String ? quoteString(value) : value.toString();
    final values = listDefault.map(toString).join(', ');
    return '$maybeConst<$itemType>[$values]';
  }

  @override
  String jsonStorageType({required bool isNullable}) {
    return isNullable ? 'List<dynamic>?' : 'List<dynamic>';
  }

  @override
  String toJsonExpression(
    String dartName,
    SchemaRenderer context, {
    required bool dartIsNullable,
  }) {
    // Pod types don't need toJson.
    if (!items.shouldCallToJson) {
      return dartName;
    }
    final nameCall = dartIsNullable ? '$dartName?' : dartName;
    final itemsToJson = items.toJsonExpression(
      'e',
      context,
      dartIsNullable: false,
    );
    return '$nameCall.map((e) => $itemsToJson).toList()';
  }

  @override
  String fromJsonExpression(
    String jsonValue,
    SchemaRenderer context, {
    required bool jsonIsNullable,
    required bool dartIsNullable,
  }) {
    final orDefault = orDefaultExpression(
      context: context,
      jsonIsNullable: jsonIsNullable,
      dartIsNullable: dartIsNullable,
    );
    final itemTypeName = items.typeName;
    // List has special handling for nullability since we want to cast
    // through List<dynamic> first before casting to the item type.
    final castAsList = jsonIsNullable
        ? '($jsonValue as List?)?'
        : '($jsonValue as List)';
    final itemsFromJson = items.fromJsonExpression(
      'e',
      context,
      dartIsNullable: false,
      // Unless itemSchema itself has a nullable type this is always false.
      jsonIsNullable: false,
    );
    // If it doesn't create a new type we can just cast the list.
    if (!items.createsNewType) {
      return '$castAsList.cast<$itemTypeName>()$orDefault';
    }
    return '$castAsList.map<$itemTypeName>('
        '(e) => $itemsFromJson).toList()$orDefault';
  }

  @override
  Map<String, dynamic> toTemplateContext(SchemaRenderer context) =>
      throw UnimplementedError('RenderArray.toTemplateContext');

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
  String? exampleValue(SchemaRenderer context) {
    final inner = items.exampleValue(context);
    if (inner == null) return null;
    return '<${items.typeName}>[$inner]';
  }
}

class RenderMap extends RenderSchema {
  const RenderMap({
    required super.common,
    required this.valueSchema,
    required this.keySchema,
    this.defaultValue,
  }) : super(createsNewType: false);

  final RenderSchema valueSchema;

  /// Optional typed key schema. JSON always uses string keys on the wire;
  /// when non-null the generated Dart uses this enum as the map key and
  /// the enum's `fromJson`/`toJson` round-trips each key at the boundary.
  final RenderEnum? keySchema;

  @override
  final dynamic defaultValue;

  @override
  List<Object?> get props => [
    super.props,
    valueSchema,
    keySchema,
    defaultValue,
  ];

  @override
  bool get shouldCallToJson =>
      keySchema != null || valueSchema.shouldCallToJson;

  @override
  bool get defaultCanConstConstruct {
    final dValue = defaultValue as Map?;
    if (dValue is Map && dValue.isEmpty) {
      return true;
    }
    // In the null case we're falling through to here, but this will also never
    // be called in that case.
    return valueSchema.defaultCanConstConstruct;
  }

  @override
  String get typeName {
    final keyType = keySchema?.typeName ?? 'String';
    return 'Map<$keyType, ${valueSchema.typeName}>';
  }

  @override
  String equalsExpression(String name, SchemaRenderer context) =>
      '${ModelHelpers.mapsEqual}(this.$name, other.$name)';

  @override
  String hashCodeExpression(String name) => '${ModelHelpers.mapHash}($name)';

  @override
  String jsonStorageType({required bool isNullable}) =>
      isNullable ? 'Map<String, dynamic>?' : 'Map<String, dynamic>';

  @override
  String toJsonExpression(
    String dartName,
    SchemaRenderer context, {
    required bool dartIsNullable,
  }) {
    // Nothing to do if both key and value are json types.
    if (keySchema == null && !valueSchema.shouldCallToJson) {
      return dartName;
    }
    final keyToJson = keySchema == null ? 'key' : 'key.toJson()';
    final valueToJson = valueSchema.toJsonExpression(
      'value',
      context,
      dartIsNullable: false,
    );
    final callMap = dartIsNullable ? '?.map' : '.map';
    return '$dartName$callMap((key, value) => '
        'MapEntry($keyToJson, $valueToJson))';
  }

  @override
  String fromJsonExpression(
    String jsonValue,
    SchemaRenderer context, {
    required bool jsonIsNullable,
    required bool dartIsNullable,
  }) {
    // We could probably do a smaller cast if the value schema is only json
    // types.
    final jsonType = jsonStorageType(isNullable: jsonIsNullable);
    final keyFromJson = keySchema == null
        ? 'key'
        : '${keySchema!.typeName}.fromJson(key)';
    final valueFromJson = valueSchema.fromJsonExpression(
      'value',
      context,
      jsonIsNullable: false,
      dartIsNullable: false,
    );
    // TODO(eseidel): Support orDefault?
    // Should this have a leading ? to skip the key on null?
    final callMap = jsonIsNullable ? '?.map' : '.map';
    return '($jsonValue as $jsonType)$callMap((key, value) => '
        'MapEntry($keyFromJson, $valueFromJson))';
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
  String? exampleValue(SchemaRenderer context) {
    final value = valueSchema.exampleValue(context);
    if (value == null) return null;
    final key = keySchema?.exampleValue(context) ?? "'key'";
    return '{$key: $value}';
  }
}

class RenderEnum extends RenderNewType {
  const RenderEnum({
    required super.common,
    required this.values,
    required this.names,
    required this.descriptions,
    this.defaultValue,
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

    return values.map(toShortVariableName).toList();
  }

  @override
  final dynamic defaultValue;

  @override
  bool get defaultCanConstConstruct => true;

  /// The values of the resolved schema.
  final List<String> values;

  /// The names of the resolved schema.
  final List<String> names;

  /// Optional per-value dartdoc descriptions, parallel to [values].
  final List<String>? descriptions;

  @override
  String? get wrapperTag => typeName;

  @override
  String? get jsonShapeKey => 'String';

  @override
  List<Object?> get props => [
    super.props,
    values,
    names,
    defaultValue,
    descriptions,
  ];

  @override
  String jsonStorageType({required bool isNullable}) {
    return isNullable ? 'String?' : 'String';
  }

  /// Template context for an enum schema.
  @override
  Map<String, dynamic> toTemplateContext(SchemaRenderer context) {
    Map<String, dynamic> enumValueToTemplateContext(int index) {
      final value = values[index];
      final description = descriptions?[index];
      return {
        'enumValueName': variableNameFor(value),
        'enumValue': quoteString(value),
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
      'enumValues': [
        for (var i = 0; i < values.length; i++) enumValueToTemplateContext(i),
      ],
    };
  }

  /// The default value of this schema as a string.
  @override
  String? defaultValueString(SchemaRenderer context) {
    // If the type of this schema is an object we need to convert the default
    // value to that object type.
    if (defaultValue is String) {
      return '$className.${variableNameFor(defaultValue as String)}';
    }
    return defaultValue?.toString();
  }

  @override
  String fromJsonExpression(
    String jsonValue,
    SchemaRenderer context, {
    required bool jsonIsNullable,
    required bool dartIsNullable,
  }) {
    final jsonType = jsonStorageType(isNullable: jsonIsNullable);
    final orDefault = orDefaultExpression(
      context: context,
      jsonIsNullable: jsonIsNullable,
      dartIsNullable: dartIsNullable,
    );
    final jsonMethod = jsonIsNullable ? 'maybeFromJson' : 'fromJson';
    return '$className.$jsonMethod($jsonValue as $jsonType)$orDefault';
  }

  String variableNameFor(String value) => names[values.indexOf(value)];

  @override
  bool equalsIgnoringName(RenderSchema other) {
    if (other is! RenderEnum) {
      return false;
    }
    if (!const ListEquality<String>().equals(values, other.values)) {
      return false;
    }
    if (!const ListEquality<String>().equals(names, other.names)) {
      return false;
    }
    return super.equalsIgnoringName(other);
  }

  @override
  String? exampleValue(SchemaRenderer context) => '$typeName.values.first';

  @override
  String? invalidJsonExample(SchemaRenderer context) =>
      "'__invalid_enum_value__'";
}

class RenderOneOf extends RenderNewType {
  const RenderOneOf({
    required super.common,
    required this.schemas,
    required this.discriminator,
  });

  /// The schemas of the resolved schema.
  final List<RenderSchema> schemas;

  /// Optional discriminator dispatch table. When present, [schemas] are
  /// rendered as final wrapper subclasses of the sealed parent and the
  /// generated `fromJson` reads the discriminator property to pick the
  /// right variant. When absent, today's renderer falls back to the
  /// UnimplementedError stub — a gap to close in a follow-up.
  final RenderDiscriminator? discriminator;

  /// We could do something smarter here, to determine if the oneOf has a
  /// const constructor, but it's not worth the complexity for now.
  @override
  bool get defaultCanConstConstruct => false;

  @override
  List<Object?> get props => [super.props, schemas, discriminator];

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
  String jsonStorageType({required bool isNullable}) {
    if (schemas.any((s) => s is RenderPod)) {
      return 'dynamic';
    }
    return 'Map<String, dynamic>';
  }

  /// Build the wrapper class name as `<ParentTypeName><wrapperTag>`.
  /// We always prepend — even when the variant's tag already starts
  /// with the parent's typeName — because stripping the duplicate
  /// would collide with the variant's own standalone class (the
  /// parser names inline variants `<parent_snake>_one_of_<i>`, so the
  /// variant typeName equals the would-be deduped wrapper name). The
  /// double-prefix is ugly but unambiguous; co-locating the inline
  /// variant into the parent's file is a follow-up that fixes both
  /// the ugliness and the duplicate emission.
  ///
  /// Caller must have established that [variant] has a non-null
  /// [RenderSchema.wrapperTag] (e.g. via the dispatch gates).
  String wrapperTypeName(RenderSchema variant) {
    final tag = variant.wrapperTag;
    if (tag == null) {
      throw StateError('No wrapper tag available for $variant');
    }
    return '$typeName$tag';
  }

  /// Per-variant info needed to emit a dispatch arm + wrapper subclass.
  /// Returns null when [variant] isn't representable in the dispatch
  /// (unsupported shape, or runtime-type test would conflict with
  /// another variant). Takes [context] because some variants (arrays)
  /// compose with the items' fromJson/toJson expressions.
  _VariantPlan? _planVariant(RenderSchema variant, SchemaRenderer context) {
    final tag = variant.wrapperTag;
    if (tag == null) return null;
    final shapeKey = variant.jsonShapeKey;
    if (shapeKey == null) return null;
    final wrapperTypeName = '$typeName$tag';

    // Newtype variants (objects, enums): the wrapper holds the parsed
    // value and forwards fromJson/toJson to the variant's own class.
    if (variant is RenderObject || variant is RenderEnum) {
      return _VariantPlan(
        wrapperTypeName: wrapperTypeName,
        valueType: variant.typeName,
        jsonTestType: shapeKey,
        fromJson: '${variant.typeName}.fromJson(v)',
        toJson: 'value.toJson()',
      );
    }

    // Array variants: parse the raw `List<dynamic>` into a
    // `List<itemType>` using the items' fromJsonExpression, and the
    // reverse for toJson. wrapperTag is non-null only for inline
    // arrays (we don't support array-newtypes yet — the README notes
    // that as a future direction).
    if (variant is RenderArray) {
      final items = variant.items;
      final itemTypeName = items.typeName;
      final String fromJson;
      if (items.createsNewType) {
        final itemFrom = items.fromJsonExpression(
          'e',
          context,
          jsonIsNullable: false,
          dartIsNullable: false,
        );
        fromJson = 'v.map<$itemTypeName>((e) => $itemFrom).toList()';
      } else {
        fromJson = 'v.cast<$itemTypeName>()';
      }
      final String toJson;
      if (items.shouldCallToJson) {
        final itemTo = items.toJsonExpression(
          'e',
          context,
          dartIsNullable: false,
        );
        toJson = 'value.map((e) => $itemTo).toList()';
      } else {
        toJson = 'value';
      }
      return _VariantPlan(
        wrapperTypeName: wrapperTypeName,
        valueType: 'List<$itemTypeName>',
        jsonTestType: shapeKey,
        fromJson: fromJson,
        toJson: toJson,
      );
    }

    // Inline pod variants: the wrapper just stores the raw JSON value
    // (int / String / bool) — no parsing on either side. wrapperTag is
    // null on the createsNewType branch, so by here we're guaranteed
    // an inline pod.
    final podType = switch (variant) {
      RenderInteger() => 'int',
      RenderString() => 'String',
      RenderPod(type: PodType.boolean) => 'bool',
      _ => null,
    };
    if (podType == null) return null;
    return _VariantPlan(
      wrapperTypeName: wrapperTypeName,
      valueType: podType,
      jsonTestType: shapeKey,
      fromJson: 'v',
      toJson: 'value',
      positionalBoolIgnore: podType == 'bool',
    );
  }

  /// Discriminator-driven dispatch: every variant must be an object-
  /// shaped newtype with a `fromJson` factory.
  bool get _hasDiscriminatorDispatch =>
      discriminator != null && schemas.every((s) => s is RenderObject);

  /// True iff every variant has a known shape key AND all keys are
  /// pairwise distinct. Context-free so [additionalImports] and
  /// [_hasDispatch] can answer the dispatchability question without a
  /// [SchemaRenderer]; the context-taking [_shapeDispatchPlans] adds
  /// the items' fromJson/toJson expressions when arrays are involved.
  bool get _canShapeDispatch {
    final keys = <String>{};
    for (final v in schemas) {
      final k = v.jsonShapeKey;
      if (k == null) return false;
      if (!keys.add(k)) return false;
    }
    return true;
  }

  /// Shape-driven dispatch (runtime-type switch). Falls through from
  /// the discriminator path when the discriminator can't be honored
  /// (e.g. non-object variants under a discriminator) — shape is a
  /// strict fallback rather than a competitor.
  List<_VariantPlan>? _shapeDispatchPlans(SchemaRenderer context) {
    if (!_canShapeDispatch) return null;
    final plans = <_VariantPlan>[];
    for (final v in schemas) {
      final plan = _planVariant(v, context);
      if (plan == null) return null;
      plans.add(plan);
    }
    return plans;
  }

  /// Required-field dispatch: every variant is a [RenderObject] and
  /// each has at least one required property that no other variant
  /// requires. We dispatch by checking for that property's presence
  /// in the JSON. Useful for (object, object) oneOfs without a
  /// discriminator — github has ~9 such sites, e.g. `simple-user`
  /// (requires `login`) vs `enterprise` (requires `slug`).
  ///
  /// Returns one [_RequiredFieldArm] per variant in [schemas] order,
  /// or null if any variant lacks a uniquely-required property.
  List<_RequiredFieldArm>? get _requiredFieldDispatchArms {
    if (!schemas.every((s) => s is RenderObject)) return null;
    final objects = schemas.cast<RenderObject>();
    final allRequired = objects
        .map((o) => o.requiredProperties.toSet())
        .toList();
    final arms = <_RequiredFieldArm>[];
    for (var i = 0; i < objects.length; i++) {
      final mine = allRequired[i];
      final others = <String>{};
      for (var j = 0; j < allRequired.length; j++) {
        if (i != j) others.addAll(allRequired[j]);
      }
      final unique = mine.difference(others);
      if (unique.isEmpty) return null;
      // Pick the lexicographically-first unique field for stable output.
      final tagField = (unique.toList()..sort()).first;
      arms.add(
        _RequiredFieldArm(variant: objects[i], tagField: tagField),
      );
    }
    return arms;
  }

  bool get _hasDispatch =>
      _hasDiscriminatorDispatch ||
      _canShapeDispatch ||
      _requiredFieldDispatchArms != null;

  @override
  Iterable<Import> get additionalImports => [
    ...super.additionalImports,
    // The dispatch path emits @immutable wrappers that override == /
    // hashCode; the legacy UnimplementedError stub doesn't need it.
    if (_hasDispatch) const Import('package:meta/meta.dart'),
  ];

  @override
  Map<String, dynamic> toTemplateContext(SchemaRenderer context) {
    // Mustache section tags must all be present in the context map (with
    // a falsy value to skip). Default all three modes off, then enable
    // exactly one below.
    final ctx = <String, dynamic>{
      'doc_comment': createDocComment(common: common),
      'typeName': typeName,
      'nullableTypeName': nullableTypeName(context),
      'has_discriminator_dispatch': false,
      'has_shape_dispatch': false,
      'has_required_field_dispatch': false,
      'no_dispatch': false,
      // Defaults for the maybeFromJson partial — overridden per path
      // below. Dispatch paths that take a Map override; shape and the
      // legacy stub keep this dynamic default.
      'maybeFromJsonParamType': 'dynamic',
    };

    /// Wrapper-variant context for the object-only paths
    /// (discriminator, required-field). Both produce
    /// `Map<String, dynamic> toJson() => value.toJson()` wrappers.
    Map<String, dynamic> objectWrapperContext(RenderSchema variant) => {
      'wrapperTypeName': wrapperTypeName(variant),
      'valueType': variant.typeName,
      'toJsonReturnType': 'Map<String, dynamic>',
      'toJsonBody': 'value.toJson()',
      'positionalBoolIgnore': false,
    };

    final disc = discriminator;
    if (disc != null && _hasDiscriminatorDispatch) {
      final variants = schemas.map(objectWrapperContext).toList();
      final dispatch = <Map<String, dynamic>>[];
      for (final entry in disc.mapping.entries) {
        dispatch.add({
          'value': entry.key,
          'wrapperTypeName': wrapperTypeName(entry.value),
          'valueType': entry.value.typeName,
        });
      }
      ctx['has_discriminator_dispatch'] = true;
      ctx['discriminatorProperty'] = disc.propertyName;
      ctx['variants'] = variants;
      ctx['dispatch'] = dispatch;
      ctx['maybeFromJsonParamType'] = 'Map<String, dynamic>?';
      return ctx;
    }
    final shapePlans = _shapeDispatchPlans(context);
    if (shapePlans != null) {
      ctx['has_shape_dispatch'] = true;
      ctx['variants'] = shapePlans
          .map(
            (p) => {
              'wrapperTypeName': p.wrapperTypeName,
              'valueType': p.valueType,
              'jsonTestType': p.jsonTestType,
              'fromJson': p.fromJson,
              // The wrapper partial expects `toJsonBody` and
              // `toJsonReturnType`; shape variants always return
              // `dynamic` (variants might be primitives).
              'toJsonBody': p.toJson,
              'toJsonReturnType': 'dynamic',
              'positionalBoolIgnore': p.positionalBoolIgnore,
            },
          )
          .toList();
      return ctx;
    }
    final reqArms = _requiredFieldDispatchArms;
    if (reqArms != null) {
      ctx['has_required_field_dispatch'] = true;
      ctx['dispatch'] = reqArms
          .map(
            (a) => {
              'tagField': a.tagField,
              'wrapperTypeName': wrapperTypeName(a.variant),
              'valueType': a.variant.typeName,
            },
          )
          .toList();
      ctx['variants'] = reqArms
          .map((a) => objectWrapperContext(a.variant))
          .toList();
      ctx['maybeFromJsonParamType'] = 'Map<String, dynamic>?';
      return ctx;
    }
    ctx['no_dispatch'] = true;
    return ctx;
  }

  @override
  String fromJsonExpression(
    String jsonValue,
    SchemaRenderer context, {
    required bool jsonIsNullable,
    required bool dartIsNullable,
  }) {
    final jsonType = jsonStorageType(isNullable: jsonIsNullable);
    final jsonMethod = jsonIsNullable ? 'maybeFromJson' : 'fromJson';
    return '$className.$jsonMethod($jsonValue as $jsonType)';
  }

  @override
  dynamic get defaultValue => null;

  @override
  String? exampleValue(SchemaRenderer context) {
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

/// One arm of the required-field dispatch: a [RenderObject] variant
/// keyed off the presence of a property unique to its required-set.
@immutable
class _RequiredFieldArm {
  const _RequiredFieldArm({required this.variant, required this.tagField});

  final RenderObject variant;

  /// JSON property name whose presence picks this variant. Required
  /// only by [variant]; absent from every sibling's required-set.
  final String tagField;
}

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
  final Map<String, RenderSchema> mapping;

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
  });

  /// The name of the parameter.
  final String name;

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
  String toJsonExpression(SchemaRenderer context) {
    return type.toJsonExpression(
      dartParameterName(context.quirks),
      context,
      dartIsNullable: isNullable,
    );
  }

  @override
  Iterable<String> get validationCalls => type.validationCalls;

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
    'defaultValue': type.defaultValueString(context),
    'type': type.typeName,
    'nullableType': type.nullableTypeName(context),
  };
}

class RenderUnknown extends RenderSchema {
  const RenderUnknown({required super.common}) : super(createsNewType: false);

  @override
  dynamic get defaultValue => null;

  @override
  String get typeName => 'dynamic';

  @override
  bool get defaultCanConstConstruct => false;

  // We never deserialize or serialize unknown types.
  @override
  bool get shouldCallToJson => false;

  @override
  String jsonStorageType({required bool isNullable}) => 'dynamic';

  // We might need to jsonDecode(jsonEncode(dartName)) to get everything into
  // json types.
  @override
  String toJsonExpression(
    String dartName,
    SchemaRenderer context, {
    required bool dartIsNullable,
  }) => dartName;

  @override
  String fromJsonExpression(
    String jsonValue,
    SchemaRenderer context, {
    required bool jsonIsNullable,
    required bool dartIsNullable,
  }) => jsonValue;

  @override
  Map<String, dynamic> toTemplateContext(SchemaRenderer context) =>
      throw UnimplementedError('RenderUnknown.toTemplateContext');

  @override
  String? exampleValue(SchemaRenderer context) => '<String, dynamic>{}';
}

class RenderVoid extends RenderNoJson {
  const RenderVoid({required super.common});

  @override
  dynamic get defaultValue =>
      throw UnimplementedError('RenderVoid.defaultValue');

  @override
  String get typeName => 'void';

  @override
  String equalsExpression(String name, SchemaRenderer context) =>
      'throw UnimplementedError("RenderVoid.equalsExpression")';

  @override
  bool get defaultCanConstConstruct => false;

  @override
  String fromJsonExpression(
    String jsonValue,
    SchemaRenderer context, {
    required bool jsonIsNullable,
    required bool dartIsNullable,
  }) => ''; // Unclear if this is correct. The one usage is for returning
  // a void type, maybe we need a "return expression" value instead?

  @override
  String? exampleValue(SchemaRenderer context) => null;
}

/// A schema that represents a type which cannot be converted to json.
abstract class RenderNoJson extends RenderSchema {
  const RenderNoJson({required super.common}) : super(createsNewType: false);

  @override
  bool get shouldCallToJson => false;

  @override
  String jsonStorageType({required bool isNullable}) =>
      'throw UnimplementedError("$runtimeType.jsonStorageType")';

  @override
  String toJsonExpression(
    String dartName,
    SchemaRenderer context, {
    required bool dartIsNullable,
  }) => 'throw UnimplementedError("$runtimeType.toJson")';

  @override
  String fromJsonExpression(
    String jsonValue,
    SchemaRenderer context, {
    required bool jsonIsNullable,
    required bool dartIsNullable,
  }) => 'throw UnimplementedError("$runtimeType.fromJson")';

  @override
  Map<String, dynamic> toTemplateContext(SchemaRenderer context) =>
      throw UnimplementedError('$runtimeType.toTemplateContext');

  /// No-JSON types (void, binary) can't round-trip via JSON so they
  /// have no example value.
  @override
  String? exampleValue(SchemaRenderer context) => null;
}

class RenderBinary extends RenderNoJson {
  const RenderBinary({required super.common});

  @override
  dynamic get defaultValue => null;

  @override
  Iterable<Import> get additionalImports => [
    ...super.additionalImports,
    const Import('dart:typed_data'),
  ];

  @override
  String get typeName => 'Uint8List';

  @override
  String equalsExpression(String name, SchemaRenderer context) =>
      '${ModelHelpers.listsEqual}(this.$name, other.$name)';

  @override
  String hashCodeExpression(String name) => '${ModelHelpers.listHash}($name)';

  @override
  bool get defaultCanConstConstruct => false;
}

class RenderEmptyObject extends RenderNewType {
  const RenderEmptyObject({required super.common});

  @override
  dynamic get defaultValue => null;

  @override
  bool get defaultCanConstConstruct => true;

  @override
  String jsonStorageType({required bool isNullable}) => 'Map<String, dynamic>';

  @override
  String toJsonExpression(
    String dartName,
    SchemaRenderer context, {
    required bool dartIsNullable,
  }) => 'const <String, dynamic>{}';

  @override
  String fromJsonExpression(
    String jsonValue,
    SchemaRenderer context, {
    required bool jsonIsNullable,
    required bool dartIsNullable,
  }) => 'const $className()';

  @override
  Map<String, dynamic> toTemplateContext(SchemaRenderer context) => {
    'doc_comment': createDocComment(common: common),
    'typeName': typeName,
    'typeArticle': aOrAn(typeName),
    'nullableTypeName': nullableTypeName(context),
  };

  @override
  String? exampleValue(SchemaRenderer context) => 'const $typeName()';
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
  }) : super(createsNewType: true);

  final JsonPointer targetPointer;

  @override
  dynamic get defaultValue => null;

  @override
  bool get defaultCanConstConstruct => false;

  @override
  bool get shouldCallToJson => true;

  @override
  String get typeName => camelFromSnake(snakeName);

  @override
  String jsonStorageType({required bool isNullable}) =>
      isNullable ? 'Map<String, dynamic>?' : 'Map<String, dynamic>';

  @override
  String toJsonExpression(
    String dartName,
    SchemaRenderer context, {
    required bool dartIsNullable,
  }) {
    final nameCall = dartIsNullable ? '$dartName?' : dartName;
    return '$nameCall.toJson()';
  }

  @override
  String fromJsonExpression(
    String jsonValue,
    SchemaRenderer context, {
    required bool jsonIsNullable,
    required bool dartIsNullable,
  }) {
    final jsonType = jsonStorageType(isNullable: jsonIsNullable);
    final jsonMethod = jsonIsNullable ? 'maybeFromJson' : 'fromJson';
    final orDefault = orDefaultExpression(
      context: context,
      jsonIsNullable: jsonIsNullable,
      dartIsNullable: dartIsNullable,
    );
    return '$typeName.$jsonMethod($jsonValue as $jsonType)$orDefault';
  }

  @override
  Map<String, dynamic> toTemplateContext(SchemaRenderer context) =>
      throw UnimplementedError('RenderRecursiveRef does not render a template');

  /// Recursive refs by definition loop back through themselves — any
  /// attempt to build an example value would recurse indefinitely.
  /// Returning null here propagates up the tree so the enclosing
  /// schema opts out of test generation.
  @override
  String? exampleValue(SchemaRenderer context) => null;

  @override
  List<Object?> get props => [super.props, targetPointer];
}
