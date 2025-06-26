import 'package:collection/collection.dart';
import 'package:meta/meta.dart';
import 'package:space_gen/src/logger.dart';
import 'package:space_gen/src/parse/spec.dart';
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

ListContext _requiredList(MapContext json, String key) {
  final value = json[key];
  if (value == null) {
    _error(json, 'Key $key is required');
  }
  return json.childAsList(key);
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

List<T>? _optionalList<T>(MapContext parent, String key) {
  final value = parent[key];
  if (value == null) {
    return null;
  }
  if (value is! List || !value.every((e) => e is T)) {
    _error(parent, "'$key' is not a list of $T: $value");
  }
  return value.cast<T>();
}

MapContext? _optionalMap(MapContext parent, String key) {
  final value = parent[key];
  if (value == null) {
    return null;
  }
  _expectType<Map<String, dynamic>>(parent, key, value);
  return parent.childAsMap(key);
}

Iterable<T> _mapOptionalList<T>(
  MapContext parent,
  String key,
  T Function(MapContext, int) parse,
) sync* {
  final value = parent[key];
  if (value == null) {
    return;
  }

  final list = parent.childAsList(key);
  for (var i = 0; i < list.length; i++) {
    yield parse(list.indexAsMap(i), i);
  }
}

Never _unimplemented(ParseContext json, String message) {
  throw UnimplementedError('$message not supported in $json');
}

void _ignored<T>(MapContext parent, String key, {bool warn = false}) {
  final value = parent[key];
  if (value != null) {
    _expectType<T>(parent, key, value);
    final message = 'Ignoring key: $key ($T) in ${parent.pointer}';
    final method = warn ? logger.warn : logger.detail;
    method(message);
  }
}

void _warn(ParseContext context, String message) {
  logger.warn('$message in ${context.pointer}');
}

Never _error(ParseContext context, String message) {
  throw FormatException('$message in ${context.pointer}');
}

void _warnUnused(MapContext context) {
  final unusedKeys = context.unusedKeys;
  if (unusedKeys.isNotEmpty) {
    logger.detail(
      'Unused keys: ${unusedKeys.join(', ')} in ${context.pointer}',
    );
  }
}

RefOr<Parameter> parseParameterOrRef(MapContext json) {
  if (json.containsKey(r'$ref')) {
    final ref = json[r'$ref'] as String;
    return RefOr<Parameter>.ref(ref, json.pointer);
  }
  return RefOr<Parameter>.object(parseParameter(json), json.pointer);
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
  final sendIn = SendIn.fromJson(_required<String>(json, 'in'));
  _ignored<bool>(json, 'deprecated');
  _ignored<bool>(json, 'allowEmptyValue');

  final SchemaRef type;
  if (hasSchema && !hasContent) {
    // Schema fields.
    type = parseSchemaOrRef(schema);
    _ignored<String>(json, 'style');
    _ignored<bool>(json, 'explode');
    _ignored<bool>(json, 'allowReserved');
    _ignored<dynamic>(json, 'example');
    _ignored<dynamic>(json, 'examples');
  } else if (!hasSchema && hasContent) {
    // Content values (Map<String, MediaType>) are not supported.
    _unimplemented(json, "'content'");
  } else if (hasSchema && hasContent) {
    _error(json, 'Parameter cannot have both schema and content');
  } else {
    _error(json, 'Parameter must have either schema or content.');
  }

  if (sendIn == SendIn.path) {
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
    sendIn: sendIn,
    type: type,
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
  _ignored<dynamic>(json, 'style');
  _ignored<bool>(json, 'explode');
  _ignored<bool>(json, 'allowReserved');
  _ignored<dynamic>(json, 'example');
  _ignored<Map<String, dynamic>>(json, 'examples');

  final schema = _maybeSchemaOrRef(_optionalMap(json, 'schema'));
  _warnUnused(json);
  return Header(
    pointer: json.pointer,
    description: description,
    schema: schema,
  );
}

RefOr<Header> parseHeaderOrRef(MapContext json) {
  if (json.containsKey(r'$ref')) {
    final ref = json[r'$ref'] as String;
    return RefOr<Header>.ref(ref, json.pointer);
  }
  return RefOr<Header>.object(parseHeader(json), json.pointer);
}

PodType? determinePodType(MapContext json) {
  final type = _optional<String>(json, 'type');
  final validButIgnored = ['array', 'object', 'null', null];
  if (validButIgnored.contains(type)) {
    return null;
  }
  final mapped = {
    'integer': PodType.integer,
    'number': PodType.number,
    'boolean': PodType.boolean,
  }[type];
  if (mapped != null) {
    return mapped;
  }
  if (type == 'string') {
    final format = _optional<String>(json, 'format');
    if (format == 'binary') {
      return null;
    }
    if (format == 'date-time') {
      return PodType.dateTime;
    }
    if (format == 'uri') {
      return PodType.uri;
    }
    if (format != null) {
      _warn(json, 'Unknown string format: $format');
    }
    return PodType.string;
  }
  _error(json, 'Unknown pod type: $type');
}

Schema? _handleCollectionTypes(MapContext json) {
  if (json.containsKey('oneOf')) {
    final oneOf = json.childAsList('oneOf');
    final schemas = <SchemaRef>[];
    for (var i = 0; i < oneOf.length; i++) {
      schemas.add(
        parseSchemaOrRef(oneOf.indexAsMap(i).addSnakeName('oneOf$i')),
      );
    }
    return SchemaOneOf(
      pointer: json.pointer,
      snakeName: json.snakeName,
      schemas: schemas,
    );
  }

  if (json.containsKey('allOf')) {
    final allOf = json.childAsList('allOf');
    final schemas = <SchemaRef>[];
    for (var i = 0; i < allOf.length; i++) {
      schemas.add(
        parseSchemaOrRef(allOf.indexAsMap(i).addSnakeName('allOf$i')),
      );
    }
    return SchemaAllOf(
      pointer: json.pointer,
      snakeName: json.snakeName,
      schemas: schemas,
    );
  }

  if (json.containsKey('anyOf')) {
    final anyOf = json.childAsList('anyOf');
    final schemas = <SchemaRef>[];
    for (var i = 0; i < anyOf.length; i++) {
      schemas.add(
        parseSchemaOrRef(anyOf.indexAsMap(i).addSnakeName('anyOf$i')),
      );
    }
    return SchemaAnyOf(
      pointer: json.pointer,
      snakeName: json.snakeName,
      schemas: schemas,
    );
  }
  return null;
}

SchemaRef? _handleAdditionalProperties(MapContext parent) {
  final value = parent['additionalProperties'];
  if (value == null) {
    return null;
  }
  if (value is bool) {
    if (value) {
      return SchemaRef.schema(
        SchemaUnknown(
          pointer: parent.pointer.add('additionalProperties'),
          snakeName: 'additionalProperties',
          description: parent['description'] as String?,
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

SchemaEnum? _handleEnum({
  required MapContext json,
  required PodType? podType,
  required String? type,
  required dynamic defaultValue,
}) {
  final enumValues = _optional<List<dynamic>>(json, 'enum');

  if (enumValues == null) {
    return null;
  }
  // We will infer the type from the enum values if not provided.
  if (type != null && podType != PodType.string) {
    // boolean enums are valid but not yet supported (or particularly
    // consequential to ignore). GitHub uses one for fork=true.
    if (podType == PodType.boolean) {
      _ignored<String>(json, 'type');
      return null;
    }
    _unimplemented(json, 'enumValues for type=$type');
  }
  // TODO(eseidel): null should only be valid when enum is nullable.
  final nonNullValues = enumValues.where((e) => e != null).toList();
  if (nonNullValues.any((e) => e is! String)) {
    _error(json, 'enumValues must be a list of strings: $enumValues');
  }
  final typedEnumValues = nonNullValues.cast<String>();
  String? typedDefaultValue;
  if (defaultValue != null) {
    if (!nonNullValues.contains(defaultValue)) {
      // Try converting to a string and looking again.
      // In GitHub spec, they have a defaultValue of true (boolean) despite the
      // enum being strings (with 'true' as a valid value), so we convert the
      // default value to the enum type before checking if it's valid.
      typedDefaultValue = defaultValue.toString();
      if (!nonNullValues.contains(typedDefaultValue)) {
        _error(
          json,
          'defaultValue must be one of the enum values: $defaultValue',
        );
      }
    } else {
      typedDefaultValue = defaultValue as String?;
    }
  }
  return SchemaEnum(
    pointer: json.pointer,
    snakeName: json.snakeName,
    defaultValue: typedDefaultValue,
    enumValues: typedEnumValues,
  );
}

Schema _createCorrectSchemaSubtype(MapContext json) {
  final collectionType = _handleCollectionTypes(json);
  if (collectionType != null) {
    return collectionType;
  }

  // TODO(eseidel): type can be an array, but we don't support that yet.
  final podType = determinePodType(json);
  final type = _optional<String>(json, 'type');
  if (type == 'null') {
    return SchemaNull(pointer: json.pointer, snakeName: json.snakeName);
  }

  if (type == 'string') {
    final format = _optional<String>(json, 'format');
    if (format == 'binary') {
      return SchemaBinary(pointer: json.pointer, snakeName: json.snakeName);
    }
  }

  final defaultValue = _optional<dynamic>(json, 'default');
  final enumSchema = _handleEnum(
    json: json,
    podType: podType,
    type: type,
    defaultValue: defaultValue,
  );
  if (enumSchema != null) {
    return enumSchema;
  }

  if (podType != null) {
    return SchemaPod(
      pointer: json.pointer,
      snakeName: json.snakeName,
      type: podType,
      defaultValue: defaultValue,
    );
  }

  if (type == 'array') {
    final items = _optionalMap(json, 'items');

    if (items == null) {
      _error(json, 'items is required for type=array');
    }
    const innerName = 'inner'; // Matching OpenAPI.
    final itemSchema = parseSchemaOrRef(items.addSnakeName(innerName));
    return SchemaArray(
      pointer: json.pointer,
      snakeName: json.snakeName,
      items: itemSchema,
      defaultValue: defaultValue,
    );
  }

  final description = _optional<String>(json, 'description');

  final additionalPropertiesSchema = _handleAdditionalProperties(json);

  final propertiesJson = _optionalMap(json, 'properties');
  if (propertiesJson == null) {
    if (additionalPropertiesSchema == null) {
      return SchemaUnknown(
        pointer: json.pointer,
        snakeName: json.snakeName,
        description: description,
      );
    }
    return SchemaMap(
      pointer: json.pointer,
      snakeName: json.snakeName,
      valueSchema: additionalPropertiesSchema,
      description: description,
    );
  }
  // The difference between an empty object and an unknown object is subtle
  // and probably not correct.  GitHub has an explicitly empty object, which is
  // used either an an alternative to nullable, or as a way to indicate an
  // empty response.  Those aren't "dynamic" types, but unclear if they need
  // a separate class either.
  if (propertiesJson.keys.isEmpty) {
    return SchemaEmptyObject(pointer: json.pointer, snakeName: json.snakeName);
  }

  final properties = <String, SchemaRef>{};
  for (final name in propertiesJson.json.keys) {
    final snakeName = snakeFromCamel(name);
    final childContext = propertiesJson
        .childAsMap(name)
        .addSnakeName(snakeName)
        // TODO(eseidel): Remove this once we have a better way to detect
        // and avoid name collisions.
        .addSnakeName('prop');
    properties[name] = parseSchemaOrRef(childContext);
  }

  // Some of these probably apply to enum and array types.
  _ignored<bool>(json, 'nullable');
  _ignored<bool>(json, 'readOnly');
  _ignored<bool>(json, 'writeOnly');
  _ignored<dynamic>(json, 'discriminator');
  _ignored<dynamic>(json, 'xml');
  final example = _optional<dynamic>(json, 'example');
  _ignored<dynamic>(json, 'examples');
  _ignored<dynamic>(json, 'externalDocs');

  final requiredProperties = _optionalList<String>(json, 'required') ?? [];

  return SchemaObject(
    pointer: json.pointer,
    snakeName: json.snakeName,
    properties: properties,
    requiredProperties: requiredProperties.cast<String>(),
    description: description ?? '',
    additionalProperties: additionalPropertiesSchema,
    defaultValue: defaultValue,
    example: example,
  );
}

/// Parse a schema from a json object.
Schema parseSchema(MapContext json) {
  _refNotExpected(json);
  final schema = _createCorrectSchemaSubtype(json);
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
  return SchemaRef.schema(parseSchema(json), json.pointer);
}

/// Parse a schema or a reference to a schema.
/// https://spec.openapis.org/oas/v3.0.0#schemaObject
/// https://spec.openapis.org/oas/v3.0.0#relative-references-in-urls
RefOr<RequestBody>? parseRequestBodyOrRef(MapContext? json) {
  if (json == null) {
    return null;
  }
  if (json.containsKey(r'$ref')) {
    final ref = json[r'$ref'] as String;
    _warnUnused(json);
    return RefOr<RequestBody>.ref(ref, json.pointer);
  }
  final body = parseRequestBody(json.addSnakeName('request'));
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
  ).toList();
  final requestBody = parseRequestBodyOrRef(
    _optionalMap(context, 'requestBody'),
  );
  final deprecated = _optional<bool>(context, 'deprecated') ?? false;
  final responses = parseResponses(_requiredMap(context, 'responses'));
  // Operation does not mention 'responses' as being required, but
  // the Responses object says at least one response is required.
  if (responses.isEmpty) {
    _error(context, 'Responses are required');
  }
  return Operation(
    pointer: operationJson.pointer,
    tags: tags,
    snakeName: snakeName,
    summary: summary ?? '',
    description: description ?? '',
    parameters: parameters,
    requestBody: requestBody,
    responses: responses,
    deprecated: deprecated,
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
  _ignored<List<dynamic>>(pathItemJson, 'parameters');
  // final parameters = _mapOptionalList(
  //   pathItemJson,
  //   'parameters',
  //   (child, index) => parseParameterOrRef(
  //  child.addSnakeName('parameter$index')),
  // ).toList();

  final description = _optional<String>(pathItemJson, 'description');
  final operations = _parseOperations(pathItemJson, path);

  _warnUnused(pathItemJson);
  return PathItem(
    pointer: pathItemJson.pointer,
    path: path,
    summary: summary ?? '',
    description: description ?? '',
    // parameters: parameters,
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

Responses parseResponses(MapContext responsesJson) {
  final responseCodes = responsesJson.keys.toList();

  // We don't yet support default responses.
  _ignored<Map<String, dynamic>>(responsesJson, 'default');
  responseCodes.remove('default');

  final responses = <int, RefOr<Response>>{};
  for (final responseCode in responseCodes) {
    final responseJson = responsesJson
        .childAsMap(responseCode)
        .addSnakeName(responseCode);
    final responseCodeInt = int.tryParse(responseCode);
    if (responseCodeInt == null) {
      _error(responsesJson, 'Invalid response code: $responseCode');
    }
    responses[responseCodeInt] = parseResponseOrRef(responseJson);
  }
  _warnUnused(responsesJson);
  return Responses(responses: responses);
}

Map<String, T> _parseComponent<T>(
  MapContext json,
  String key,
  T Function(MapContext) parse, {
  String? extraSnakeName,
}) {
  _refNotExpected(json);
  final valuesJson = _optionalMap(json, key);
  final values = <String, T>{};
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
    parseSchema,
  );
  final responses = _parseComponent<Response>(
    componentsJson,
    'responses',
    _parseResponse,
  );
  final parameters = _parseComponent<Parameter>(
    componentsJson,
    'parameters',
    parseParameter,
    extraSnakeName: 'param',
  );
  final requestBodies = _parseComponent<RequestBody>(
    componentsJson,
    'requestBodies',
    parseRequestBody,
  );
  final headers = _parseComponent<Header>(
    componentsJson,
    'headers',
    parseHeader,
  );
  final securitySchemesJson = _optionalMap(componentsJson, 'securitySchemes');
  if (securitySchemesJson != null) {
    _warn(componentsJson, 'Ignoring securitySchemes');
  }
  _ignored<Map<String, dynamic>>(componentsJson, 'links');
  _ignored<Map<String, dynamic>>(componentsJson, 'callbacks');

  _warnUnused(componentsJson);
  return Components(
    schemas: schemas,
    requestBodies: requestBodies,
    parameters: parameters,
    responses: responses,
    headers: headers,
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

  final servers = _requiredList(json, 'servers');
  final firstServer = servers.indexAsMap(0);
  final serverUrl = _required<String>(firstServer, 'url');

  final paths = parsePaths(_requiredMap(json, 'paths'));
  final components = parseComponents(_optionalMap(json, 'components'));
  _warnUnused(json);
  return OpenApi(
    serverUrl: Uri.parse(serverUrl),
    version: version,
    info: info,
    paths: paths,
    components: components,
  );
}

class RefRegistry {
  RefRegistry();

  final objectsByUri = <Uri, dynamic>{};

  Iterable<Uri> get uris => objectsByUri.keys;

  T get<T>(Uri uri) {
    final object = objectsByUri[uri];
    if (object == null) {
      throw FormatException('$T not found: $uri');
    }
    if (object is! T) {
      throw FormatException('Expected $T, got $object');
    }
    return object;
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
    _markUsed(key);
    return MapContext.fromParent(parent: this, json: child, key: key);
  }

  ListContext childAsList(String key) {
    final value = json[key];
    if (value == null) {
      throw StateError('Key not found: $key in $pointer');
    }
    final child = _expectType<List<dynamic>>(this, key, value);
    _markUsed(key);
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
    _markUsed(key);
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

  void _markUsed(String key) => usedKeys.add(key);

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
