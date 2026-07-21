import 'package:collection/collection.dart';
import 'package:meta/meta.dart';
import 'package:space_gen/src/logger.dart';
import 'package:space_gen/src/parse/spec.dart';
import 'package:space_gen/src/parse/visitor.dart';
import 'package:space_gen/src/string.dart';

T _required<T>(MapContext json, String key) {
  final value = json[key];
  if (value == null) {
    _error(json, 'Key $key is required');
  }
  return value as T;
}

void _refNotExpected(MapContext json) {
  if (json.containsKey(r'$ref')) {
    _error(json, r'$ref not expected');
  }
}

MapContext _requiredMap(MapContext json, String key) {
  final value = json[key];
  // Check the value is not null to avoid the childAsMap throwing StateError.
  if (value == null) {
    _error(json, 'Key $key is required');
  }
  return json.childAsMap(key);
}

void _expect(bool condition, ParseContext json, String message) {
  if (!condition) {
    _error(json, message);
  }
}

T _expectType<T>(ParseContext context, String key, dynamic value) {
  if (value is! T) {
    _error(context, "'$key' is not of type $T: $value");
  }
  return value;
}

T? _optional<T>(MapContext parent, String key) {
  final value = parent[key];
  return _expectType<T?>(parent, key, value);
}

// Double has to be parsed as a num since Dart's json parser will treat
// '1' as an int, even if we expect it to be a double.
double? _optionalDouble(MapContext parent, String key) {
  final value = parent[key];
  if (value == null) {
    return null;
  }
  return _expectType<num?>(parent, key, value)?.toDouble();
}

// Read an integer-typed field (an `integer` schema's `minimum`,
// `maximum`, `default`, etc.) tolerantly as a `num`. A JSON/YAML integer
// literal too large for a signed 64-bit int is handed back as a double
// (e.g. OpenAI's `maximum: 9223372036854775807` — int64 max serialized
// through float64 as 9223372036854776000), which `_optional<int>` would
// reject outright. Such a bound is unrepresentable as a Dart `int`
// literal *and* vacuous for a 64-bit `int` value, so we drop it with a
// warning rather than crash or emit uncompilable code. A double that is
// an exact, small-enough integer (`5.0`) is still accepted.
int? _optionalInt(MapContext parent, String key) {
  final value = parent[key];
  if (value == null) {
    return null;
  }
  final number = _expectType<num>(parent, key, value);
  if (number is int) {
    return number;
  }
  // The value arrived as a double. Only trust the conversion within
  // ±2^53, the largest magnitude where a double represents every integer
  // exactly; beyond it `toInt()` silently saturates, so a round-trip
  // check would falsely accept an out-of-range value. Real specs only
  // exceed this with int64-boundary sentinels, which are vacuous bounds
  // for a Dart `int` anyway.
  const maxExactInt = 0x20000000000000; // 2^53
  if (number.abs() <= maxExactInt && number == number.roundToDouble()) {
    return number.toInt();
  }
  _warn(parent, "Ignoring '$key'=$number: not representable as a 64-bit int");
  return null;
}

/// Resolves an inclusive/exclusive numeric bound pair, tolerating both
/// OpenAPI spellings of `exclusiveMinimum` / `exclusiveMaximum`:
///
/// - **OpenAPI 3.1 / JSON Schema 2020-12** — a *number* that is itself the
///   exclusive bound (`exclusiveMinimum: 5` ⇒ value > 5). Passed through.
/// - **OpenAPI 3.0** — a *boolean* modifier on the sibling inclusive bound
///   (`minimum: 5` + `exclusiveMinimum: true` ⇒ value > 5). Folded into the
///   3.1 shape the rest of the pipeline already understands by promoting the
///   inclusive value into the exclusive slot; `false` leaves it inclusive.
///
/// At most one of the returned bounds is non-null.
({T? inclusive, T? exclusive}) _resolveBound<T extends num>(
  MapContext json, {
  required String inclusiveKey,
  required String exclusiveKey,
  required T? Function(MapContext, String) readNumber,
}) {
  final inclusive = readNumber(json, inclusiveKey);
  // Reading via `[]` marks the key used; branch before `readNumber` so the
  // 3.0 boolean never reaches the `num` type check.
  final exclusiveRaw = json[exclusiveKey];
  if (exclusiveRaw is bool) {
    return exclusiveRaw
        ? (inclusive: null, exclusive: inclusive)
        : (inclusive: inclusive, exclusive: null);
  }
  return (inclusive: inclusive, exclusive: readNumber(json, exclusiveKey));
}

List<T> _expectList<T>(MapContext parent, String key, dynamic value) {
  if (value is! List || !value.every((e) => e is T)) {
    _error(parent, "'$key' is not a list of $T: $value");
  }
  return value.cast<T>();
}

List<T> _requiredList<T>(MapContext parent, String key) {
  final value = parent[key];
  if (value == null) {
    _error(parent, 'Key $key is required');
  }
  return _expectList<T>(parent, key, value);
}

List<T>? _optionalList<T>(MapContext parent, String key) {
  final value = parent[key];
  if (value == null) {
    return null;
  }
  return _expectList<T>(parent, key, value);
}

MapContext? _optionalMap(MapContext parent, String key) {
  final value = parent[key];
  if (value == null) {
    return null;
  }
  _expectType<Map<String, dynamic>>(parent, key, value);
  return parent.childAsMap(key);
}

List<T> _mapOptionalList<T>(
  MapContext parent,
  String key,
  T Function(MapContext, int) parse,
) {
  final value = parent[key];
  if (value == null) {
    return [];
  }

  final list = parent.childAsList(key);
  final parsed = <T>[];
  for (var i = 0; i < list.length; i++) {
    final child = list.indexAsMap(i);
    parsed.add(parse(child, i));
    // Complete the parse before yielding to ensure the child is not
    // considered unused.
    _warnUnused(child);
  }
  return parsed;
}

Never _unimplemented(ParseContext json, String message) {
  throw UnimplementedError('$message not supported in $json');
}

/// Mark [key] as used and detail-log it as ignored.
///
/// `_ignored` is the explicit form: the parser is choosing to drop a
/// field it has already (or will already) read. The log fires
/// whenever the value is non-null, even if another code path already
/// consumed the key. Use when you want the user to see that the field
/// was acknowledged-but-not-acted-on.
///
/// For the catch-all case — "consume any straggler, but only complain
/// if nothing else has touched it" — see [_ignoreIfUnused].
void _ignored<T>(MapContext parent, String key, {bool warn = false}) {
  final value = parent[key];
  if (value != null) {
    _expectType<T>(parent, key, value);
    final includeValue = value.toString().length < 10;
    final maybeValue = includeValue ? '=$value' : '';
    final message = 'Ignoring: $key$maybeValue ($T) in ${parent.pointer}';
    final method = warn ? logger.warn : logger.detail;
    method(message);
  }
}

/// Catch-all variant of [_ignored]: detail-logs only when [key] was
/// unused at call time. Safe to call at the end of a parse function
/// to mop up keys placed where the chosen schema shape doesn't act on
/// them (e.g. `minItems` on a non-array, `additionalProperties` on a
/// non-object) without double-logging the keys that were legitimately
/// consumed earlier.
void _ignoreIfUnused<T>(MapContext parent, String key) {
  if (parent.unusedKeys.contains(key)) {
    _ignored<T>(parent, key);
  }
}

void _warn(ParseContext context, String message) {
  logger.warn('$message in ${context.pointer}');
}

Never _error(ParseContext context, String message) {
  throw FormatException('$message in ${context.pointer}');
}

void _warnUnused(MapContext context) {
  // OpenAPI 3.x reserves the `x-` prefix for vendor extensions; per
  // the spec, processors that don't recognize them should ignore
  // them — but that means "don't fail," not "suppress all log
  // output." Unhandled `x-*` keys flow through here as `Unused:`
  // entries at -v so the verbose-log mining workflow can spot
  // extensions worth adding support for (e.g. `x-enum-varnames`,
  // `x-internal`). When we do add support, the read marks the key
  // used and removes it from this tally automatically.
  // https://spec.openapis.org/oas/v3.1.0#specification-extensions
  final unusedKeys = context.unusedKeys;
  if (unusedKeys.isNotEmpty) {
    final keys = unusedKeys
        .map((k) {
          final value = context[k].toString();
          final includeValue = value.length < 10;
          final maybeValue = includeValue ? '=$value' : '';
          return '$k$maybeValue';
        })
        .join(', ');
    logger.detail('Unused: $keys in ${context.pointer}');
  }
}

RefOr<Parameter> parseParameterOrRef(MapContext json) {
  if (json.containsKey(r'$ref')) {
    final ref = json[r'$ref'] as String;
    return RefOr<Parameter>.ref(ref, json.pointer);
  }
  return RefOr<Parameter>.object(parseParameter(json), json.pointer);
}

ParameterLocation _parseParameterLocation(MapContext context, String location) {
  switch (location) {
    case 'query':
      return ParameterLocation.query;
    case 'header':
      return ParameterLocation.header;
    case 'path':
      return ParameterLocation.path;
    case 'cookie':
      return ParameterLocation.cookie;
    default:
      _error(context, 'Unknown parameter location: $location');
  }
}

/// Default `style` for a parameter at the given OpenAPI location.
/// Per OpenAPI 3.x: query/cookie default to `form`, header/path to `simple`.
String _defaultStyle(ParameterLocation location) {
  switch (location) {
    case ParameterLocation.query:
    case ParameterLocation.cookie:
      return 'form';
    case ParameterLocation.header:
    case ParameterLocation.path:
      return 'simple';
  }
}

/// Default `explode` for a parameter at the given OpenAPI location.
/// True when the default style is `form`, false otherwise.
bool _defaultExplode(ParameterLocation location) {
  switch (location) {
    case ParameterLocation.query:
    case ParameterLocation.cookie:
      return true;
    case ParameterLocation.header:
    case ParameterLocation.path:
      return false;
  }
}

/// The effective OpenAPI `explode` for a parameter — its explicit value, or
/// the per-location default — warning when a non-default value can't be
/// honored. `explode` is the only serialization keyword the generator honors,
/// so it's the only one threaded into the model; `style` / `allowReserved` are
/// warn-only ([_warnUnsupportedSerialization]).
bool _parseExplode(MapContext json, ParameterLocation location) {
  final explode = _optional<bool>(json, 'explode');
  final defaultExplode = _defaultExplode(location);
  // Query parameters honor both explode values *for scalars and arrays*
  // (array + `explode: false` comma-joins into one value; see the query
  // renderer). Object-shaped query params are not handled and no longer warn
  // here — tracked separately in https://github.com/eseidel/space_gen/issues/233
  // (query params need `_canBePathParameter`-style type validation). Other
  // locations only emit their default wire format, so a non-default value
  // there still warns.
  if (explode != null &&
      explode != defaultExplode &&
      location != ParameterLocation.query) {
    _warn(
      json,
      'explode=$explode is not honored on ${location.name} parameters; '
      'generator emits the default (explode=$defaultExplode) wire format',
    );
  }
  return explode ?? defaultExplode;
}

