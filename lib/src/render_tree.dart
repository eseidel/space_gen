import 'package:collection/collection.dart';
import 'package:space_gen/space_gen.dart';
import 'package:space_gen/src/resolver.dart';
import 'package:space_gen/src/string.dart';
import 'package:space_gen/src/types.dart';

Never _unimplemented(String message, JsonPointer pointer) {
  throw UnimplementedError('$message at $pointer');
}

String _sharedPrefix(List<String> values) {
  final prefix = '${values.first.split('_').first}_';
  for (final value in values) {
    if (!value.startsWith(prefix)) {
      return '';
    }
  }
  return prefix;
}

RenderSchema? maybeRenderSchema(ResolvedSchema? schema) {
  if (schema == null) {
    return null;
  }
  return toRenderSchema(schema);
}

bool isTopLevelComponent(JsonPointer pointer) {
  if (pointer.parts.length != 3) {
    return false;
  }
  final first = pointer.parts[0];
  final second = pointer.parts[1];
  return first == 'components' && second == 'schemas';
}

RenderSchema toRenderSchema(ResolvedSchema schema) {
  switch (schema) {
    case ResolvedEnum():
      return RenderEnum(
        snakeName: schema.snakeName,
        values: schema.values,
        pointer: schema.pointer,
        defaultValue: schema.defaultValue,
      );
    case ResolvedObject():
      return RenderObject(
        snakeName: schema.snakeName,
        properties: schema.properties.map(
          (name, value) => MapEntry(name, toRenderSchema(value)),
        ),
        pointer: schema.pointer,
        additionalProperties: maybeRenderSchema(schema.additionalProperties),
        required: schema.required,
      );
    case ResolvedPod():
      // Unclear if this is an OpenApi generator quirk or desired behavior,
      // but openapi creates a new file for each top level component, even
      // if it's a simple type.  Matching this behavior for now.
      final useNewType = isTopLevelComponent(schema.pointer);
      if (useNewType && schema.type == PodType.string) {
        return RenderStringNewType(
          snakeName: schema.snakeName,
          pointer: schema.pointer,
          defaultValue: schema.defaultValue as String?,
        );
      }
      if (useNewType && schema.type == PodType.number) {
        return RenderNumberNewType(
          snakeName: schema.snakeName,
          pointer: schema.pointer,
          defaultValue: schema.defaultValue as double?,
        );
      }
      return RenderPod(
        snakeName: schema.snakeName,
        type: schema.type,
        pointer: schema.pointer,
        defaultValue: schema.defaultValue,
      );
    case ResolvedArray():
      return RenderArray(
        snakeName: schema.snakeName,
        items:
            maybeRenderSchema(schema.items) ??
            RenderUnknown(snakeName: schema.snakeName, pointer: schema.pointer),
        pointer: schema.pointer,
        defaultValue: schema.defaultValue,
      );
    case ResolvedVoid():
      return RenderVoid(snakeName: schema.snakeName, pointer: schema.pointer);
    case ResolvedUnknown():
      return RenderUnknown(
        snakeName: schema.snakeName,
        pointer: schema.pointer,
      );
    case ResolvedBinary():
      return RenderBinary(snakeName: schema.snakeName, pointer: schema.pointer);
    default:
      _unimplemented('Unknown schema: $schema', schema.pointer);
  }
}

RenderParameter toRenderParameter(ResolvedParameter parameter) {
  return RenderParameter(
    name: parameter.name,
    sendIn: parameter.sendIn,
    required: parameter.required,
    type: toRenderSchema(parameter.schema),
  );
}

RenderResponse toRenderResponse(ResolvedResponse response) {
  return RenderResponse(
    statusCode: response.statusCode,
    description: response.description,
    content: toRenderSchema(response.content),
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
        required: requestBody.required,
      );
    case MimeType.applicationOctetStream:
      return RenderRequestBodyOctetStream(
        schema: toRenderSchema(requestBody.schema),
        description: requestBody.description,
        required: requestBody.required,
      );
  }
}

RenderSchema _determineReturnType(ResolvedOperation operation) {
  final responses = operation.responses;
  // Figure out how many different successful responses there are.
  final successful = responses.where(
    (e) => e.statusCode >= 200 && e.statusCode < 300,
  );
  if (successful.length < 2) {
    return toRenderSchema(successful.first.content);
  }
  final renderSchemas = successful
      .expand((e) => [toRenderSchema(e.content)])
      .toList();
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
      snakeName: '${operation.snakeName}_response',
      schemas: distinctSchemas.toList(),
      pointer: operation.pointer,
    );
  }
  return distinctSchemas.first;
}