/// Warn about `style` / `allowReserved` values the generator does not honor
/// (`explode` — the one keyword we thread — is handled by [_parseExplode]).
/// Reads (and so consumes) each keyword; spec-explicit defaults are consumed
/// quietly.
void _warnUnsupportedSerialization(
  MapContext json,
  ParameterLocation location,
) {
  final style = _optional<String>(json, 'style');
  final defaultStyle = _defaultStyle(location);
  if (style != null && style != defaultStyle) {
    _warn(
      json,
      'style="$style" is not honored on ${location.name} parameters; '
      'generator emits the default ($defaultStyle) wire format',
    );
  }
  // `allowReserved` is deliberately NOT honored, and we don't intend to unless
  // a real spec proves a server needs it. `Uri.replace(queryParameters:)`
  // percent-encodes reserved chars uniformly with no per-param opt-out, so
  // honoring it would mean hand-building that slice of the query string with a
  // looser encoder — invasive, and a footgun (an unescaped `&`/`=` in a value
  // breaks query parsing). It's also a practical no-op: servers percent-decode
  // query values, so `a%3Ab` and `a:b` mean the same thing on the wire. We
  // keep the WARN so the divergence is visible; revisit only on a concrete
  // report.
  final allowReserved = _optional<bool>(json, 'allowReserved') ?? false;
  if (allowReserved) {
    _warn(
      json,
      'allowReserved=true is not honored on ${location.name} parameters; '
      'generator URL-encodes reserved characters',
    );
  }
}

/// Parse a parameter from a json object.
Parameter parseParameter(MapContext json) {
  _refNotExpected(json);
  final schema = _optionalMap(json, 'schema');
  final hasSchema = schema != null;
  final hasContent = _optional<Json>(json, 'content') != null;

  // Common fields.
  final name = _required<String>(json, 'name');
  final description = _optional<String>(json, 'description');
  final isRequired = _optional<bool>(json, 'required') ?? false;
  final inLocation = _parseParameterLocation(
    json,
    _required<String>(json, 'in'),
  );
  final deprecated = _optional<bool>(json, 'deprecated') ?? false;
  _ignored<bool>(json, 'allowEmptyValue');

  final SchemaRef type;
  final bool explode;
  dynamic example;
  List<dynamic>? examples;
  if (hasSchema && !hasContent) {
    // Schema fields.
    type = parseSchemaOrRef(schema);
    explode = _parseExplode(json, inLocation);
    _warnUnsupportedSerialization(json, inLocation);
    example = _optional<dynamic>(json, 'example');
    examples = _parseExamplesMap(json);
  } else if (!hasSchema && hasContent) {
    // Content values (Map<String, MediaType>) are not supported.
    _unimplemented(json, "'content'");
  } else if (hasSchema && hasContent) {
    _error(json, 'Parameter cannot have both schema and content');
  } else {
    _error(json, 'Parameter must have either schema or content.');
  }

  if (inLocation == ParameterLocation.path) {
    // Path parameter type validation is done during resolution since
    // type could be a ref until then.
    if (isRequired != true) {
      _error(json, 'Path parameters must be required');
    }
  }

  _warnUnused(json);
  return Parameter(
    pointer: json.pointer,
    name: name,
    description: description,
    isRequired: isRequired,
    isDeprecated: deprecated,
    inLocation: inLocation,
    type: type,
    example: example,
    examples: examples,
    explode: explode,
  );
}

Header parseHeader(MapContext json) {
  _refNotExpected(json);

  if (json.containsKey('name')) {
    _error(json, 'Header name is not allowed');
  }
  if (json.containsKey('in')) {
    _error(json, 'Header in is not allowed');
  }

  final description = _optional<String>(json, 'description');
  _ignored<bool>(json, 'deprecated');
  _ignored<bool>(json, 'allowEmptyValue');
  // Headers always comma-join arrays (style=simple, explode=false), so the
  // effective explode isn't stored — call `_parseExplode` only for its warning
  // side effect (a non-default explode on a header is unsupported).
  _parseExplode(json, ParameterLocation.header);
  _warnUnsupportedSerialization(json, ParameterLocation.header);
  final example = _optional<dynamic>(json, 'example');
  final examples = _parseExamplesMap(json);

  final schema = _maybeSchemaOrRef(_optionalMap(json, 'schema'));
  _warnUnused(json);
  return Header(
    pointer: json.pointer,
    description: description,
    schema: schema,
    example: example,
    examples: examples,
  );
}

/// Parse an OpenAPI `examples` map (used on parameters and headers) into
/// a flat list of example values, in declaration order. Each entry in
/// the map is an Example object whose `value` field carries the actual
/// example payload; sibling fields like `summary`/`description`/
/// `externalValue` are not yet surfaced.
///
/// Returns null when no `examples` key is present so the absence is
/// preserved through the pipeline (vs. an empty list, which would
/// suggest the spec author wrote `examples: {}`).
List<dynamic>? _parseExamplesMap(MapContext json) {
  final examples = _optionalMap(json, 'examples');
  if (examples == null) {
    return null;
  }
  final values = <dynamic>[];
  for (final key in examples.keys) {
    final entry = examples.childAsMap(key);
    final value = _optional<dynamic>(entry, 'value');
    // The Example object has optional `summary`, `description`,
    // `externalValue` siblings — consume them quietly so `_warnUnused`
    // doesn't fire for spec-legal fields the generator just doesn't
    // surface in doc comments yet.
    _ignored<String>(entry, 'summary');
    _ignored<String>(entry, 'description');
    _ignored<String>(entry, 'externalValue');
    _warnUnused(entry);
    if (value != null) {
      values.add(value);
    }
  }
  return values;
}

RefOr<Header> parseHeaderOrRef(MapContext json) {
  if (json.containsKey(r'$ref')) {
    final ref = json[r'$ref'] as String;
    return RefOr<Header>.ref(ref, json.pointer);
  }
  return RefOr<Header>.object(parseHeader(json), json.pointer);
}

/// Parse the optional `discriminator` keyword that appears alongside
/// oneOf/anyOf/allOf. Mapping values may be either a JSON Pointer
/// (`#/components/schemas/Foo`) or a bare schema name (`Foo`); the
/// latter is normalized here to the canonical pointer form. The
/// resolver later matches each mapping value to one of the variants.
SchemaDiscriminator? _parseDiscriminator(MapContext json) {
  final discriminatorJson = _optionalMap(json, 'discriminator');
  if (discriminatorJson == null) {
    return null;
  }
  final propertyName = _required<String>(discriminatorJson, 'propertyName');
  final mappingJson = _optionalMap(discriminatorJson, 'mapping');
  Map<String, SchemaRef>? mapping;
  if (mappingJson != null) {
    mapping = <String, SchemaRef>{};
    for (final key in mappingJson.json.keys) {
      final raw = mappingJson[key];
      if (raw is! String) {
        _error(
          mappingJson,
          'discriminator.mapping[$key] must be a string',
        );
      }
      final refString = raw.startsWith('#/') || raw.startsWith('/')
          ? raw
          : '#/components/schemas/$raw';
      mapping[key] = SchemaRef.ref(refString, mappingJson.pointer.add(key));
    }
  }
  return SchemaDiscriminator(propertyName: propertyName, mapping: mapping);
}

Schema? _handleCollectionTypes(
  MapContext json, {
  required CommonProperties common,
  required TypeAndFormat typeAndFormat,
}) {
  if (json.containsKey('oneOf')) {
    if (_isConstraintOnlyCollection(json, 'oneOf')) {
      return null;
    }
    // OpenAPI 3.1 / JSON Schema 2020-12 spec authors sometimes spell
    // an enum as a oneOf of single-value `const:` variants — Discord
    // does this for 84 typed enums (e.g. `MessageComponentTypes` with
    // 20 `{title: ACTION_ROW, const: 1}` variants). Without collapse,
    // each parent renders as a sealed class with an
    // `UnimplementedError` `fromJson` (no discriminator to pick a
    // variant). Collapse to `SchemaIntEnum` / `SchemaStringEnum` so
    // they generate clean enum types instead.
    final collapsed = _maybeCollapseOneOfOfConsts(
      json,
      common: common,
      typeAndFormat: typeAndFormat,
    );
    if (collapsed != null) {
      return collapsed;
    }
    final mergedVariants = _maybeMergeParentIntoVariants(json, 'oneOf');
    final discriminator = _parseDiscriminator(json);
    if (mergedVariants != null) {
      return SchemaOneOf(
        common: common,
        schemas: mergedVariants,
        discriminator: discriminator,
      );
    }
    final oneOf = json.childAsList('oneOf');
    final schemas = <SchemaRef>[];
    for (var i = 0; i < oneOf.length; i++) {
      schemas.add(
        parseSchemaOrRef(oneOf.indexAsMap(i).addSnakeName('one_of_$i')),
      );
    }
    return SchemaOneOf(
      common: common,
      schemas: schemas,
      discriminator: discriminator,
    );
  }

  if (json.containsKey('allOf')) {
    final allOf = json.childAsList('allOf');
    final schemas = <SchemaRef>[];
    for (var i = 0; i < allOf.length; i++) {
      schemas.add(
        parseSchemaOrRef(allOf.indexAsMap(i).addSnakeName('all_of_$i')),
      );
    }
    return SchemaAllOf(common: common, schemas: schemas);
  }

  if (json.containsKey('anyOf')) {
    if (_isConstraintOnlyCollection(json, 'anyOf')) {
      return null;
    }
    final mergedVariants = _maybeMergeParentIntoVariants(json, 'anyOf');
    final discriminator = _parseDiscriminator(json);
    if (mergedVariants != null) {
      return SchemaAnyOf(
        common: common,
        schemas: mergedVariants,
        discriminator: discriminator,
      );
    }
    final anyOf = json.childAsList('anyOf');
    final schemas = <SchemaRef>[];
    for (var i = 0; i < anyOf.length; i++) {
      schemas.add(
        parseSchemaOrRef(anyOf.indexAsMap(i).addSnakeName('any_of_$i')),
      );
    }
    return SchemaAnyOf(
      common: common,
      schemas: schemas,
      discriminator: discriminator,
    );
  }
  return null;
}

/// Returns true when [json] declares its own object shape (type:object
/// + non-empty properties) AND every entry of the [collectionKey]
/// (oneOf/anyOf) is a "required-only" constraint — a map containing
/// nothing but a `required` list. Github uses this OpenAPI shape to
/// say "exactly one of these properties must be present" (e.g.
/// `pulls/request-reviewers` requires either `reviewers` or
/// `team_reviewers`); the parent already names the properties, so the
/// right Dart shape is a single object with all of them, and the
/// oneOf is a runtime constraint we don't carry into the type system.
///
/// When this matches we return null from [_handleCollectionTypes] so
/// the outer parse falls through to normal object parsing — the
/// oneOf/anyOf becomes "ignored" (each variant's `required` already
/// surfaces in the verbose log via `_warnUnused`).
bool _isConstraintOnlyCollection(MapContext json, String collectionKey) {
  // The parent must declare its own object shape — explicit
  // `type: object` (or a list type containing `'object'`) and a
  // non-empty `properties` map.
  final type = json['type'];
  final hasObjectType =
      type == 'object' || (type is List && type.contains('object'));
  if (!hasObjectType) return false;
  final properties = json['properties'];
  if (properties is! Map || properties.isEmpty) return false;
  // Every variant must contain only `required` (and no other keys —
  // no type, properties, oneOf, etc.). A variant that brings its own
  // shape is a real polymorphic branch; only `required: [...]` is a
  // constraint.
  final list = json[collectionKey];
  if (list is! List) return false;
  for (final variant in list) {
    if (variant is! Map) return false;
    if (variant.length != 1 || !variant.containsKey('required')) return false;
  }
  return true;
}

/// Detects the "oneOf-of-consts" enum pattern: a oneOf where every
/// variant is `{const: X}` (optionally with `title:` and
/// `description:`). Discord uses this for typed enums like
/// `MessageComponentTypes`: `{type: integer, oneOf: [{title: 'ACTION_ROW',
/// const: 1}, {title: 'BUTTON', const: 2}, ...]}`.
///
/// Trusts the parent's `type:` / `format:` the same way `_handleEnum`
/// does. Bails (returns null) when the parent has a `format:` that
/// would produce a `SchemaPod` (date, date-time, uri, email, uuid,
/// boolean), since collapsing to `SchemaStringEnum` / `SchemaIntEnum`
/// would silently drop the pod typing — the spec author asked for a
/// `DateTime` (or similar) and we'd give them a `String` enum. Also
/// bails on cross-type mismatches (declared `type: integer` but
/// string-shaped consts, etc.).
///
/// Returns the collapsed enum schema when it cleanly fits, or null to
/// fall through to the regular oneOf-parse path.
Schema? _maybeCollapseOneOfOfConsts(
  MapContext json, {
  required CommonProperties common,
  required TypeAndFormat typeAndFormat,
}) {
  // Pod formats (date-time, uri, email, uuid, etc.) name a typed Dart
  // representation that a `String`/`int` enum couldn't carry. Don't
  // collapse — let the regular oneOf path handle it (and surface any
  // gaps as warnings).
  if (typeAndFormat.podType != null) return null;
  final list = json['oneOf'];
  if (list is! List || list.isEmpty) return null;
  // Every variant must be a const-only map (with optional title and
  // description metadata). Anything else means a real polymorphic
  // branch — fall through.
  const allowedKeys = {'const', 'title', 'description'};
  for (final variant in list) {
    if (variant is! Map) return null;
    if (!variant.containsKey('const')) return null;
    if (variant.keys.any((k) => !allowedKeys.contains(k))) return null;
  }
  // Walk the variants once to collect values, descriptions, and titles.
  // A `title:` (`{title: BLOCK_MESSAGE, const: 1}`) is the spec's own
  // member name; preserved so render emits `blockMessage` instead of the
  // value-derived fallback `value1`.
  final values = <dynamic>[];
  final descriptions = <String?>[];
  final titles = <String?>[];
  for (final variant in list.cast<Map<dynamic, dynamic>>()) {
    values.add(variant['const']);
    descriptions.add(variant['description'] as String?);
    titles.add(variant['title'] as String?);
  }
  // Pick string vs int from the parent's declared `type:`, falling
  // back to value-shape inference when `type:` is absent (matches the
  // pattern in `_handleEnum`). When the declared type and the values
  // disagree, bail — the spec is internally inconsistent and the
  // regular oneOf path's warnings are more honest than a silent
  // type-coercion.
  final declaredType = typeAndFormat.type;
  final bool isInt;
  if (declaredType == 'integer') {
    if (!values.every((v) => v is int)) return null;
    isInt = true;
  } else if (declaredType == 'string') {
    if (!values.every((v) => v is String)) return null;
    isInt = false;
  } else if (declaredType == null) {
    final allInt = values.every((v) => v is int);
    final allString = values.every((v) => v is String);
    if (!allInt && !allString) return null;
    isInt = allInt;
  } else {
    // Other types (boolean, array, object) don't have a clean enum
    // collapse — fall through.
    return null;
  }
  // `type:` and `format:` on the parent were already consumed by
  // `parseTypeAndFormat` upstream; `oneOf` was consumed by the
  // `json['oneOf']` read above. No extra `markUsed` needed.
  //
  // If any variant declared a description, plumb the parallel list
  // through `enumDescriptions`. If none did, leave it null.
  final descriptionsToPlumb = descriptions.any((d) => d != null)
      ? descriptions.map((d) => d ?? '').toList()
      : null;
  // Names are all-or-nothing: only drive member names from titles when
  // every variant has one, so we never mix `blockMessage` with `value1`.
  final namesToPlumb = titles.every((t) => t != null && t.isNotEmpty)
      ? titles.cast<String>()
      : null;
  if (isInt) {
    return SchemaIntEnum(
      common: common,
      defaultValue: null,
      enumValues: values.cast<int>(),
      enumDescriptions: descriptionsToPlumb,
      enumNames: namesToPlumb,
    );
  }
  return SchemaStringEnum(
    common: common,
    defaultValue: null,
    enumValues: values.cast<String>(),
    enumDescriptions: descriptionsToPlumb,
    enumNames: namesToPlumb,
  );
}

/// Returns merged variant schemas when [json] declares a base object
/// shape (`type: object` + `properties`) AND every entry of the
/// [collectionKey] (oneOf/anyOf) is itself a partial inline object
/// that *refines* that shape — adds a property override, an extra
/// required field, etc. — rather than introducing a wholly different
/// type.
///
/// This is the github `repos/{owner}/{repo}/check-runs` POST pattern:
/// the parent declares all the fields (`name`, `head_sha`, …) and
/// the oneOf says "additionally, when `status: completed`,
/// `conclusion` is required." Today's parser drops the parent's
/// `properties`/`required` on the floor when it sees the oneOf,
/// emitting variant classes that lack the base fields entirely.
///
/// The fix here is parse-time: synthesize one merged variant per
/// branch by overlaying the parent's `properties`/`required` with
/// the variant's. Each merged variant goes through normal object
/// parsing, and the resulting `SchemaOneOf`/`SchemaAnyOf` dispatches
/// over full-shape variants — typically via the parent's
/// discriminator. Returns `null` (caller falls back to today's
/// behavior) when the pattern doesn't match — including:
///
///   - The parent has no `properties` / no `type: object` shape.
///   - Any variant is a `$ref` (we can't merge into another file's
///     schema at parse time without resolving it first).
///   - Any variant declares its own `oneOf`/`anyOf`/`allOf` (real
///     polymorphism inside polymorphism — punt).
///   - Any variant declares a non-object `type` (it's a real
///     alternative type, not a refinement).
List<SchemaRef>? _maybeMergeParentIntoVariants(
  MapContext json,
  String collectionKey,
) {
  // Parent must declare `type: object` and a non-empty `properties`
  // map. Without `type` we'd be guessing whether the variants are
  // refinements or alternatives.
  final type = json['type'];
  final hasObjectType =
      type == 'object' || (type is List && type.contains('object'));
  if (!hasObjectType) return null;
  final parentProperties = json['properties'];
  if (parentProperties is! Map<String, dynamic> || parentProperties.isEmpty) {
    return null;
  }
  final list = json[collectionKey];
  if (list is! List || list.isEmpty) return null;

  // Every variant must be a refinement-shaped inline object.
  for (final variant in list) {
    if (variant is! Map<String, dynamic>) return null;
    if (variant.containsKey(r'$ref')) return null;
    if (variant.containsKey('oneOf') ||
        variant.containsKey('anyOf') ||
        variant.containsKey('allOf')) {
      return null;
    }
    final variantType = variant['type'];
    if (variantType != null && variantType != 'object') return null;
    // A variant with no `properties` and no `required` is just empty
    // noise — fall through to today's behavior so it surfaces in the
    // verbose log.
    if (!variant.containsKey('properties') &&
        !variant.containsKey('required')) {
      return null;
    }
  }

  // Read `required` via the underlying json (no `_markRead`) so an
  // early null-return below doesn't accidentally consume the key.
  // Only when we successfully build merged variants do we mark it
  // as used (via the explicit lookup at the end of the function).
  final parentRequired = json.json['required'];
  if (parentRequired != null && parentRequired is! List) return null;
  final parentRequiredList =
      (parentRequired as List?)?.cast<String>() ?? const <String>[];

  // Build the merged variants. Each gets its own MapContext with
  // the pointer / snake-name chain matching a real variant parse,
  // so the resolver and naming layers see indistinguishable
  // schemas.
  final merged = <SchemaRef>[];
  for (var i = 0; i < list.length; i++) {
    final variant = list[i] as Map<String, dynamic>;

    final mergedProperties = <String, dynamic>{
      ...parentProperties,
    };
    final variantProperties = variant['properties'];
    if (variantProperties is Map<String, dynamic>) {
      // Variant overrides parent on field-name collision (the github
      // pattern is to narrow `status`'s enum per branch).
      mergedProperties.addAll(variantProperties);
    }

    final variantRequired = variant['required'];
    final variantRequiredList = variantRequired is List
        ? variantRequired.cast<String>()
        : const <String>[];
    final mergedRequired = <String>[
      ...parentRequiredList,
      for (final name in variantRequiredList)
        if (!parentRequiredList.contains(name)) name,
    ];

    final mergedJson = <String, dynamic>{
      'type': 'object',
      // Carry the parent's `additionalProperties` first so a variant
      // can still override it (variant values win because they're
      // spread after).
      if (json.json.containsKey('additionalProperties'))
        'additionalProperties': json.json['additionalProperties'],
      ...variant,
      'properties': mergedProperties,
      if (mergedRequired.isNotEmpty) 'required': mergedRequired,
    };

    // Mirror the pointer / snake-name chain the regular variant
    // path builds: pointer is `<parent>/<collectionKey>/<i>` and
    // the snake stack gets `<one|any>_of_<i>` appended. Built
    // directly because there's no real list context in the spec
    // here — the merged variant is a parser-side synthesis. The
    // caller of this function only ever passes 'oneOf' or 'anyOf';
    // 'allOf' has its own non-merging code path.
    final stem = collectionKey == 'oneOf' ? 'one_of' : 'any_of';
    final variantContext = MapContext(
      pointerParts: [...json.pointerParts, collectionKey, '$i'],
      snakeNameStack: [...json.snakeNameStack, '${stem}_$i'],
      json: mergedJson,
    );
    merged.add(parseSchemaOrRef(variantContext));
  }

  // Mark the remaining parent keys as consumed so `_warnUnused`
  // doesn't fire on them. `type` / `properties` / `[collectionKey]`
  // are already marked by the early lookups above. The caller
  // consumes `discriminator` via `_parseDiscriminator` (now called
  // for both the oneOf and anyOf branches).
  if (json.containsKey('required')) json.markUsed('required');
  if (json.containsKey('additionalProperties')) {
    json.markUsed('additionalProperties');
  }
  return merged;
}

SchemaRef? _handleAdditionalProperties(MapContext parent) {
  final value = parent['additionalProperties'];
  if (value == null) {
    return null;
  }
  if (value is bool) {
    if (value) {
      return SchemaRef.object(
        SchemaUnknown(
          common: CommonProperties.empty(
            pointer: parent.pointer.add('additionalProperties'),
            snakeName: 'additionalProperties',
          ),
        ),
        parent.pointer,
      );
    }
    return null;
  }
  if (value is Map<String, dynamic>) {
    return parseSchemaOrRef(parent.childAsMap('additionalProperties'));
  }
  _error(parent, 'additionalProperties must be a boolean or a map');
}

/// Builds a [SchemaMap] for an object with no named properties and an
/// `additionalProperties` [valueSchema] (arbitrary string keys). Shared by
/// the omitted-`properties` and explicit-`properties: {}` paths so the two
/// spellings resolve identically.
SchemaMap _mapSchema(
  MapContext json, {
  required CommonProperties common,
  required SchemaRef valueSchema,
}) {
  // Optional: JSON Schema 2020-12 / OpenAPI 3.1 `propertyNames` constrains the
  // keys of this map-shaped object to values that conform to the given schema.
  // When that schema is (or resolves to) an enum, we use it as the Dart
  // map key type.
  final propertyNamesJson = _optionalMap(json, 'propertyNames');
  final keySchema = propertyNamesJson == null
      ? null
      : parseSchemaOrRef(propertyNamesJson);
  return SchemaMap(
    common: common,
    valueSchema: valueSchema,
    keySchema: keySchema,
  );
}