RenderOperation toRenderOperation(ResolvedOperation operation) {
  final returnType = _determineReturnType(operation);
  return RenderOperation(
    snakeName: operation.snakeName,
    method: operation.method,
    path: operation.path,
    summary: operation.summary,
    description: operation.description,
    tags: operation.tags,
    parameters: operation.parameters.map(toRenderParameter).toList(),
    responses: operation.responses.map(toRenderResponse).toList(),
    requestBody: toRenderRequestBody(operation.requestBody),
    returnType: returnType,
  );
}

RenderPath toRenderPath(ResolvedPath pathItem) {
  return RenderPath(
    path: pathItem.path,
    operations: pathItem.operations.map(toRenderOperation).toList(),
  );
}

RenderSpec toRenderSpec(ResolvedSpec spec) {
  return RenderSpec(
    serverUrl: spec.serverUrl,
    paths: spec.paths.map(toRenderPath).toList(),
  );
}

// Convert a resolved spec to a spec that can be rendered.
// This is the root of the render spec tree.
class RenderSpec {
  const RenderSpec({required this.serverUrl, required this.paths});

  /// The server url of the spec.
  final Uri serverUrl;

  /// The paths of the spec.
  final List<RenderPath> paths;

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

  List<Api> get apis => tags
      .sorted()
      .map(
        (tag) => Api(
          name: tag,
          endpoints: endpoints.where((e) => e.tag == tag).toList(),
        ),
      )
      .toList();
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
    required this.method,
    required this.path,
    required this.snakeName,
    required this.parameters,
    required this.requestBody,
    required this.responses,
    required this.returnType,
    required this.tags,
    required this.summary,
    required this.description,
  });

  /// The method of the resolved operation.
  final Method method;

  /// The path of the resolved operation.
  final String path;

  /// The snake name of the resolved operation.
  final String snakeName;

  /// The parameters of the resolved operation.
  final List<RenderParameter> parameters;

  /// The request body of the resolved operation.
  final RenderRequestBody? requestBody;

  /// The responses of the resolved operation.
  final List<RenderResponse> responses;

  /// The return type of the resolved operation.
  final RenderSchema returnType;

  /// The tags of the resolved operation.
  final List<String> tags;

  /// The summary of the resolved operation.
  final String summary;

  /// The description of the resolved operation.
  final String? description;
}

abstract class RenderRequestBody {
  const RenderRequestBody({
    required this.schema,
    required this.description,
    required this.required,
  });

  /// The schema of the request body.
  final RenderSchema schema;

  /// The description of the request body.
  final String? description;

  /// Whether the request body is required.
  final bool required;

  String requestBodyClassName(SchemaRenderer context) {
    // TODO(eseidel): Why don't we have a name for request bodies?
    final typeName = schema.typeName(context);
    return (typeName[0].toLowerCase() + typeName.substring(1)).split('<').first;
  }

  Map<String, dynamic> toTemplateContext(SchemaRenderer context);
}

class RenderRequestBodyJson extends RenderRequestBody {
  const RenderRequestBodyJson({
    required super.schema,
    required super.description,
    required super.required,
  });

  @override
  Map<String, dynamic> toTemplateContext(SchemaRenderer context) {
    final typeName = schema.typeName(context);
    final paramName = requestBodyClassName(context);
    // TODO(eseidel): Share code with Parameter.toTemplateContext.
    final isNullable = !required;
    return {
      'name': paramName,
      'dartName': paramName,
      'bracketedName': '{$paramName}',
      'required': required,
      'hasDefaultValue': schema.defaultValue != null,
      'defaultValue': schema.defaultValueString(context),
      'type': typeName,
      'nullableType': schema.nullableTypeName(context),
      'encodedBody': schema.toJsonExpression(
        paramName,
        context,
        dartIsNullable: isNullable,
      ),
    };
  }
}

class RenderRequestBodyOctetStream extends RenderRequestBody {
  const RenderRequestBodyOctetStream({
    required super.schema,
    required super.description,
    required super.required,
  });

  @override
  Map<String, dynamic> toTemplateContext(SchemaRenderer context) {
    final paramName = requestBodyClassName(context);
    return {
      'name': paramName,
      'dartName': paramName,
      'bracketedName': '{$paramName}',
      'required': required,
      'hasDefaultValue': schema.defaultValue != null,
      'defaultValue': schema.defaultValueString(context),
      'type': schema.typeName(context),
      'nullableType': schema.nullableTypeName(context),
      'encodedBody': paramName,
    };
  }
}