/// Unwraps a scalar enum `default` that a spec wrapped in a single-element
/// list — e.g. OpenAI's `default: [auto]` on `enum: [auto]`.
///
/// **This is a real-world leniency, not part of the OpenAPI / JSON Schema
/// spec.** There, an enum `default` is a bare value, and for a scalar enum
/// that means a scalar — never a list. But some spec-authoring tools emit
/// the value wrapped in a one-element list; since enum values are always
/// scalars, a one-item list is an unambiguous typo, so we reinterpret it as
/// the scalar it plainly means and log the accommodation at `-v`. Any other
/// value is returned untouched.
dynamic _unwrapSingletonDefault(MapContext json, dynamic value) {
  if (value is List && value.length == 1) {
    final unwrapped = value.first;
    logger.detail(
      'Unwrapping single-element list default $value to $unwrapped '
      '(not spec-conformant; seen in real-world specs) in ${json.pointer}',
    );
    return unwrapped;
  }
  return value;
}

SchemaEnum<Object>? _handleEnum({
  required MapContext json,
  required TypeAndFormat typeAndFormat,
  required dynamic defaultValue,
  required CommonProperties common,
}) {
  // OpenAPI 3.1 / JSON Schema 2020-12: `const: X` is the single-value
  // form of `enum: [X]`. Discord uses 128+ such sites — most are
  // single-value tags (`const: 1`) on oneOf variants for implicit
  // discrimination, the same role github fills with single-value
  // strings. Treat the two spellings identically before validating.
  final explicitEnum = _optional<List<dynamic>>(json, 'enum');
  final constValue = _optional<dynamic>(json, 'const');
  final List<dynamic>? enumValues;
  if (explicitEnum != null) {
    if (constValue != null) {
      _error(
        json,
        "'enum' and 'const' cannot both be set: enum=$explicitEnum, "
        'const=$constValue',
      );
    }
    enumValues = explicitEnum;
  } else if (constValue != null) {
    enumValues = <dynamic>[constValue];
  } else {
    enumValues = null;
  }
  final type = typeAndFormat.type;
  final podType = typeAndFormat.podType;

  if (enumValues == null) {
    return null;
  }
  // Pick string vs int from the declared `type:`, falling back to
  // value-shape inference when `type:` is absent (Discord's typed-
  // enum pattern: `type: integer` on the parent + `const: N` on each
  // oneOf variant, where the variant carries no `type` of its own).
  // Boolean enums (e.g. github's `fork: true`) have nothing to
  // dispatch on; bail and let the schema fall through to non-enum
  // boolean.
  final bool isInt;
  if (type == 'integer') {
    isInt = true;
  } else if (type == 'string') {
    isInt = false;
  } else if (podType == PodType.boolean) {
    _ignored<String>(json, 'type');
    return null;
  } else if (type == null) {
    final nonNullForInference = enumValues.where((e) => e != null);
    isInt =
        nonNullForInference.isNotEmpty &&
        nonNullForInference.every((e) => e is int);
  } else {
    _unimplemented(json, 'enumValues for type=$type');
  }
  // TODO(eseidel): null should only be valid when enum is nullable.
  final nonNullValues = enumValues.where((e) => e != null).toList();
  final xEnumDescriptions = _optionalList<dynamic>(json, 'x-enum-descriptions');
  List<String>? enumDescriptions;
  if (xEnumDescriptions != null) {
    if (xEnumDescriptions.length != nonNullValues.length) {
      _error(
        json,
        'x-enum-descriptions length (${xEnumDescriptions.length}) must '
        'match enum length (${nonNullValues.length})',
      );
    }
    if (xEnumDescriptions.any((e) => e is! String)) {
      _error(
        json,
        'x-enum-descriptions must be a list of strings: $xEnumDescriptions',
      );
    }
    enumDescriptions = xEnumDescriptions.cast<String>();
  }
  if (isInt) {
    if (nonNullValues.any((e) => e is! int)) {
      _error(json, 'enumValues must be a list of integers: $enumValues');
    }
    final typedEnumValues = nonNullValues.cast<int>();
    int? typedDefaultValue;
    if (defaultValue != null) {
      final candidate = _unwrapSingletonDefault(json, defaultValue);
      if (candidate is int && nonNullValues.contains(candidate)) {
        typedDefaultValue = candidate;
      } else {
        _warn(
          json,
          'Ignoring default=$defaultValue: not one of the enum values '
          '$nonNullValues',
        );
      }
    }
    return SchemaIntEnum(
      common: common,
      defaultValue: typedDefaultValue,
      enumValues: typedEnumValues,
      enumDescriptions: enumDescriptions,
      // A plain `enum:` list carries no per-member names; render derives
      // them from the values.
      enumNames: null,
    );
  }
  if (nonNullValues.any((e) => e is! String)) {
    _error(json, 'enumValues must be a list of strings: $enumValues');
  }
  final typedEnumValues = nonNullValues.cast<String>();
  String? typedDefaultValue;
  if (defaultValue != null) {
    final candidate = _unwrapSingletonDefault(json, defaultValue);
    if (nonNullValues.contains(candidate)) {
      typedDefaultValue = candidate as String;
    } else if (nonNullValues.contains(candidate.toString())) {
      // In GitHub spec, they have a defaultValue of true (boolean) despite the
      // enum being strings (with 'true' as a valid value), so we convert the
      // default value to the enum type before checking if it's valid.
      typedDefaultValue = candidate.toString();
    } else {
      _warn(
        json,
        'Ignoring default=$defaultValue: not one of the enum values '
        '$nonNullValues',
      );
    }
  }
  return SchemaStringEnum(
    common: common,
    defaultValue: typedDefaultValue,
    enumValues: typedEnumValues,
    enumDescriptions: enumDescriptions,
    enumNames: null,
  );
}

Schema? _handleNumberTypes(
  MapContext json, {
  required String? type,
  required CommonProperties common,
}) {
  if (type == 'integer') {
    final min = _resolveBound<int>(
      json,
      inclusiveKey: 'minimum',
      exclusiveKey: 'exclusiveMinimum',
      readNumber: _optionalInt,
    );
    final max = _resolveBound<int>(
      json,
      inclusiveKey: 'maximum',
      exclusiveKey: 'exclusiveMaximum',
      readNumber: _optionalInt,
    );
    return SchemaInteger(
      common: common,
      defaultValue: _optionalInt(json, 'default'),
      minimum: min.inclusive,
      maximum: max.inclusive,
      exclusiveMinimum: min.exclusive,
      exclusiveMaximum: max.exclusive,
      multipleOf: _optionalInt(json, 'multipleOf'),
    );
  }
  if (type == 'number') {
    final min = _resolveBound<double>(
      json,
      inclusiveKey: 'minimum',
      exclusiveKey: 'exclusiveMinimum',
      readNumber: _optionalDouble,
    );
    final max = _resolveBound<double>(
      json,
      inclusiveKey: 'maximum',
      exclusiveKey: 'exclusiveMaximum',
      readNumber: _optionalDouble,
    );
    return SchemaNumber(
      common: common,
      defaultValue: _optionalDouble(json, 'default'),
      minimum: min.inclusive,
      maximum: max.inclusive,
      exclusiveMinimum: min.exclusive,
      exclusiveMaximum: max.exclusive,
      multipleOf: _optionalDouble(json, 'multipleOf'),
    );
  }
  return null;
}

class TypeAndFormat {
  TypeAndFormat({
    required this.format,
    required this.podType,
    required this.isNullable,
    this.type,
    this.types,
  });

  final String? type;
  final List<String>? types;
  final String? format;
  final PodType? podType;
  final bool isNullable;
}

@visibleForTesting
TypeAndFormat parseTypeAndFormat(MapContext json) {
  final typeValue = _optional<dynamic>(json, 'type');

  final validTypes = {
    'null',
    'boolean',
    'integer',
    'number',
    'string',
    'array',
    'object',
  };

  String? parseFormat({required String type, required String? format}) {
    if (format == null) {
      return null;
    }
    final expectedFormats = {
      'string': {
        'binary',
        // OAS 3.0 / JSON Schema draft-4 for base64-encoded bytes. Dropped
        // in 3.1 in favor of `contentEncoding: base64`; both are handled
        // and converge on the same schema node.
        'byte',
        'date-time',
        'uri',
        'uri-template',
        'email',
        'uuid',
        'date',
        'time',
      },
    };
    final expected = expectedFormats[type];
    if (expected == null || !expected.contains(format)) {
      final ignoredFormats = {
        // We don't explicitly support any number formats yet.
        'number': {'float', 'double'},
        'integer': {'int32', 'int64'},
      };
      final ignored = ignoredFormats[type];
      if (ignored != null && ignored.contains(format)) {
        _ignored<String>(json, 'format');
      } else {
        // Unknown format on a recognized base type — generated code
        // falls back to the plain Dart type (`int`/`String`/...) which
        // is correct for almost every real-world non-standard format
        // (`timestamp`, `repo.nwo`, ...). Log as detail rather than
        // warn: there's nothing the user can act on, and surfacing
        // every spec-author idiosyncrasy at WARN level buries the
        // diagnostics that actually matter.
        logger.detail(
          'Ignoring unknown $type format: $format in ${json.pointer}',
        );
      }
    }
    return format;
  }

  PodType? determinePodType({required String type, required String? format}) {
    if (type == 'boolean') {
      return PodType.boolean;
    }
    if (type == 'string') {
      if (format == 'date-time') {
        return PodType.dateTime;
      }
      if (format == 'uri') {
        return PodType.uri;
      }
      if (format == 'uri-template') {
        return PodType.uriTemplate;
      }
      if (format == 'email') {
        return PodType.email;
      }
      if (format == 'uuid') {
        return PodType.uuid;
      }
      // 'date' (RFC 3339 full-date) is handled ahead of this as SchemaDate —
      // it renders as the generated `Date` value class, not a pod.
      // 'time' (RFC 3339 partial-time, e.g. 14:30:00) has no clean Dart
      // type — DateTime requires a date. Leave it as a plain string so
      // top-level named schemas become String-backed extension-type
      // newtypes.
    }
    return null;
  }

  TypeAndFormat toParsedType(String type, {bool isNullable = false}) {
    if (!validTypes.contains(type)) {
      _error(json, 'Unknown type: $type');
    }

    final format = parseFormat(
      type: type,
      format: _optional<String>(json, 'format'),
    );
    final podType = determinePodType(type: type, format: format);
    return TypeAndFormat(
      type: type,
      format: format,
      podType: podType,
      isNullable: isNullable,
    );
  }

  TypeAndFormat toParsedTypes(Set<String> types, {bool isNullable = false}) {
    if (types.length == 1) {
      return toParsedType(types.first, isNullable: isNullable);
    }
    return TypeAndFormat(
      types: types.toList(),
      format: null,
      podType: null,
      isNullable: isNullable,
    );
  }

  if (typeValue == null) {
    return TypeAndFormat(format: null, podType: null, isNullable: false);
  }

  if (typeValue is List) {
    for (final t in typeValue) {
      if (t is! String) {
        _error(json, 'type array must contain only strings: $typeValue');
      }
    }
    // Ignore duplicates types.
    final types = typeValue.cast<String>().toSet();

    final isNullable = types.contains('null');
    if (isNullable) {
      types.remove('null');
    }
    return toParsedTypes(types, isNullable: isNullable);
  }
  if (typeValue is! String) {
    _error(json, 'type must be a string or array: $typeValue');
  }
  return toParsedType(typeValue);
}