class RenderResponse {
  const RenderResponse({
    required this.statusCode,
    required this.description,
    required this.content,
  });

  /// The status code of the resolved response.
  final int statusCode;

  /// The description of the resolved response.
  final String description;

  /// The resolved content of the resolved response.
  /// We only support json, so we only need a single content.
  final RenderSchema content;
}

abstract class RenderSchema {
  const RenderSchema({required this.snakeName, required this.pointer});

  /// The snake name of the resolved schema.
  final String snakeName;

  /// The pointer of the resolved schema.
  final JsonPointer pointer;

  /// Whether this schema creates a new type and thus needs to be rendered.
  bool get createsNewType;

  dynamic get defaultValue;

  String orDefaultExpression({
    required SchemaRenderer context,
    required bool jsonIsNullable,
    required bool dartIsNullable,
  }) {
    if (jsonIsNullable && !dartIsNullable) {
      final defaultValue = defaultValueString(context);
      if (defaultValue == null) {
        throw StateError('No default value for nullable property: $this');
      }
      return '?? $defaultValue';
    }
    return '';
  }

  /// Is this the json storage type or the dart class type?
  String typeName(SchemaRenderer context);

  String nullableTypeName(SchemaRenderer context) {
    final typeName = this.typeName(context);
    return typeName.endsWith('?') ? typeName : '$typeName?';
  }

  String equalsExpression(String name, SchemaRenderer context);

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

  /// The default value of this schema as a string.
  String? defaultValueString(SchemaRenderer context) =>
      defaultValue?.toString();

  bool hasDefaultValue(SchemaRenderer context) => defaultValue != null;

  Map<String, dynamic> toTemplateContext(SchemaRenderer context);

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
    // Intentionally ignoring pointer, snakeName and defaultValue.
    return true;
  }
}

// Plain old data types (string, number, boolean)
class RenderPod extends RenderSchema {
  const RenderPod({
    required super.snakeName,
    required this.type,
    required super.pointer,
    this.defaultValue,
  });

  /// The type of the resolved schema.
  final PodType type;

  @override
  final dynamic defaultValue;

  @override
  String typeName(SchemaRenderer context) {
    switch (type) {
      case PodType.string:
        return 'String';
      case PodType.integer:
        return 'int';
      case PodType.number:
        return 'double';
      case PodType.boolean:
        return 'bool';
      case PodType.dateTime:
        return 'DateTime';
    }
  }

  @override
  String jsonStorageType({required bool isNullable}) {
    switch (type) {
      case PodType.string:
      case PodType.dateTime:
        return isNullable ? 'String?' : 'String';
      case PodType.integer:
        return isNullable ? 'int?' : 'int';
      case PodType.number:
        return isNullable ? 'num?' : 'num';
      case PodType.boolean:
        return isNullable ? 'bool?' : 'bool';
    }
  }

  @override
  String equalsExpression(String name, SchemaRenderer context) =>
      '$name == other.$name';

  @override
  bool get createsNewType => false;

  @override
  String toJsonExpression(
    String dartName,
    SchemaRenderer context, {
    required bool dartIsNullable,
  }) {
    final nameCall = dartIsNullable ? '$dartName?' : dartName;
    if (type == PodType.dateTime) {
      return '$nameCall.toIso8601String()';
    }
    return dartName;
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
    switch (type) {
      case PodType.dateTime:
        if (jsonIsNullable) {
          return 'maybeParseDateTime($jsonValue as $jsonType) $orDefault';
        } else {
          return 'DateTime.parse($jsonValue as $jsonType)';
        }
      case PodType.string:
        return '$jsonValue as $jsonType $orDefault';
      case PodType.integer:
        return '($jsonValue as $jsonType).toInt() $orDefault';
      case PodType.number:
        return '($jsonValue as $jsonType).toDouble() $orDefault';
      case PodType.boolean:
        return '($jsonValue as $jsonType) $orDefault';
    }
  }

  @override
  Map<String, dynamic> toTemplateContext(SchemaRenderer context) =>
      throw UnimplementedError('RenderPod.toTemplateContext');

  @override
  bool equalsIgnoringName(RenderSchema other) =>
      (other is RenderPod) &&
      type == other.type &&
      super.equalsIgnoringName(other);
}