Schema _createCorrectSchemaSubtype(MapContext json) {
  final typeAndFormat = parseTypeAndFormat(json);
  final type = typeAndFormat.type;
  final podType = typeAndFormat.podType;

  final nullable = _optional<bool>(json, 'nullable') ?? false;
  final common = CommonProperties(
    pointer: json.pointer,
    snakeName: json.snakeName,
    title: _optional<String>(json, 'title'),
    description: _optional<String>(json, 'description'),
    isDeprecated: _optional<bool>(json, 'deprecated') ?? false,
    // OpenAPI 3.0.0 has a nullable property.
    // https://spec.openapis.org/oas/v3.0.0#schemaObject
    // 3.1.0 does not and recommends type=['string', 'null'] instead
    // https://spec.openapis.org/oas/v3.1.0#schemaObject
    // We support both modes.
    nullable: nullable || typeAndFormat.isNullable,
    example: _optional<dynamic>(json, 'example'),
    examples: _optional<List<dynamic>>(json, 'examples'),
  );

  // An explicit `oneOf`/`anyOf` wins over the multi-type type-array
  // expansion below. When a schema declares both — `type: [a, b]`
  // alongside an `oneOf: [...]` — the explicit union is strictly
  // more specific: it can carry per-variant `format`, `description`,
  // `items`, `enum`, etc., and OpenAPI semantics treat the type-array
  // as shorthand for a structurally-equivalent union. If the type-
  // array path wins, the explicit union is silently dropped along
  // with all its per-variant detail.
  //
  // `allOf` is intentionally not short-circuited here: it's AND, not
  // OR, so it doesn't substitute for a multi-type union the way
  // `oneOf`/`anyOf` do. The fallback below still routes it through
  // `_handleCollectionTypes`.
  if (json.containsKey('oneOf') || json.containsKey('anyOf')) {
    final union = _handleCollectionTypes(
      json,
      common: common,
      typeAndFormat: typeAndFormat,
    );
    if (union != null) {
      return union;
    }
  }

  if (typeAndFormat.types != null) {
    // Multiple types are treated as a oneOf schema, just parsing the same
    // root scheme object multiple times.
    final schemas = <SchemaRef>[];
    for (final type in typeAndFormat.types!) {
      // The 'null' type has already been removed by the time we get here.
      // These are necessarily not two objects, unlike typical oneOf schemas.
      // Most commonly these are one object and an array of objects.
      // or two different pod types.
      // This could be an explicitly named type
      final fakeJson = json.fakeChildAsMap(
        snakeName: type,
        value: {'type': type},
      );
      final schema = _createCorrectSchemaSubtype(fakeJson);
      schemas.add(SchemaRef.object(schema, json.pointer));
    }
    return SchemaOneOf(
      common: common,
      schemas: schemas,
      discriminator: null,
    );
  }

  // Fallback handling for the rare allOf-only / oneOf-with-no-result
  // shapes that didn't take the early branch above. The early gate
  // covers the common case (oneOf/anyOf at any slot, with or without
  // a parallel `type:` array); this catches allOf, plus the
  // constraint-only oneOf/anyOf shapes that return null and fall
  // through to plain object parsing.
  final collectionType = _handleCollectionTypes(
    json,
    common: common,
    typeAndFormat: typeAndFormat,
  );
  if (collectionType != null) {
    return collectionType;
  }

  if (type == 'null') {
    return SchemaNull(common: common);
  }

  if (type == 'string') {
    // `contentEncoding` is the OpenAPI 3.1 / JSON-Schema 2020-12 encoding
    // keyword; read it up front since both the binary and base64 branches
    // below pair it with the equivalent 3.0 `format`.
    final contentEncoding = _optional<String>(json, 'contentEncoding');
    // `contentMediaType` (e.g. `image/png`) is metadata about the bytes'
    // MIME type. Not actionable on the Dart side beyond documentation;
    // consume to suppress the unused-key warning.
    _ignored<String>(json, 'contentMediaType');

    // `format: binary` (OAS 3.0) and `contentEncoding: binary` (OAS 3.1 /
    // 2020-12) both mark a raw-bytes string: a file upload in a multipart
    // request body, or a `Uint8List` response sourced from
    // `response.bodyBytes`. They converge on one node so a 3.1 spec gets
    // the same `Uint8List` a 3.0 spec does.
    if (typeAndFormat.format == 'binary' || contentEncoding == 'binary') {
      return SchemaBinary(common: common);
    }
    // `format: date` (RFC 3339 full-date) is a calendar day with no time or
    // timezone. It renders as the generated `Date` value class rather than a
    // `DateTime` (which is a lossy instant); see doc/date_type.md.
    if (typeAndFormat.format == 'date') {
      return SchemaDate(
        common: common,
        defaultValue: _optional<String>(json, 'default'),
      );
    }
    // `format: byte` (OAS 3.0 / draft-4) and `contentEncoding: base64`
    // (OAS 3.1 / 2020-12) are the same statement in two spec versions: a
    // JSON string whose value is base64-encoded binary. A spec that sets
    // both is accepted rather than flagged — they agree, and belt-and-braces
    // declarations are common in specs that straddle versions.
    if (typeAndFormat.format == 'byte' || contentEncoding == 'base64') {
      return SchemaBase64Bytes(common: common);
    }
    // Any other `contentEncoding` (base16, quoted-printable, 7bit, …) we
    // don't model: keep the wire-shape `String` and detail-log at -v.
    if (contentEncoding != null) {
      logger.detail(
        'Ignoring: contentEncoding=$contentEncoding (String) in '
        '${json.pointer}',
      );
    }
  }

  final defaultValue = _optional<dynamic>(json, 'default');
  final enumSchema = _handleEnum(
    json: json,
    typeAndFormat: typeAndFormat,
    defaultValue: defaultValue,
    common: common,
  );
  if (enumSchema != null) {
    return enumSchema;
  }

  if (podType != null) {
    return SchemaPod(common: common, type: podType, defaultValue: defaultValue);
  }

  if (type == 'string') {
    return SchemaString(
      common: common,
      defaultValue: _optional<String>(json, 'default'),
      maxLength: _optional<int>(json, 'maxLength'),
      minLength: _optional<int>(json, 'minLength'),
      pattern: _optional<String>(json, 'pattern'),
    );
  }

  final schema = _handleNumberTypes(json, type: type, common: common);
  if (schema != null) {
    return schema;
  }

  if (type == 'array') {
    // Omitting items is the same effect as an empty object.
    // https://json-schema.org/draft/2020-12/json-schema-core#section-10.3.1.2-4
    final items =
        _optionalMap(json, 'items') ??
        json.fakeChildAsMap(snakeName: 'items', value: {});
    const innerName = 'inner'; // Matching OpenAPI.
    final itemSchema = parseSchemaOrRef(items.addSnakeName(innerName));
    // `required` is an object-level keyword in JSON Schema / OpenAPI.
    // On an array schema it's spec-legal but meaningless; spec authors
    // occasionally misplace it (seen in github's
    // `dependency-graph-spdx-sbom.sbom.{packages,relationships}`).
    // Detail-log so the verbose-log mining workflow surfaces the
    // misplacement to anyone curious; no behavior to act on.
    _ignored<List<dynamic>>(json, 'required');
    return SchemaArray(
      common: common,
      defaultValue: defaultValue,
      items: itemSchema,
      maxItems: _optional<int>(json, 'maxItems'),
      minItems: _optional<int>(json, 'minItems'),
      uniqueItems: _optional<bool>(json, 'uniqueItems') ?? false,
    );
  }

  final additionalPropertiesSchema = _handleAdditionalProperties(json);

  // Object-size validation we don't enforce. Detail-log so the
  // verbose-log mining workflow can find specs that lean on these
  // constraints; no behavior to act on.
  _ignored<int>(json, 'maxProperties');
  _ignored<int>(json, 'minProperties');

  final propertiesJson = _optionalMap(json, 'properties');
  if (propertiesJson == null) {
    if (additionalPropertiesSchema == null) {
      return SchemaUnknown(common: common);
    }
    return _mapSchema(
      json,
      common: common,
      valueSchema: additionalPropertiesSchema,
    );
  }
  // The difference between an empty object and an unknown object is subtle
  // and probably not correct.  GitHub has an explicitly empty object, which is
  // used either an an alternative to nullable, or as a way to indicate an
  // empty response.  Those aren't "dynamic" types, but unclear if they need
  // a separate class either.
  if (propertiesJson.keys.isEmpty) {
    // An explicit `properties: {}` alongside an `additionalProperties` schema
    // is a map — arbitrary string keys, no named fields — exactly like the
    // omitted-`properties` case above. Route it the same way so the two
    // spellings agree; an untyped `additionalProperties` (`true` / `{}`)
    // gives a `SchemaUnknown` value schema, i.e. `Map<String, dynamic>`.
    // Without an `additionalProperties` schema it stays an empty object
    // (GitHub's nullable / empty-response marker; see above).
    if (additionalPropertiesSchema != null) {
      return _mapSchema(
        json,
        common: common,
        valueSchema: additionalPropertiesSchema,
      );
    }
    return SchemaEmptyObject(common: common);
  }

  final properties = <String, SchemaRef>{};
  final constProperties = <String, Object>{};
  for (final name in propertiesJson.json.keys) {
    // Property names are arbitrary author strings — kebab (`saturated-fat`),
    // dotted, or spaced keys all appear in real specs. `toSnakeCase` sanitizes
    // every casing into a valid snake identifier so the synthesized inline-
    // object type name (`camelFromSnake(snakeName)`) stays a legal Dart
    // identifier. `snakeFromCamel` alone leaves a hyphen intact, producing e.g.
    // `NutrientLevelsSaturated-fat`, which fails `dart format`.
    final snakeName = toSnakeCase(name);
    final childContext = propertiesJson
        .childAsMap(name)
        .addSnakeName(snakeName);
    final constValue = _constTagValue(childContext);
    if (constValue != null) {
      // We consume the pinning `enum`/`const` as a discriminator tag, so
      // mark it used before parsing the property (the allOf branch would
      // otherwise leave it to `_warnUnused`). Multi-value narrowings
      // aren't captured, so their `enum` still surfaces at -v — the
      // honest signal for the restricted-view work in issue #235.
      if (childContext.json.containsKey('enum')) childContext.markUsed('enum');
      if (childContext.json.containsKey('const')) {
        childContext.markUsed('const');
      }
      constProperties[name] = constValue;
      properties[name] = parseSchemaOrRef(childContext);
      continue;
    }
    // A property whose schema is a single-value scalar — a bare lone `const`
    // (envelope markers like Stripe's `object: {const: "list"}`, issue #240)
    // or a single-value `enum: [X]` (github tags its discriminated-union
    // variants this way ~261 times, `Creation.type = {enum: ['creation']}`,
    // issue #239) — admits exactly one legal value: the same fixed-value
    // semantic as the `allOf: [{$ref: E}]` idiom above ([_constTagValue]),
    // just a different spelling. Record the value and parse the property as
    // its plain scalar (the `const`/`enum` stripped so `_handleEnum` doesn't
    // mint a throwaway single-value enum type + file).
    //
    // Render then splits on `required`: a *required* value is always present,
    // so it collapses to a fixed const getter; an *optional* one is "absent,
    // or that value" and stays an omittable plain-scalar field, with the
    // constant exposed as a `static const` for callers who want to set it
    // (an always-serialized getter would wrongly force it into every
    // payload). See [RenderObject.rendersAsConstGetter] and
    // [RenderObject.staticConstantContexts].
    final fixedValue =
        _loneScalarConstValue(childContext) ??
        _singleValueEnumScalar(childContext);
    if (fixedValue != null) {
      final stripKey = childContext.json.containsKey('const')
          ? 'const'
          : 'enum';
      constProperties[name] = fixedValue;
      final stripped = Map<String, dynamic>.of(childContext.json)
        ..remove(stripKey);
      properties[name] = parseSchemaOrRef(
        propertiesJson
            .fakeChildAsMap(snakeName: name, value: stripped)
            .addSnakeName(snakeName),
      );
      continue;
    }
    properties[name] = parseSchemaOrRef(childContext);
  }

  // Some of these probably apply to enum and array types.
  _ignored<bool>(json, 'readOnly');
  _ignored<bool>(json, 'writeOnly');
  _ignored<dynamic>(json, 'discriminator');
  _ignored<dynamic>(json, 'xml');
  _ignored<dynamic>(json, 'externalDocs');

  final declaredRequired = _optionalList<String>(json, 'required') ?? [];
  // OpenAPI lets `required` name any string, but the only meaningful
  // names are properties this object actually declares. Spec-author
  // typos sneak in (github's `package-version-metadata-docker` lists
  // `required: [tags]` for a property called `tag`); silently
  // honoring those produces a class whose constructor demands a
  // field that doesn't exist in the schema, plus broken downstream
  // tests. Drop unknown names and warn — the spec author can fix
  // the typo.
  final requiredProperties = <String>[];
  for (final name in declaredRequired) {
    if (properties.containsKey(name)) {
      requiredProperties.add(name);
    } else {
      _warn(
        json,
        "'required' lists '$name' but no such property is declared",
      );
    }
  }

  return SchemaObject(
    common: common,
    properties: properties,
    requiredProperties: requiredProperties,
    additionalProperties: additionalPropertiesSchema,
    defaultValue: defaultValue,
    constProperties: constProperties,
  );
}

/// Detects the OpenAPI-3.0 "pinned enum" idiom on a property:
/// `allOf: [{$ref: E}]` wrapping a single reference, with a sibling
/// single-value `enum` (or `const`). This spells "a value of enum E
/// fixed to one member" — the property still parses/resolves as the
/// plain `E` ref (so its field renders as `E`), but the fixed value is
/// a discriminator tag. Returns that constant (`int`/`String`), or null
/// when the property isn't this shape.
///
/// A multi-value `enum` is a restricted *view* of E, not a single tag
/// (issue #235); it returns null here. The `allOf` wrapper is required —
/// a bare inline `enum` already resolves to a `SchemaEnum` the dispatch
/// pass reads directly, so it needs no separate record.
Object? _constTagValue(MapContext json) {
  final raw = json.json;
  final allOf = raw['allOf'];
  if (allOf is! List || allOf.length != 1) return null;
  final only = allOf.first;
  if (only is! Map || !only.containsKey(r'$ref')) return null;
  final enumValues = raw['enum'];
  final Object? value;
  if (enumValues is List) {
    if (enumValues.length != 1) return null;
    value = enumValues.first;
  } else if (raw.containsKey('const')) {
    value = raw['const'];
  } else {
    return null;
  }
  // Only scalar int/string tags dispatch cleanly; anything else isn't a
  // usable discriminator value.
  return (value is int || value is String) ? value : null;
}

/// Detects a bare inline lone scalar `const` on a property — `{type:
/// string, const: "list"}` or `{type: integer, const: 5}` — the shape
/// [_handleEnum] would otherwise collapse into a single-value enum type
/// and file. Returns the fixed value (`int`/`String`) for the containing
/// object to record in [SchemaObject.constProperties], or null when the
/// property isn't this shape.
///
/// Deliberately narrow, so the strip-to-scalar it drives can't misfire:
///
/// - Requires an explicit `type: string`/`type: integer` with a matching
///   scalar value. A typeless `const` (Discord's `{const: N}` oneOf
///   variants, where `type` sits on the parent) keeps its enum spelling —
///   [_handleEnum]'s value inference and the discriminator pass still need
///   it — and there'd be no scalar type to strip down to anyway.
/// - Excludes the `allOf: [{$ref: E}]` idiom ([_constTagValue] owns it;
///   there the value belongs to a *named* enum) and `$ref` properties.
/// - Excludes `enum:` ([_singleValueEnumScalar] is its single-value-`enum`
///   sibling) and `format:` (which would parse to a non-scalar like
///   `Uint8List`/`DateTime`, not the plain literal a const getter emits).
Object? _loneScalarConstValue(MapContext json) {
  final raw = json.json;
  if (!raw.containsKey('const')) return null;
  if (raw.containsKey('allOf') ||
      raw.containsKey(r'$ref') ||
      raw.containsKey('enum') ||
      raw.containsKey('format')) {
    return null;
  }
  final type = raw['type'];
  final value = raw['const'];
  if (type == 'string' && value is String) return value;
  if (type == 'integer' && value is int) return value;
  return null;
}

/// Detects a bare single-value scalar `enum: [X]` on a property — `{type:
/// string, enum: ['creation']}` or `{type: integer, enum: [5]}` — the shape
/// [_handleEnum] would otherwise collapse into a single-value enum type and
/// file. Returns the fixed value (`int`/`String`) for the containing object
/// to record in [SchemaObject.constProperties], or null when the property
/// isn't this shape.
///
/// The single-`enum` sibling of [_loneScalarConstValue] (`const: X`), sharing
/// its guards so the strip-to-scalar it drives can't misfire:
///
/// - Requires an explicit `type: string`/`type: integer` with a matching
///   scalar value.
/// - Excludes the `allOf: [{$ref: E}]` idiom ([_constTagValue] owns it;
///   there the value belongs to a *named* enum) and `$ref` properties.
/// - Excludes `const:` (which can't co-occur with `enum:`, but guard anyway)
///   and `format:` (which would parse to a non-scalar like
///   `Uint8List`/`DateTime`, not the plain literal a const getter emits).
Object? _singleValueEnumScalar(MapContext json) {
  final raw = json.json;
  final enumValues = raw['enum'];
  if (enumValues is! List || enumValues.length != 1) return null;
  if (raw.containsKey('allOf') ||
      raw.containsKey(r'$ref') ||
      raw.containsKey('const') ||
      raw.containsKey('format')) {
    return null;
  }
  final type = raw['type'];
  final value = enumValues.first;
  if (type == 'string' && value is String) return value;
  if (type == 'integer' && value is int) return value;
  return null;
}

/// Parse a schema from a json object.
Schema parseSchema(MapContext json) {
  _refNotExpected(json);
  final schema = _createCorrectSchemaSubtype(json);
  // Catch-all for keys placed where the chosen schema shape doesn't
  // act on them. `_ignoreIfUnused` no-ops when an earlier code path
  // already consumed the key (e.g. `additionalProperties` on an
  // object → `_handleAdditionalProperties` consumed it; this is a
  // no-op). It detail-logs only when the key really is misplaced
  // (e.g. `additionalProperties` on a string).
  //   - `minItems`/`maxItems` inside an items schema (these belong on
  //     the parent array, not the items schema; seen in github's
  //     `webhook-meta-deleted.hook.events.items`).
  //   - `additionalProperties: true` on a non-object (seen in
  //     github's `hook-delivery.response.payload` with
  //     `type: [string, null]`).
  _ignoreIfUnused<int>(json, 'minItems');
  _ignoreIfUnused<int>(json, 'maxItems');
  _ignoreIfUnused<dynamic>(json, 'additionalProperties');
  _warnUnused(json);
  return schema;
}

SchemaRef? _maybeSchemaOrRef(MapContext? json) {
  if (json == null) {
    return null;
  }
  return parseSchemaOrRef(json);
}

/// Parse a schema or a reference to a schema.
/// https://spec.openapis.org/oas/v3.0.0#schemaObject
/// https://spec.openapis.org/oas/v3.0.0#relative-references-in-urls
SchemaRef parseSchemaOrRef(MapContext json) {
  if (json.containsKey(r'$ref')) {
    final ref = json[r'$ref'] as String;
    _warnUnused(json);
    return SchemaRef.ref(ref, json.pointer);
  }
  return SchemaRef.object(parseSchema(json), json.pointer);
}

RefOr<RequestBody>? maybeRequestBodyOrRef(MapContext? json) {
  if (json == null) {
    return null;
  }
  return parseRequestBodyOrRef(json);
}

/// Parse a schema or a reference to a schema.
/// https://spec.openapis.org/oas/v3.0.0#schemaObject
/// https://spec.openapis.org/oas/v3.0.0#relative-references-in-urls
RefOr<RequestBody> parseRequestBodyOrRef(MapContext json) {
  if (json.containsKey(r'$ref')) {
    final ref = json[r'$ref'] as String;
    _warnUnused(json);
    return RefOr<RequestBody>.ref(ref, json.pointer);
  }
  final body = parseRequestBody(json);
  return RefOr<RequestBody>.object(body, json.pointer);
}

RequestBody parseRequestBody(MapContext json) {
  _refNotExpected(json);
  final content = _parseMediaTypes(_requiredMap(json, 'content'));
  final description = _optional<String>(json, 'description');

  final isRequired = json['required'] as bool? ?? false;
  _warnUnused(json);
  return RequestBody(
    pointer: json.pointer,
    isRequired: isRequired,
    description: description,
    content: content,
  );
}

String _snakeNameForOperation(MapContext operationJson, String path) {
  final operationId = _optional<String>(operationJson, 'operationId');
  if (operationId != null) {
    // Some specs, including GitHub, put the full path in the operationId.
    return toSnakeCase(operationId.replaceAll('/', '_'));
  }
  return toSnakeCase(Uri.parse(path).pathSegments.last);
}

Operation parseOperation(MapContext operationJson, String path) {
  _refNotExpected(operationJson);
  final snakeName = _snakeNameForOperation(operationJson, path);
  final context = operationJson.addSnakeName(snakeName);

  final summary = _optional<String>(context, 'summary');
  final description = _optional<String>(context, 'description');
  final tags = _optionalList<String>(context, 'tags') ?? [];
  final parameters = _mapOptionalList(
    context,
    'parameters',
    (child, index) =>
        parseParameterOrRef(child.addSnakeName('parameter$index')),
  );
  final requestBody = maybeRequestBodyOrRef(
    _optionalMap(context, 'requestBody')?.addSnakeName('request'),
  );
  final deprecated = _optional<bool>(context, 'deprecated') ?? false;
  final responses = parseResponses(_requiredMap(context, 'responses'));
  // Operation does not mention 'responses' as being required, but
  // the Responses object says at least one response is required.
  if (responses.isEmpty) {
    _error(context, 'Responses are required');
  }
  // Distinguish "security absent" (inherit global) from "security: []"
  // (explicit no-auth override). _mapOptionalList collapses both to [];
  // check for key presence separately so the resolver can tell them apart.
  final securityRequirements = context['security'] == null
      ? null
      : _mapOptionalList<SecurityRequirement>(
          context,
          'security',
          (child, _) => parseSecurityRequirement(child),
        );
  return Operation(
    pointer: operationJson.pointer,
    tags: tags,
    snakeName: snakeName,
    summary: summary,
    description: description,
    parameters: parameters,
    requestBody: requestBody,
    responses: responses,
    deprecated: deprecated,
    securityRequirements: securityRequirements,
  );
}