abstract class RenderNewType extends RenderSchema {
  const RenderNewType({required super.snakeName, required super.pointer});

  /// Whether this new type creates a new type and thus needs to be rendered.
  @override
  bool get createsNewType => true;

  /// The class name of the new type.
  String get className => camelFromSnake(snakeName);

  @override
  String typeName(SchemaRenderer context) => className;

  @override
  String equalsExpression(String name, SchemaRenderer context) =>
      '$name == other.$name';

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

class RenderStringNewType extends RenderNewType {
  const RenderStringNewType({
    required super.snakeName,
    required super.pointer,
    required this.defaultValue,
  });

  @override
  final String? defaultValue;

  @override
  Map<String, dynamic> toTemplateContext(SchemaRenderer context) => {
    'typeName': className,
  };

  @override
  String jsonStorageType({required bool isNullable}) {
    return isNullable ? 'String?' : 'String';
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
    return '$className(($jsonValue as $jsonType) $orDefault)';
  }
}

class RenderNumberNewType extends RenderNewType {
  const RenderNumberNewType({
    required super.snakeName,
    required super.pointer,
    required this.defaultValue,
  });

  @override
  final double? defaultValue;

  @override
  Map<String, dynamic> toTemplateContext(SchemaRenderer context) => {
    'typeName': className,
  };

  @override
  String jsonStorageType({required bool isNullable}) {
    return isNullable ? 'num?' : 'num';
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
    return '$className(($jsonValue as $jsonType).toDouble() $orDefault)';
  }
}

class RenderObject extends RenderNewType {
  const RenderObject({
    required super.snakeName,
    required this.properties,
    required super.pointer,
    this.additionalProperties,
    this.required = const [],
  });

  /// The properties of the resolved schema.
  final Map<String, RenderSchema> properties;

  /// The additional properties of the resolved schema.
  final RenderSchema? additionalProperties;

  /// The required properties of the resolved schema.
  final List<String> required;

  @override
  dynamic get defaultValue => null;

  @override
  String jsonStorageType({required bool isNullable}) {
    return isNullable ? 'Map<String, dynamic>?' : 'Map<String, dynamic>';
  }

  // isNullable means it's optional for the server, use nullable storage.
  bool propertyDartIsNullable({
    required String jsonName,
    required SchemaRenderer context,
    required bool propertyHasDefaultValue,
  }) {
    final inRequiredList = required.contains(jsonName);
    if (context.quirks.nonNullableDefaultValues) {
      return !inRequiredList && !propertyHasDefaultValue;
    }
    return !inRequiredList;
  }

  /// `this` is the schema of the object containing the property.
  /// [property] is the schema of the property itself.
  Map<String, dynamic> propertyTemplateContext({
    required String jsonName,
    required RenderSchema property,
    required SchemaRenderer context,
  }) {
    // Properties only need to avoid reserved words for openapi compat.
    // TODO(eseidel): Remove this once we've migrated to the new generator.
    final dartName = avoidReservedWord(jsonName);
    final hasDefaultValue = property.hasDefaultValue(context);
    final jsonIsNullable = !required.contains(jsonName);
    final dartIsNullable = propertyDartIsNullable(
      jsonName: jsonName,
      context: context,
      propertyHasDefaultValue: hasDefaultValue,
    );

    // Means that the constructor parameter is required which is only true if
    // both the json property is required and it does not have a default.
    final useRequired = required.contains(jsonName) && !hasDefaultValue;
    return {
      'dartName': dartName,
      'jsonName': jsonName,
      'useRequired': useRequired,
      'dartIsNullable': dartIsNullable,
      'hasDefaultValue': hasDefaultValue,
      'defaultValue': property.defaultValueString(context),
      'type': property.typeName(context),
      'nullableType': property.nullableTypeName(context),
      'equals': property.equalsExpression(dartName, context),
      'toJson': property.toJsonExpression(
        dartName,
        context,
        dartIsNullable: dartIsNullable,
      ),
      'fromJson': property.fromJsonExpression(
        "json['$jsonName']",
        context,
        dartIsNullable: dartIsNullable,
        jsonIsNullable: jsonIsNullable,
      ),
    };
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
    return {
      'typeName': className,
      'nullableTypeName': nullableTypeName(context),
      'hasProperties': hasProperties,
      // Special case behavior hashCode with only one property.
      'hasOneProperty': propertiesCount == 1,
      'properties': renderProperties,
      'hasAdditionalProperties': hasAdditionalProperties,
      'additionalPropertiesName': 'entries', // Matching OpenAPI.
      'valueSchema': valueSchema?.typeName(context),
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
    return '$className.$jsonMethod($jsonValue as $jsonType) $orDefault';
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
    if (!const ListEquality<String>().equals(required, other.required)) {
      return false;
    }
    return super.equalsIgnoringName(other);
  }
}

class RenderArray extends RenderSchema {
  const RenderArray({
    required super.snakeName,
    required this.items,
    required super.pointer,
    this.defaultValue,
  });