Map<Method, Operation> _parseOperations(MapContext context, String path) {
  _refNotExpected(context);
  final operations = <Method, Operation>{};
  for (final method in Method.values) {
    final methodValue = _optionalMap(context, method.key);
    if (methodValue == null) {
      continue;
    }
    final operation = parseOperation(methodValue, path);
    operations[method] = operation;
  }
  return operations;
}

/// Parse a path item from a json object.
/// https://spec.openapis.org/oas/v3.1.0#path-item-object
PathItem parsePathItem({
  required MapContext pathItemJson,
  required String path,
}) {
  _refNotExpected(pathItemJson);
  // TODO(eseidel): Support $ref
  // if (pathItemJson.containsKey(r'$ref')) {
  //   final ref = pathItemJson[r'$ref'] as String;
  //   _warnUnused(pathItemJson);
  //   return RefOr<PathItem>.ref(ref);
  // }
  final summary = _optional<String>(pathItemJson, 'summary');
  final parameters = _mapOptionalList(
    pathItemJson,
    'parameters',
    (child, index) =>
        parseParameterOrRef(child.addSnakeName('parameter$index')),
  );

  final description = _optional<String>(pathItemJson, 'description');
  final operations = _parseOperations(pathItemJson, path);

  _warnUnused(pathItemJson);
  return PathItem(
    pointer: pathItemJson.pointer,
    path: path,
    summary: summary,
    description: description,
    parameters: parameters,
    operations: operations,
  );
}

Map<String, MediaType>? _maybeMediaTypes(MapContext? contentJson) {
  if (contentJson == null) {
    return null;
  }
  return _parseMediaTypes(contentJson);
}

Map<String, MediaType> _parseMediaTypes(MapContext contentJson) {
  _refNotExpected(contentJson);
  final mediaTypes = <String, MediaType>{};
  for (final mimeType in contentJson.keys) {
    final schema = parseSchemaOrRef(
      contentJson.childAsMap(mimeType).childAsMap('schema'),
    );
    mediaTypes[mimeType] = MediaType(schema: schema);
  }
  if (mediaTypes.isEmpty) {
    _error(contentJson, 'Empty content');
  }
  return mediaTypes;
}

RefOr<Response> parseResponseOrRef(MapContext json) {
  final ref = _optional<String>(json, r'$ref');
  if (ref != null) {
    _warnUnused(json);
    return RefOr<Response>.ref(ref, json.pointer);
  }
  return RefOr<Response>.object(_parseResponse(json), json.pointer);
}

Map<String, RefOr<Header>>? _parseHeaders(MapContext? headersJson) {
  if (headersJson == null) {
    return null;
  }
  final headers = <String, RefOr<Header>>{};
  for (final name in headersJson.keys) {
    headers[name] = parseHeaderOrRef(headersJson.childAsMap(name));
  }
  return headers;
}

Response _parseResponse(MapContext responseJson) {
  _refNotExpected(responseJson);
  final description = _required<String>(responseJson, 'description');
  final headers = _parseHeaders(_optionalMap(responseJson, 'headers'));
  _ignored<dynamic>(responseJson, 'links');
  final content = _optionalMap(responseJson, 'content');
  final mediaTypes = _maybeMediaTypes(content?.addSnakeName('response'));
  return Response(
    pointer: responseJson.pointer,
    description: description,
    content: mediaTypes,
    headers: headers,
  );
}

/// Matches a range status code like `2XX`, `4XX`, etc. Capturing group 1
/// is the leading digit (1-5).
final _rangeCodeRegex = RegExp(r'^([1-5])XX$');

/// Maps the leading digit of an `NXX` range to the corresponding
/// [StatusCodeRange] variant.
const Map<int, StatusCodeRange> _rangesByLeadingDigit = {
  1: StatusCodeRange.informational,
  2: StatusCodeRange.success,
  3: StatusCodeRange.redirect,
  4: StatusCodeRange.clientError,
  5: StatusCodeRange.serverError,
};

Responses parseResponses(MapContext responsesJson) {
  final responseCodes = responsesJson.keys.toList();

  RefOr<Response>? defaultResponse;
  if (responseCodes.remove('default')) {
    defaultResponse = parseResponseOrRef(
      responsesJson.childAsMap('default').addSnakeName('default'),
    );
  }

  final responses = <int, RefOr<Response>>{};
  final rangeResponses = <StatusCodeRange, RefOr<Response>>{};
  for (final responseCode in responseCodes) {
    final responseJson = responsesJson
        .childAsMap(responseCode)
        .addSnakeName(responseCode);
    final rangeMatch = _rangeCodeRegex.firstMatch(responseCode);
    if (rangeMatch != null) {
      final range = _rangesByLeadingDigit[int.parse(rangeMatch.group(1)!)]!;
      rangeResponses[range] = parseResponseOrRef(responseJson);
      continue;
    }
    final responseCodeInt = int.tryParse(responseCode);
    if (responseCodeInt == null) {
      _error(responsesJson, 'Invalid response code: $responseCode');
    }
    responses[responseCodeInt] = parseResponseOrRef(responseJson);
  }
  _warnUnused(responsesJson);
  return Responses(
    responses: responses,
    rangeResponses: rangeResponses,
    defaultResponse: defaultResponse,
  );
}

Map<String, RefOr<T>> _parseComponent<T extends Parseable>(
  MapContext json,
  String key,
  RefOr<T> Function(MapContext) parse, {
  String? extraSnakeName,
}) {
  _refNotExpected(json);
  final valuesJson = _optionalMap(json, key);
  final values = <String, RefOr<T>>{};
  if (valuesJson != null) {
    for (final name in valuesJson.keys) {
      final snakeName = toSnakeCase(name);
      var childContext = valuesJson.childAsMap(name).addSnakeName(snakeName);
      if (extraSnakeName != null) {
        childContext = childContext.addSnakeName(extraSnakeName);
      }
      final value = parse(childContext);
      values[name] = value;
    }
    _warnUnused(valuesJson);
  }
  return values;
}

ApiKeyLocation _parseApiKeyLocation(MapContext context, String location) {
  switch (location) {
    case 'header':
      return ApiKeyLocation.header;
    case 'query':
      return ApiKeyLocation.query;
    case 'cookie':
      return ApiKeyLocation.cookie;
    default:
      _error(context, 'Unknown API key location: $location');
  }
}

SecurityScheme parseSecurityScheme(String name, MapContext json) {
  final type = _required<String>(json, 'type');
  final description = _optional<String>(json, 'description');
  final pointer = json.pointer;
  switch (type) {
    case 'apiKey':
      final inLocation = _parseApiKeyLocation(
        json,
        _required<String>(json, 'in'),
      );
      return ApiKeySecurityScheme(
        pointer: pointer,
        name: name,
        description: description,
        keyName: _required<String>(json, 'name'),
        inLocation: inLocation,
      );
    case 'http':
      return HttpSecurityScheme(
        pointer: pointer,
        name: name,
        description: description,
        scheme: _required<String>(json, 'scheme'),
        bearerFormat: _optional<String>(json, 'bearerFormat'),
      );
    case 'oauth2':
    case 'openIdConnect':
    // OpenAPI 3.0 uses `openIdConnect` in the schema text, but the
    // majority of real-world specs (and several 3.1 examples) use the
    // alternate-cased `openIDConnect`. Accept both.
    case 'openIDConnect':
      // Pass-through: at the wire level both schemes deliver an opaque
      // bearer token in the `Authorization` header. We don't generate
      // any flow logic — token acquisition (OIDC discovery, the OAuth2
      // grants, refresh) stays the caller's responsibility — but we DO
      // generate the same `authRequest:` plumbing as `http` + `bearer`
      // so the caller's existing secret resolver can supply the token.
      // mutualTLS isn't bearer-shaped at all, so it stays unsupported.
      return HttpSecurityScheme(
        pointer: pointer,
        name: name,
        description: description,
        scheme: 'bearer',
        bearerFormat: null,
      );
    case 'mutualTLS':
      _warn(
        json,
        "Security scheme '$name' has type '$type', which isn't supported "
        'yet. Operations requiring it will be generated without an '
        'authRequest — override ApiClient.resolveAuth or set '
        'defaultHeaders to inject auth yourself',
      );
      return UnsupportedSecurityScheme(
        pointer: pointer,
        name: name,
        description: description,
        type: type,
      );
    default:
      _error(json, 'Unsupported security scheme type: $type');
  }
}

List<SecurityScheme> _parseSecuritySchemes(MapContext? securitySchemesJson) {
  if (securitySchemesJson == null) {
    return [];
  }
  final schemes = <SecurityScheme>[];
  for (final name in securitySchemesJson.keys) {
    final securitySchemeJson = securitySchemesJson.childAsMap(name);
    final securityScheme = parseSecurityScheme(name, securitySchemeJson);
    schemes.add(securityScheme);
  }
  return schemes;
}

/// Parse the components section of a spec.
/// https://spec.openapis.org/oas/v3.1.0#componentsObject
Components parseComponents(MapContext? componentsJson) {
  if (componentsJson == null) {
    return const Components();
  }
  _refNotExpected(componentsJson);

  final schemas = _parseComponent<Schema>(
    componentsJson,
    'schemas',
    parseSchemaOrRef,
  );
  final responses = _parseComponent<Response>(
    componentsJson,
    'responses',
    parseResponseOrRef,
  );
  final parameters = _parseComponent<Parameter>(
    componentsJson,
    'parameters',
    parseParameterOrRef,
    extraSnakeName: 'param',
  );
  final requestBodies = _parseComponent<RequestBody>(
    componentsJson,
    'requestBodies',
    parseRequestBodyOrRef,
  );
  final headers = _parseComponent<Header>(
    componentsJson,
    'headers',
    parseHeaderOrRef,
  );
  final securitySchemes = _parseSecuritySchemes(
    _optionalMap(componentsJson, 'securitySchemes'),
  );
  _ignored<Map<String, dynamic>>(componentsJson, 'links');
  _ignored<Map<String, dynamic>>(componentsJson, 'callbacks');

  _warnUnused(componentsJson);
  return Components(
    schemas: schemas,
    requestBodies: requestBodies,
    parameters: parameters,
    responses: responses,
    headers: headers,
    securitySchemes: securitySchemes,
  );
}

Info parseInfo(MapContext json) {
  _refNotExpected(json);
  final title = _required<String>(json, 'title');
  final version = _required<String>(json, 'version');
  _ignored<String>(json, 'summary');
  _ignored<String>(json, 'description');
  _ignored<String>(json, 'termsOfService');
  _ignored<dynamic>(json, 'contact');
  _ignored<dynamic>(json, 'license');
  _warnUnused(json);
  return Info(title, version);
}

/// Parse the paths section of a spec.
/// https://spec.openapis.org/oas/v3.1.0#paths-object
Paths parsePaths(MapContext pathsJson) {
  _refNotExpected(pathsJson);
  final paths = <String, PathItem>{};
  // Paths object only has patterned fields, so we just walk the keys.
  for (final path in pathsJson.keys) {
    final pathItemJson = _optionalMap(pathsJson, path);
    if (pathItemJson == null) {
      continue;
    }
    _expect(pathItemJson.isNotEmpty, pathItemJson, 'Path cannot be empty');
    _expect(
      path.startsWith('/'),
      pathItemJson,
      'Path must start with /: $path',
    );

    paths[path] = parsePathItem(pathItemJson: pathItemJson, path: path);
  }
  return Paths(paths: paths);
}

Tag parseTag(MapContext json) {
  final name = _required<String>(json, 'name');
  final description = _optional<String>(json, 'description');
  return Tag(name: name, description: description);
}

SecurityRequirement parseSecurityRequirement(MapContext json) {
  // Each security requirement references possibly multiple security schemes.
  // https://spec.openapis.org/oas/v3.1.0#security-requirement-object
  // The keys are the security scheme names, and the values are
  // scheme-dependant (typically scopes or roles).
  final conditions = <String, List<String>>{};
  // Explicitly copy the value to prevent unused fields warning.
  for (final name in json.keys) {
    final value = _requiredList<String>(json, name);
    conditions[name] = value;
  }
  return SecurityRequirement(conditions: conditions, pointer: json.pointer);
}

/// The base URL for generated requests, taken from the first entry of the
/// top-level `servers` list.
///
/// `servers` is optional in OpenAPI 3.x: when it's absent or an empty array,
/// the spec defines the default as a single Server Object with url `/`. We
/// mirror that — consumers override `baseUri` on the generated client, so `/`
/// is a safe placeholder base rather than a parse failure.
Uri _parseServerUrl(MapContext json) {
  var url = '/';
  if (json['servers'] != null) {
    final servers = json.childAsList('servers');
    if (servers.length > 0) {
      url = _required<String>(servers.indexAsMap(0), 'url');
    }
  }
  return Uri.parse(url);
}

OpenApi parseOpenApi(Map<String, dynamic> openapiJson) {
  final json = MapContext.initial(openapiJson);
  _refNotExpected(json);
  final minimumVersion = Version.parse('3.0.0');
  final versionString = _required<String>(json, 'openapi');
  final version = Version.parse(versionString);
  if (version < minimumVersion) {
    _warn(
      json,
      '$version < $minimumVersion, the lowest known supported version.',
    );
  }

  final info = parseInfo(_requiredMap(json, 'info'));

  final serverUrl = _parseServerUrl(json);

  final paths = parsePaths(_requiredMap(json, 'paths'));
  final components = parseComponents(_optionalMap(json, 'components'));
  final tags = _mapOptionalList(json, 'tags', (child, _) => parseTag(child));
  final securityRequirements = _mapOptionalList(
    json,
    'security',
    (child, _) => parseSecurityRequirement(child),
  );
  // OpenAPI 3.1 top-level sections we don't (yet) generate from.
  // `webhooks` is the 3.1 webhook-event registry; `externalDocs`
  // points at out-of-band human docs. Consume so they don't surface
  // as `Unused` noise in the verbose log.
  _ignored<dynamic>(json, 'webhooks');
  _ignored<dynamic>(json, 'externalDocs');
  _warnUnused(json);
  return OpenApi(
    serverUrl: serverUrl,
    version: version,
    info: info,
    paths: paths,
    components: components,
    tags: tags,
    securityRequirements: securityRequirements,
  );
}

class RefRegistry {
  RefRegistry();

  final objectsByUri = <Uri, dynamic>{};

  /// A ref location whose target is itself a `$ref` — a components alias
  /// like `Product-Base: {$ref: ./schemas/product_base.yaml}`. Looking up
  /// the alias URI follows the chain to the underlying object. Kept separate
  /// from [objectsByUri] because a location holds either an object or a ref,
  /// never both, so the two maps never key the same URI.
  final aliasesByUri = <Uri, Uri>{};

  Iterable<Uri> get uris => objectsByUri.keys;

  /// Follow any alias chain from [uri] to the URI of the object it
  /// ultimately names. Returns [uri] unchanged when it isn't an alias.
  /// Callers switching their document base must resolve refs against *this*
  /// URI's document, not the alias's — a `Product-Base` alias in `api.yaml`
  /// points at `schemas/product_base.yaml`, whose own refs are relative to
  /// `schemas/`, not to `api.yaml`.
  Uri followAliases(Uri uri) {
    var resolved = uri;
    final seen = <Uri>{};
    while (aliasesByUri.containsKey(resolved)) {
      if (!seen.add(resolved)) {
        throw FormatException('Cyclic ref alias chain reaching $uri');
      }
      resolved = aliasesByUri[resolved]!;
    }
    return resolved;
  }

  T get<T>(Uri uri) {
    final resolved = followAliases(uri);
    final object = objectsByUri[resolved];
    if (object == null) {
      throw FormatException('$T not found: $uri');
    }
    if (object is! T) {
      throw FormatException('Expected $T, got ${object.runtimeType}');
    }
    return object;
  }

  /// Record that [from] is an alias for [to] (both absolute URIs). A
  /// components entry that is a bare `$ref` names no object of its own; the
  /// alias lets a lookup of its URI reach whatever [to] eventually holds.
  /// First arrival wins — re-registering the same alias is a no-op.
  void registerAlias(Uri from, Uri to) {
    aliasesByUri.putIfAbsent(from, () => to);
  }

  void register(Uri uri, dynamic object) {
    if (objectsByUri.containsKey(uri)) {
      logger
        ..warn('Object already registered: $uri')
        ..info('before: ${objectsByUri[uri]}')
        ..info('after: $object');
      throw Exception('Object already registered: $uri');
    }
    if (object is SchemaObject) {
      final schema = object;
      final byName = objectsByUri.entries
          .where((e) => e.value is SchemaObject)
          .firstWhereOrNull(
            (e) => (e.value as SchemaObject).snakeName == schema.snakeName,
          );
      if (byName != null) {
        logger
          ..warn('Schema already registered by name: ${schema.snakeName}')
          ..info('existing uri: ${byName.key}')
          ..info('existing schema: ${byName.value}')
          ..info('new uri: $uri')
          ..info('new schema: $schema');
      }
    }
    objectsByUri[uri] = object;
  }
}

/// Walks a parsed [OpenApi] (or a standalone [Components]) and indexes every
/// component in a [RefRegistry] by its document-relative URI, so the
/// resolver can dereference `$ref`s. A location holding a bare `$ref` (a
/// components alias) registers an alias rather than an object. Sits in the
/// parse layer because it is pure post-parse indexing — both assembly and
/// the resolver's single-document convenience path build registries with it.
class RegistryBuilder extends Visitor {
  RegistryBuilder(this.specUrl, this.refRegistry);
  final Uri specUrl;
  final RefRegistry refRegistry;

  void add(HasPointer object) {
    final fragment = object.pointer.urlEncodedFragment;
    final uri = specUrl.resolve(fragment);
    refRegistry.register(uri, object);
  }

  @override
  void visitRefOr<T extends Parseable>(RefOr<T> refOr) {
    // A location holding a bare `$ref` (a components alias like
    // `Product-Base: {$ref: ./schemas/product_base.yaml}`) registers no
    // object of its own — the inline case is handled by the `visitX` calls
    // as the walk descends. Record the alias so a lookup of this location
    // reaches whatever the target eventually resolves to.
    final ref = refOr.ref;
    if (ref == null) return;
    final from = specUrl.resolve(refOr.pointer.urlEncodedFragment);
    final to = specUrl.resolveUri(ref.uri);
    refRegistry.registerAlias(from, to);
  }

  @override
  void visitPathItem(PathItem pathItem) => add(pathItem);
  @override
  void visitOperation(Operation operation) => add(operation);
  @override
  void visitParameter(Parameter parameter) => add(parameter);
  @override
  void visitResponse(Response response) => add(response);
  @override
  void visitRequestBody(RequestBody requestBody) => add(requestBody);
  @override
  void visitSchema(Schema schema) => add(schema);
  @override
  void visitHeader(Header header) => add(header);
}

class MapContext extends ParseContext {
  MapContext({
    required super.pointerParts,
    required super.snakeNameStack,
    required this.json,
    // Only exposed in the constructor so that addSnakeName can pass it to
    // prevent resetting the usedKeys set.
    Set<String>? usedKeys,
  }) : usedKeys = usedKeys ?? <String>{};

  MapContext.fromParent({
    required ParseContext parent,
    required Map<String, dynamic> json,
    required String key,
  }) : this(
         pointerParts: [...parent.pointerParts, key],
         snakeNameStack: parent.snakeNameStack,
         json: json,
       );

  MapContext.initial(Json json)
    : this(pointerParts: [], snakeNameStack: [], json: json);

  MapContext childAsMap(String key) {
    final value = json[key];
    if (value == null) {
      throw StateError('Key not found: $key in $pointer');
    }
    final child = _expectType<Map<String, dynamic>>(this, key, value);
    markUsed(key);
    return MapContext.fromParent(parent: this, json: child, key: key);
  }

  MapContext fakeChildAsMap({
    required String snakeName,
    required Map<String, dynamic> value,
  }) {
    return MapContext.fromParent(parent: this, json: value, key: snakeName);
  }

  ListContext childAsList(String key) {
    final value = json[key];
    if (value == null) {
      throw StateError('Key not found: $key in $pointer');
    }
    final child = _expectType<List<dynamic>>(this, key, value);
    markUsed(key);
    return ListContext.fromParent(parent: this, json: child, key: key);
  }

  MapContext addSnakeName(String snakeName) => MapContext(
    pointerParts: pointerParts,
    snakeNameStack: [...snakeNameStack, snakeName],
    json: json,
    usedKeys: usedKeys,
  );

  bool get isNotEmpty => json.isNotEmpty;

  dynamic operator [](String key) {
    markUsed(key);
    return json[key];
  }

  bool containsKey(String key) => json.containsKey(key);

  Iterable<String> get keys => json.keys;

  @override
  String toString() => 'MapContext($pointer, $json)';

  /// The json object being parsed.
  final Json json;

  /// Keys which were read during parsing.
  @visibleForTesting
  final Set<String> usedKeys;

  /// Mark [key] as read without retrieving the value. Useful for
  /// callers that want to suppress a `_warnUnused` entry on a key
  /// they've inspected via the underlying [json] map directly (or
  /// that they're consuming for side-effect only).
  void markUsed(String key) => usedKeys.add(key);

  Set<String> get unusedKeys =>
      Set<String>.from(json.keys).difference(usedKeys);
}

class ListContext extends ParseContext {
  ListContext({
    required super.pointerParts,
    required super.snakeNameStack,
    required this.json,
  });

  ListContext.fromParent({
    required ParseContext parent,
    required List<dynamic> json,
    required String key,
  }) : this(
         pointerParts: [...parent.pointerParts, key],
         snakeNameStack: parent.snakeNameStack,
         json: json,
       );

  MapContext indexAsMap(int index) {
    final value = json[index];
    if (value == null) {
      _error(this, 'Index $index not found');
    }
    if (value is! Map<String, dynamic>) {
      _error(this, 'Index $index is not of type Map<String, dynamic>: $value');
    }
    return MapContext.fromParent(
      parent: this,
      json: value,
      key: index.toString(),
    );
  }

  int get length => json.length;

  final List<dynamic> json;
}

/// Immutable context for parsing a spec.
/// SchemaRegistry is internally mutable, so this is not truly immutable.
abstract class ParseContext {
  ParseContext({required this.pointerParts, required this.snakeNameStack});

  /// Json pointer location of the current schema.
  final List<String> pointerParts;

  /// Stack of name parts for the current schema.
  final List<String> snakeNameStack;

  JsonPointer get pointer => JsonPointer.fromParts(pointerParts);

  String get snakeName {
    // To match OpenAPI, we don't put a _ before numbers.
    final buf = StringBuffer();
    for (final e in snakeNameStack) {
      if (buf.isNotEmpty && (e.isNotEmpty && int.tryParse(e[0]) == null)) {
        buf.write('_');
      }
      buf.write(e);
    }
    return buf.toString();
  }
}