  /// The items of the resolved schema.
  final RenderSchema items;

  @override
  final dynamic defaultValue;

  /// The type name of this schema.
  @override
  String typeName(SchemaRenderer context) => 'List<${items.typeName(context)}>';

  @override
  String equalsExpression(String name, SchemaRenderer context) =>
      'listsEqual($name, other.$name)';

  @override
  bool get createsNewType => false;

  @override
  String? defaultValueString(SchemaRenderer context) {
    // OpenAPI defaults arrays to empty, so we match for now.
    return context.quirks.allListsDefaultToEmpty
        ? 'const []'
        : super.defaultValueString(context);
  }

  @override
  bool hasDefaultValue(SchemaRenderer context) =>
      defaultValue != null || context.quirks.allListsDefaultToEmpty;

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
    if (items is RenderPod) {
      return dartName;
    }
    final nameCall = dartIsNullable ? '$dartName?' : dartName;
    return '$nameCall.map((e) => e.toJson()).toList()';
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
    final itemTypeName = items.typeName(context);
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
      return '$castAsList.cast<$itemTypeName>() $orDefault';
    }
    return '$castAsList.map<$itemTypeName>('
        '(e) => $itemsFromJson).toList() $orDefault';
  }

  @override
  Map<String, dynamic> toTemplateContext(SchemaRenderer context) =>
      throw UnimplementedError('RenderArray.toTemplateContext');

  @override
  bool equalsIgnoringName(RenderSchema other) {
    if (other is! RenderArray) {
      return false;
    }
    return items.equalsIgnoringName(other.items) &&
        super.equalsIgnoringName(other);
  }
}

class RenderEnum extends RenderNewType {
  const RenderEnum({
    required super.snakeName,
    required this.values,
    required super.pointer,
    this.defaultValue,
  });

  @override
  final dynamic defaultValue;

  /// The name of an enum value.
  String enumValueName(SchemaRenderer context, String jsonName) {
    if (context.quirks.screamingCapsEnums) {
      return jsonName;
    }
    // Dart style uses camelCase.
    return camelFromScreamingCaps(jsonName);
  }

  @override
  String jsonStorageType({required bool isNullable}) {
    return isNullable ? 'String?' : 'String';
  }

  /// Template context for an enum schema.
  @override
  Map<String, dynamic> toTemplateContext(SchemaRenderer context) {
    final sharedPrefix = _sharedPrefix(values);
    Map<String, dynamic> enumValueToTemplateContext(String value) {
      var dartName = enumValueName(context, value);
      // OpenAPI also removes shared prefixes from enum values.
      dartName = dartName.replaceAll(sharedPrefix, '');
      // And avoids reserved words.
      dartName = avoidReservedWord(dartName);
      return {'enumValueName': dartName, 'enumValue': value};
    }

    return {
      'typeName': className,
      'nullableTypeName': nullableTypeName(context),
      'enumValues': values.map(enumValueToTemplateContext).toList(),
    };
  }

  /// The default value of this schema as a string.
  @override
  String? defaultValueString(SchemaRenderer context) {
    // If the type of this schema is an object we need to convert the default
    // value to that object type.
    if (defaultValue is String) {
      return '$className.${enumValueName(context, defaultValue as String)}';
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
    return '$className.$jsonMethod($jsonValue as $jsonType) $orDefault';
  }

  /// The values of the resolved schema.
  final List<String> values;

  @override
  bool equalsIgnoringName(RenderSchema other) {
    if (other is! RenderEnum) {
      return false;
    }
    return values == other.values && super.equalsIgnoringName(other);
  }
}

class RenderOneOf extends RenderNewType {
  const RenderOneOf({
    required super.snakeName,
    required this.schemas,
    required super.pointer,
  });

  /// The schemas of the resolved schema.
  final List<RenderSchema> schemas;

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
    return super.equalsIgnoringName(other);
  }

  // We can potentially do better than dynamic by comparing the schemas.
  @override
  String jsonStorageType({required bool isNullable}) => 'dynamic';

  @override
  Map<String, dynamic> toTemplateContext(SchemaRenderer context) {
    return {
      'typeName': className,
      'nullableTypeName': nullableTypeName(context),
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
    final jsonMethod = jsonIsNullable ? 'maybeFromJson' : 'fromJson';
    return '$className.$jsonMethod($jsonValue as $jsonType)';
  }

  @override
  dynamic get defaultValue => null;
}

class RenderParameter {
  const RenderParameter({
    required this.name,
    required this.type,
    required this.required,
    required this.sendIn,
  });

  /// The name of the parameter.
  final String name;

  /// The type of the parameter.
  final RenderSchema type;

  /// The send in of the parameter.
  final SendIn sendIn;

  /// Whether the parameter is required.
  final bool required;

  Map<String, dynamic> toTemplateContext(SchemaRenderer context) {
    final isNullable = !required;
    final specName = name;
    final dartName = lowercaseCamelFromSnake(name);
    final jsonName = name;
    return {
      'name': name,
      'dartName': dartName,
      'bracketedName': '{$specName}',
      'required': required,
      'hasDefaultValue': type.defaultValue != null,
      'defaultValue': type.defaultValueString(context),
      'isNullable': isNullable,
      'type': type.typeName(context),
      'nullableType': type.nullableTypeName(context),
      'sendIn': sendIn.name,
      'toJson': type.toJsonExpression(
        dartName,
        context,
        dartIsNullable: isNullable,
      ),
      'fromJson': type.fromJsonExpression(
        "json['$jsonName']",
        context,
        jsonIsNullable: isNullable,
        dartIsNullable: isNullable,
      ),
    };
  }
}

class RenderUnknown extends RenderSchema {
  const RenderUnknown({required super.snakeName, required super.pointer});

  @override
  dynamic get defaultValue => null;

  @override
  String typeName(SchemaRenderer context) => 'dynamic';

  @override
  String equalsExpression(String name, SchemaRenderer context) =>
      'identical($name, other.$name)';

  @override
  bool get createsNewType => false;

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
}

class RenderVoid extends RenderSchema {
  const RenderVoid({required super.snakeName, required super.pointer});

  @override
  dynamic get defaultValue =>
      throw UnimplementedError('RenderVoid.defaultValue');

  @override
  String typeName(SchemaRenderer context) => 'void';

  @override
  String equalsExpression(String name, SchemaRenderer context) =>
      'throw UnimplementedError("RenderVoid.equalsExpression")';

  @override
  bool get createsNewType => false;

  @override
  String jsonStorageType({required bool isNullable}) =>
      'throw UnimplementedError("RenderVoid.jsonStorageType")';

  @override
  String toJsonExpression(
    String dartName,
    SchemaRenderer context, {
    required bool dartIsNullable,
  }) => 'throw UnimplementedError("RenderVoid.toJson")';

  @override
  String fromJsonExpression(
    String jsonValue,
    SchemaRenderer context, {
    required bool jsonIsNullable,
    required bool dartIsNullable,
  }) => ''; // Unclear if this is correct.

  @override
  Map<String, dynamic> toTemplateContext(SchemaRenderer context) =>
      throw UnimplementedError('RenderVoid.toTemplateContext');
}

class RenderBinary extends RenderSchema {
  const RenderBinary({required super.snakeName, required super.pointer});

  @override
  dynamic get defaultValue => null;

  @override
  String typeName(SchemaRenderer context) => 'Uint8List';

  @override
  String equalsExpression(String name, SchemaRenderer context) =>
      'identical($name, other.$name)';

  @override
  bool get createsNewType => false;

  @override
  String jsonStorageType({required bool isNullable}) =>
      'throw UnimplementedError("RenderBinary.jsonStorageType")';

  @override
  String toJsonExpression(
    String dartName,
    SchemaRenderer context, {
    required bool dartIsNullable,
  }) => 'throw UnimplementedError("RenderBinary.toJson")';

  @override
  String fromJsonExpression(
    String jsonValue,
    SchemaRenderer context, {
    required bool jsonIsNullable,
    required bool dartIsNullable,
  }) => 'throw UnimplementedError("RenderBinary.fromJson")';

  @override
  Map<String, dynamic> toTemplateContext(SchemaRenderer context) =>
      throw UnimplementedError('RenderBinary.toTemplateContext');
}
