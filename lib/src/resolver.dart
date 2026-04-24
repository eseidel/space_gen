// The job here is to walk the spec and resolve all the references.
// This also creates a tree that is more designed for rendering rather
// than serialization/deserialization with the openapi spec.
// This also discards all non-json values.

import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:space_gen/src/logger.dart';
import 'package:space_gen/src/parse/spec.dart';
import 'package:space_gen/src/parse/visitor.dart';
import 'package:space_gen/src/parser.dart';

void _warn(String message, JsonPointer pointer) {
  logger.warn('$message in $pointer');
}

Never _error(String message, JsonPointer pointer) {
  throw FormatException('$message in $pointer');
}

class ResolveContext {
  ResolveContext({
    required this.specUrl,
    required this.refRegistry,
    required this.globalSecurityRequirements,
    required this.securitySchemes,
    this.nameOverrides = const {},
    Set<JsonPointer>? resolvingStack,
  }) : resolvingStack = resolvingStack ?? {},
       currentDoc = specUrl;

  /// Used for cases where we need a ResolveContext, but don't actually
  /// plan to look up any objects in the registry.
  ResolveContext.test({
    Uri? specUrl,
    RefRegistry? refRegistry,
    this.globalSecurityRequirements = const [],
    List<SecurityScheme>? securitySchemes,
    this.nameOverrides = const {},
    Set<JsonPointer>? resolvingStack,
  }) : specUrl = specUrl ?? Uri.parse('https://example.com'),
       refRegistry = refRegistry ?? RefRegistry(),
       securitySchemes = securitySchemes ?? [],
       resolvingStack = resolvingStack ?? {},
       currentDoc = specUrl ?? Uri.parse('https://example.com');

  /// The spec url of the spec.
  final Uri specUrl;

  /// The URL of the document the resolver is currently reading from.
  /// Refs inside that document are relative to it, so lookup is
  /// `currentDoc.resolveUri(ref.uri)`. For refs from the root spec this
  /// equals [specUrl]; when the resolver crosses into a different file
  /// via an external `$ref`, [withResolved] updates it for the recursion
  /// into the target's contents.
  Uri currentDoc;

  /// The registry of all the objects we've parsed so far.
  final RefRegistry refRegistry;

  /// The global security requirements of the spec.
  final List<ResolvedSecurityRequirement> globalSecurityRequirements;

  /// The security schemes of the spec.
  final List<SecurityScheme> securitySchemes;

  /// Optional name overrides for handling naming collisions
  /// Only contains names that actually changed due to collisions
  final Map<JsonPointer, String> nameOverrides;

  /// Stack of schemas currently being resolved, used to break $ref cycles
  /// (e.g. `Node -> left/right -> Node`). When a cycle is detected the
  /// resolver emits a [ResolvedRecursiveRef] instead of recursing.
  final Set<JsonPointer> resolvingStack;

  CommonProperties resolveCommonProperties(CommonProperties common) {
    final resolvedName = getResolvedName(common.pointer, common.snakeName);
    if (resolvedName != common.snakeName) {
      return common.copyWith(snakeName: resolvedName);
    }
    return common;
  }

  /// Get the resolved name for a pointer, falling back to the original name
  String getResolvedName(JsonPointer pointer, String originalName) {
    return nameOverrides[pointer] ?? originalName;
  }

  /// Resolve [refOr] to its target and invoke [body] with [currentDoc]
  /// pointing at the target's source document. For inline refs (no
  /// `$ref`), [currentDoc] is unchanged; for cross-document refs the
  /// update ensures that refs encountered while resolving the target's
  /// contents resolve against the target's doc, not the caller's.
  ///
  /// This is the only entrypoint for dereferencing a ref — bundling the
  /// resolve with the doc-switch means no call site can forget to
  /// switch.
  R withResolved<T extends Parseable, R>(
    RefOr<T> refOr,
    R Function(T target) body,
  ) {
    final target = refOr.object != null
        ? refOr.object!
        : refRegistry.get<T>(currentDoc.resolveUri(refOr.ref!.uri));
    if (refOr.ref == null) return body(target);
    final prev = currentDoc;
    currentDoc = currentDoc.resolveUri(refOr.ref!.uri).removeFragment();
    try {
      return body(target);
    } finally {
      currentDoc = prev;
    }
  }
}

List<ResolvedPath> _resolvePaths(Paths paths, ResolveContext context) {
  return paths.paths.entries.map((entry) {
    final path = entry.key;
    final pathItem = entry.value;
    return ResolvedPath(
      path: path,
      operations: _resolveOperations(pathItem, context),
    );
  }).toList();
}

ResolvedSchema? _maybeResolveSchemaRef(SchemaRef? ref, ResolveContext context) {
  if (ref == null) {
    return null;
  }
  return resolveSchemaRef(ref, context);
}

ResolvedSchema resolveSchemaRef(SchemaRef ref, ResolveContext context) {
  return context.withResolved(ref, (schema) {
    final createsNewType = shouldCreateNewType(schema);

    // Schema snake_name might change due to collisions, get resolved name.
    final resolvedCommon = context.resolveCommonProperties(schema.common);

    // Only ref-through-a-newtype can cycle (pod/array/map leaves can't
    // $ref back up to themselves). For non-cyclic refs we keep inlining
    // the resolved target as before — preserving existing tests and
    // keeping ResolvedRecursiveRef strictly a cycle-break marker.
    if (createsNewType && ref.ref != null) {
      final targetPointer = schema.pointer;
      if (context.resolvingStack.contains(targetPointer)) {
        return ResolvedRecursiveRef(
          common: resolvedCommon,
          targetPointer: targetPointer,
        );
      }
      context.resolvingStack.add(targetPointer);
      try {
        return _resolveSchemaFully(schema, resolvedCommon, context);
      } finally {
        context.resolvingStack.remove(targetPointer);
      }
    }

    return _resolveSchemaFully(schema, resolvedCommon, context);
  });
}

ResolvedSchema _resolveSchemaFully(
  Schema schema,
  CommonProperties resolvedCommon,
  ResolveContext context,
) {
  final createsNewType = shouldCreateNewType(schema);

  if (schema is SchemaObject) {
    assert(createsNewType, 'SchemaObject should create a new type');
    return ResolvedObject(
      common: resolvedCommon,
      properties: schema.properties.map((key, value) {
        return MapEntry(key, resolveSchemaRef(value, context));
      }),
      additionalProperties: _maybeResolveSchemaRef(
        schema.additionalProperties,
        context,
      ),
      requiredProperties: schema.requiredProperties,
    );
  }
  if (schema is SchemaEnum) {
    assert(createsNewType, 'SchemaEnum should create a new type');
    return ResolvedEnum(
      common: resolvedCommon,
      defaultValue: schema.defaultValue,
      values: schema.enumValues,
      descriptions: schema.enumDescriptions,
    );
  }
  if (schema is SchemaBinary) {
    return ResolvedBinary(
      common: resolvedCommon,
      createsNewType: createsNewType,
    );
  }
  if (schema is SchemaPod) {
    return ResolvedPod(
      common: resolvedCommon,
      type: schema.type,
      createsNewType: createsNewType,
      defaultValue: schema.defaultValue,
    );
  }
  if (schema is SchemaInteger) {
    return ResolvedInteger(
      common: resolvedCommon,
      createsNewType: createsNewType,
      defaultValue: schema.defaultValue,
      maximum: schema.maximum,
      minimum: schema.minimum,
      exclusiveMaximum: schema.exclusiveMaximum,
      exclusiveMinimum: schema.exclusiveMinimum,
      multipleOf: schema.multipleOf,
    );
  }
  if (schema is SchemaString) {
    return ResolvedString(
      common: resolvedCommon,
      createsNewType: createsNewType,
      defaultValue: schema.defaultValue,
      maxLength: schema.maxLength,
      minLength: schema.minLength,
      pattern: schema.pattern,
    );
  }
  if (schema is SchemaNumber) {
    return ResolvedNumber(
      common: resolvedCommon,
      createsNewType: createsNewType,
      defaultValue: schema.defaultValue,
      maximum: schema.maximum,
      minimum: schema.minimum,
      exclusiveMaximum: schema.exclusiveMaximum,
      exclusiveMinimum: schema.exclusiveMinimum,
      multipleOf: schema.multipleOf,
    );
  } else if (schema is SchemaArray) {
    final items = _maybeResolveSchemaRef(schema.items, context);
    if (items == null) {
      _error('items must be a schema for type=array', schema.pointer);
    }
    return ResolvedArray(
      common: resolvedCommon,
      items: items,
      createsNewType: createsNewType,
      defaultValue: schema.defaultValue,
      maxItems: schema.maxItems,
      minItems: schema.minItems,
      uniqueItems: schema.uniqueItems,
    );
  }
  if (schema is SchemaOneOf) {
    assert(createsNewType, 'SchemaOneOf should create a new type');
    final oneOf = schema;
    return ResolvedOneOf(
      common: resolvedCommon,
      schemas: oneOf.schemas.map((e) => resolveSchemaRef(e, context)).toList(),
    );
  }
  if (schema is SchemaAllOf) {
    assert(createsNewType, 'SchemaAllOf should create a new type');
    final allOf = schema;
    final schemas = allOf.schemas
        .map((e) => resolveSchemaRef(e, context))
        .toList();
    // Elide the allOf if there is only one schema.
    // Probably should only do this for the pod case?  Since in the object
    // case allOf should probably create a new object?
    if (schemas.length == 1) {
      return schemas.first;
    }
    for (final schema in schemas) {
      if (schema is! ResolvedObject) {
        _error('allOf only supports objects: $schema', allOf.pointer);
      }
    }
    return ResolvedAllOf(common: resolvedCommon, schemas: schemas);
  }
  if (schema is SchemaAnyOf) {
    assert(createsNewType, 'SchemaAnyOf should create a new type');
    final anyOf = schema;
    final schemas = anyOf.schemas
        .map((e) => resolveSchemaRef(e, context))
        .toList();
    final forceNullable = schemas.any((e) => e is ResolvedNull);
    if (forceNullable) {
      schemas.removeWhere((e) => e is ResolvedNull);
    }
    ResolvedSchema copyIfNeeded(
      ResolvedSchema schema, {
      bool forceNullable = false,
    }) {
      final common = schema.common.copyWith(nullable: forceNullable);
      return schema.copyWith(common: common);
    }

    // Elide the anyOf if there is only only one schema left.
    if (schemas.length == 1) {
      return copyIfNeeded(schemas.first, forceNullable: forceNullable);
    }
    // TODO(eseidel): Make this union(object, List<object>) hack optional.
    // Dart doesn't have union types, but commonly openapi specs come from
    // typescript where foo(bar) and foo([bar]) are the same, we elide the
    // anyOf and just use the array in that case.
    if (schemas.length == 2) {
      final first = schemas.first;
      final second = schemas.last;
      if (first is ResolvedArray && first.items == second) {
        return first;
      } else if (second is ResolvedArray && second.items == first) {
        return second;
      }
    }
    return ResolvedAnyOf(common: resolvedCommon, schemas: schemas);
  }
  if (schema is SchemaNull) {
    assert(!createsNewType, 'SchemaNull should not create a new type');
    return ResolvedNull(common: resolvedCommon);
  }
  if (schema is SchemaUnknown) {
    return ResolvedUnknown(
      common: resolvedCommon,
      createsNewType: createsNewType,
    );
  }
  if (schema is SchemaMap) {
    final keyRef = schema.keySchema;
    final keySchema = keyRef == null ? null : resolveSchemaRef(keyRef, context);
    if (keySchema != null && keySchema is! ResolvedEnum) {
      _error(
        'propertyNames must resolve to a string enum for a map-typed '
        r'schema. Either use a $ref to a named string enum or an inline '
        'string enum. Got: ${keySchema.runtimeType}',
        schema.pointer,
      );
    }
    return ResolvedMap(
      common: resolvedCommon,
      valueSchema: resolveSchemaRef(schema.valueSchema, context),
      keySchema: keySchema as ResolvedEnum?,
      createsNewType: createsNewType,
    );
  }
  if (schema is SchemaEmptyObject) {
    assert(createsNewType, 'SchemaEmptyObject should create a new type');
    return ResolvedEmptyObject(common: resolvedCommon);
  }
  _error('Missing code to resolve schema: $schema', schema.pointer);
}

ResolvedRequestBody? _resolveRequestBody(
  RefOr<RequestBody>? ref,
  ResolveContext context,
) {
  if (ref == null) {
    return null;
  }
  return context.withResolved(ref, (requestBody) {
    final content = requestBody.content;
    // MimeType.values is declaration-ordered, which defines precedence:
    // JSON first, then multipart, then octet-stream, then text/plain. When
    // a spec offers both JSON and multipart on the same body (rare), JSON
    // wins because it's the well-formed choice.
    for (final mimeType in MimeType.values) {
      final schema = content[mimeType.value]?.schema;
      if (schema != null) {
        return ResolvedRequestBody(
          mimeType: mimeType,
          schema: resolveSchemaRef(schema, context),
          description: requestBody.description,
          isRequired: requestBody.isRequired,
        );
      }
    }
    final supported = MimeType.values.map((m) => m.value).join(', ');
    _error(
      'Request body has no schema for any supported content type '
      '($supported)',
      requestBody.pointer,
    );
  });
}

bool _canBePathParameter(ResolvedSchema schema) {
  if (schema is ResolvedString || schema is ResolvedInteger) {
    return true;
  }
  if (schema is ResolvedOneOf) {
    return schema.schemas.every(_canBePathParameter);
  }

  /// Note this will be wrong if we support non-string, non-integer enums.
  if (schema is ResolvedEnum) {
    return true;
  }
  return false;
}

List<ResolvedParameter> _resolveParameters(
  List<RefOr<Parameter>> parameters,
  ResolveContext context,
) {
  return parameters.map((parameter) {
    return context.withResolved(parameter, (resolved) {
      final type = resolveSchemaRef(resolved.type, context);
      if (resolved.inLocation == ParameterLocation.path &&
          !_canBePathParameter(type)) {
        _error(
          'Path parameters must be strings or integers',
          resolved.pointer,
        );
      }
      return ResolvedParameter(
        name: resolved.name,
        inLocation: resolved.inLocation,
        description: resolved.description,
        isRequired: resolved.isRequired,
        isDeprecated: resolved.isDeprecated,
        schema: type,
      );
    });
  }).toList();
}

ResolvedSecurityRequirement _resolveSecurityRequirement({
  required SecurityRequirement requirement,
  required List<SecurityScheme> securitySchemes,
}) {
  // Walk the conditions of the requirement and resolve each security scheme.
  final conditions = requirement.conditions.map((name, value) {
    final securityScheme = securitySchemes.firstWhereOrNull(
      (scheme) => scheme.name == name,
    );
    if (securityScheme == null) {
      _error(
        'Security scheme not found with name "$name"',
        requirement.pointer,
      );
    }
    return MapEntry(securityScheme, value);
  });
  return ResolvedSecurityRequirement(conditions: conditions);
}

List<ResolvedSecurityRequirement> _resolveSecurityRequirements({
  required List<SecurityRequirement>? securityRequirements,
  required List<SecurityScheme> securitySchemes,
  required List<ResolvedSecurityRequirement> globalSecurityRequirements,
}) {
  // null: `security` key was absent on the operation → inherit global.
  // empty: `security: []` was specified → explicit no-auth override,
  // return empty so rendering emits no authRequest argument.
  if (securityRequirements == null) {
    return globalSecurityRequirements;
  }

  // Security requirements are looked up by name, not reference.
  final resolved = securityRequirements.map((requirement) {
    return _resolveSecurityRequirement(
      requirement: requirement,
      securitySchemes: securitySchemes,
    );
  }).toList();
  return resolved;
}

ResolvedOperation resolveOperation({
  required String path,
  required Method method,
  required Operation operation,
  required ResolveContext context,
  List<ResolvedParameter> pathItemParameters = const [],
}) {
  final requestBody = _resolveRequestBody(operation.requestBody, context);
  final responses = _resolveResponses(operation.responses, context);
  final rangeResponses = _resolveRangeResponses(
    operation.responses.rangeResponses,
    context,
  );
  final defaultResponse = _resolveDefaultResponse(
    operation.responses.defaultResponse,
    context,
  );

  // Need to resolve any local security requirements, or otherwise fall back to
  // the global security requirements.
  final securityRequirements = _resolveSecurityRequirements(
    securityRequirements: operation.securityRequirements,
    securitySchemes: context.securitySchemes,
    globalSecurityRequirements: context.globalSecurityRequirements,
  );

  // Operation snake_name might change due to collisions, get resolved name.
  final resolvedName = context.getResolvedName(
    operation.pointer,
    operation.snakeName,
  );

  return ResolvedOperation(
    pointer: operation.pointer,
    snakeName: resolvedName,
    tags: operation.tags,
    summary: operation.summary,
    description: operation.description,
    method: method,
    path: path,
    requestBody: requestBody,
    responses: responses,
    rangeResponses: rangeResponses,
    defaultResponse: defaultResponse,
    parameters: _mergeParameters(
      pathItemParameters,
      _resolveParameters(operation.parameters, context),
    ),
    securityRequirements: securityRequirements,
  );
}

/// Merges path-item-level parameters with operation-level parameters.
///
/// OpenAPI 3.x uniqueness for a parameter is (name, in). Operation-level
/// parameters override path-item-level parameters with the same key; any
/// remaining path-item-level parameters are kept in their original order
/// ahead of operation-only parameters.
List<ResolvedParameter> _mergeParameters(
  List<ResolvedParameter> pathItemParameters,
  List<ResolvedParameter> operationParameters,
) {
  if (pathItemParameters.isEmpty) return operationParameters;
  String key(ResolvedParameter p) => '${p.inLocation.name}:${p.name}';
  final operationKeys = operationParameters.map(key).toSet();
  return [
    ...pathItemParameters.where((p) => !operationKeys.contains(key(p))),
    ...operationParameters,
  ];
}

List<ResolvedOperation> _resolveOperations(
  PathItem pathItem,
  ResolveContext context,
) {
  final pathItemParameters = _resolveParameters(
    pathItem.parameters,
    context,
  );
  return pathItem.operations.entries.map((entry) {
    return resolveOperation(
      path: pathItem.path,
      method: entry.key,
      operation: entry.value,
      context: context,
      pathItemParameters: pathItemParameters,
    );
  }).toList();
}

ResolvedSchema _resolveContent(Response response, ResolveContext context) {
  final content = response.content;
  final voidSchema = ResolvedVoid(
    // TODO(eseidel): Should this pass along description?
    common: CommonProperties.empty(
      pointer: response.pointer,
      snakeName: 'void',
    ),
  );
  if (content == null) {
    return voidSchema;
  }
  if (content.isEmpty) {
    _warn('Response has no content: $response', response.pointer);
    return voidSchema;
  }
  final jsonSchema = content['application/json']?.schema;
  if (jsonSchema != null) {
    return resolveSchemaRef(jsonSchema, context);
  }
  _warn('Response has no application/json schema: $response', response.pointer);
  return resolveSchemaRef(content.values.first.schema, context);
}

List<ResolvedResponse> _resolveResponses(
  Responses responses,
  ResolveContext context,
) {
  return responses.responses.entries.map((entry) {
    final statusCode = entry.key;
    return context.withResolved(
      entry.value,
      (response) => ResolvedResponse(
        statusCode: statusCode,
        description: response.description,
        content: _resolveContent(response, context),
      ),
    );
  }).toList();
}

List<ResolvedRangeResponse> _resolveRangeResponses(
  Map<StatusCodeRange, RefOr<Response>> rangeResponses,
  ResolveContext context,
) {
  return rangeResponses.entries.map((entry) {
    final range = entry.key;
    return context.withResolved(
      entry.value,
      (response) => ResolvedRangeResponse(
        range: range,
        description: response.description,
        content: _resolveContent(response, context),
      ),
    );
  }).toList();
}

ResolvedDefaultResponse? _resolveDefaultResponse(
  RefOr<Response>? ref,
  ResolveContext context,
) {
  if (ref == null) return null;
  return context.withResolved(
    ref,
    (response) => ResolvedDefaultResponse(
      description: response.description,
      content: _resolveContent(response, context),
    ),
  );
}

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

ResolvedTag _resolvedTag(Tag tag) {
  return ResolvedTag(name: tag.name, description: tag.description);
}

bool isTopLevelComponent(JsonPointer pointer) {
  if (pointer.parts.length != 3) {
    return false;
  }
  final first = pointer.parts[0];
  final second = pointer.parts[1];
  return first == 'components' && second == 'schemas';
}

bool shouldCreateNewType(Schema schema) {
  switch (schema) {
    case SchemaString():
    case SchemaNumber():
    case SchemaArray():
    case SchemaMap():
    case SchemaNull():
    case SchemaUnknown():
    case SchemaPod():
    case SchemaBinary():
    case SchemaNumeric():
      // OpenApi creates a new file for each top level component, even
      // if it's a simple type.  Matching this behavior for now.
      return isTopLevelComponent(schema.pointer);
    case SchemaObjectBase():
    case SchemaEmptyObject():
    case SchemaEnum():
      return true;
  }
}

/// Collects all snake names from the parse tree to detect collisions
class _NameCollector extends Visitor {
  _NameCollector(this._nameToPointers);

  final Map<String, List<JsonPointer>> _nameToPointers;

  @override
  void visitSchema(Schema schema) {
    // We only need to worry about collisions schemas that create new types.
    if (!shouldCreateNewType(schema)) {
      return;
    }
    _nameToPointers.putIfAbsent(schema.snakeName, () => []).add(schema.pointer);
  }

  @override
  void visitOperation(Operation op) {
    _nameToPointers.putIfAbsent(op.snakeName, () => []).add(op.pointer);
  }
}

Map<String, List<JsonPointer>> _collectNames(OpenApi spec) {
  final nameToPointers = <String, List<JsonPointer>>{};
  final collector = _NameCollector(nameToPointers);
  SpecWalker(collector).walkRoot(spec);
  return nameToPointers;
}

// TODO(eseidel): Provide a set of all used names so it can avoid colliding
// with existing names.
List<String> defaultGenerateUniqueNames(
  String name,
  List<JsonPointer> pointers,
) {
  final newNames = <String>[];
  for (var index = 0; index < pointers.length; index++) {
    final suffix = index == 0 ? '' : '_$index';
    newNames.add('$name$suffix');
  }
  return newNames;
}

Map<JsonPointer, String> _resolveCollisions(
  Map<String, List<JsonPointer>> nameToPointers, {
  List<String> Function(String name, List<JsonPointer> pointers)
      generateUniqueNames =
      defaultGenerateUniqueNames,
}) {
  final changedNames = <JsonPointer, String>{};
  for (final entry in nameToPointers.entries) {
    final name = entry.key;
    final pointers = entry.value;
    if (pointers.length < 2) {
      continue;
    }
    final newNames = generateUniqueNames(name, pointers);
    for (final (index, pointer) in pointers.indexed) {
      logger.detail('Collision: $name -> ${newNames[index]} @ $pointer');
      changedNames[pointer] = newNames[index];
    }
  }
  return changedNames;
}

Map<JsonPointer, String> resolveNameCollisions(OpenApi spec) {
  final nameToPointers = _collectNames(spec);
  return _resolveCollisions(nameToPointers);
}

ResolvedSpec resolveSpec(
  OpenApi spec, {
  required Uri specUrl,
  bool logSchemas = true,
  Map<JsonPointer, String> nameOverrides = const {},
  RefRegistry? refRegistry,
}) {
  // Walk and look for snake_name collisions.
  final nameOverrides = resolveNameCollisions(spec);
  if (nameOverrides.isNotEmpty) {
    logger.detail('Resolved ${nameOverrides.length} naming collisions');
  }

  // When the caller prebuilt a registry (e.g. to pre-load externally-ref'd
  // docs before resolution), use it; otherwise build one from just the
  // root spec.
  final registry = refRegistry ?? RefRegistry();
  if (refRegistry == null) {
    SpecWalker(RegistryBuilder(specUrl, registry)).walkRoot(spec);
  }

  if (logSchemas) {
    logger.detail('Registered schemas:');
    for (final uri in registry.uris) {
      logger.detail('  - $uri');
    }
  }
  // Need to have resolved security schemes before resolving paths.
  final securitySchemes = spec.components.securitySchemes;
  final globalSecurityRequirements = _resolveSecurityRequirements(
    securityRequirements: spec.securityRequirements,
    securitySchemes: securitySchemes,
    // Don't pass any global security requirements, to disable the fallback
    // behavior while resolving the actual global security requirements.
    globalSecurityRequirements: [],
  );
  final context = ResolveContext(
    specUrl: specUrl,
    refRegistry: registry,
    globalSecurityRequirements: globalSecurityRequirements,
    securitySchemes: securitySchemes,
    nameOverrides: nameOverrides,
  );
  return ResolvedSpec(
    title: spec.info.title,
    serverUrl: spec.serverUrl,
    paths: _resolvePaths(spec.paths, context),
    tags: spec.tags.map(_resolvedTag).toList(),
  );
}

class ResolvedTag {
  const ResolvedTag({required this.name, required this.description});

  /// The name of the resolved tag.
  final String name;

  /// The description of the resolved tag.
  final String? description;
}

class ResolvedSpec {
  const ResolvedSpec({
    required this.serverUrl,
    required this.title,
    required this.paths,
    required this.tags,
  });

  /// The server url of the spec.
  final Uri serverUrl;

  /// The title of the spec.
  final String title;

  /// The paths of the spec.
  final List<ResolvedPath> paths;

  /// The tags of the spec.
  final List<ResolvedTag> tags;
}

class ResolvedPath {
  const ResolvedPath({required this.path, required this.operations});

  /// The path of the resolved path.
  final String path;

  /// The operations of the resolved path.
  final List<ResolvedOperation> operations;
}

class ResolvedParameter {
  const ResolvedParameter({
    required this.name,
    required this.inLocation,
    required this.description,
    required this.isRequired,
    required this.isDeprecated,
    required this.schema,
  });

  /// The name of the resolved parameter.
  final String name;

  /// The in of the resolved parameter.
  final ParameterLocation inLocation;

  /// The description of the resolved parameter.
  final String? description;

  /// Whether the parameter is required.
  final bool isRequired;

  /// Whether the parameter is deprecated.
  final bool isDeprecated;

  /// The schema of the resolved parameter.
  final ResolvedSchema schema;
}

class ResolvedRequestBody {
  const ResolvedRequestBody({
    required this.schema,
    required this.description,
    required this.isRequired,
    required this.mimeType,
  });

  /// The mime type of the resolved request body.
  final MimeType mimeType;

  /// The schema of the resolved request body.
  final ResolvedSchema schema;

  /// The description of the resolved request body.
  final String? description;

  /// Whether the request body is required.
  final bool isRequired;
}

class ResolvedSecurityRequirement {
  const ResolvedSecurityRequirement({required this.conditions});

  /// The conditions imposed by this security requirement.
  /// Keys are security schemes, and values are the scopes (or roles)
  /// associated with the security scheme.
  final Map<SecurityScheme, List<String>> conditions;
}

class ResolvedOperation {
  const ResolvedOperation({
    required this.method,
    required this.path,
    required this.pointer,
    required this.snakeName,
    required this.requestBody,
    required this.responses,
    required this.rangeResponses,
    required this.defaultResponse,
    required this.tags,
    required this.summary,
    required this.description,
    required this.parameters,
    required this.securityRequirements,
  });

  /// The method of the resolved operation.
  final Method method;

  /// The pointer of the resolved operation.
  final JsonPointer pointer;

  /// The path of the resolved operation.
  final String path;

  /// The snake name of the resolved operation.
  final String snakeName;

  /// The parameters of the resolved operation.
  final List<ResolvedParameter> parameters;

  /// The request body of the resolved operation.
  final ResolvedRequestBody? requestBody;

  /// The responses of the resolved operation. Only contains responses
  /// keyed by a specific status code — range (`NXX`) responses are on
  /// [rangeResponses] and the `default:` response (if any) is on
  /// [defaultResponse].
  final List<ResolvedResponse> responses;

  /// The range (`NXX`) responses of the resolved operation, if any.
  final List<ResolvedRangeResponse> rangeResponses;

  /// The `default:` (catch-all) response, if the operation declares one.
  final ResolvedDefaultResponse? defaultResponse;

  /// The tags of the resolved operation.
  final List<String> tags;

  /// The summary of the resolved operation.
  final String? summary;

  /// The description of the resolved operation.
  final String? description;

  /// The security requirements of the resolved operation.
  final List<ResolvedSecurityRequirement> securityRequirements;
}

class ResolvedResponse {
  const ResolvedResponse({
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
  final ResolvedSchema content;
}

/// A range (`NXX`) response on an operation. Shares the description +
/// content shape with [ResolvedResponse] but is keyed by a
/// [StatusCodeRange] rather than an exact code.
class ResolvedRangeResponse {
  const ResolvedRangeResponse({
    required this.range,
    required this.description,
    required this.content,
  });

  /// Which `NXX` range this response covers.
  final StatusCodeRange range;

  /// The description of the resolved range response.
  final String description;

  /// The resolved content of the resolved range response.
  /// We only support json, so we only need a single content.
  final ResolvedSchema content;
}

/// The `default:` (catch-all) response on an operation. Shares the
/// description + content shape with [ResolvedResponse] but carries no
/// status code.
class ResolvedDefaultResponse {
  const ResolvedDefaultResponse({
    required this.description,
    required this.content,
  });

  /// The description of the resolved default response.
  final String description;

  /// The resolved content of the resolved default response.
  /// We only support json, so we only need a single content.
  final ResolvedSchema content;
}

abstract class ResolvedSchema extends Equatable {
  const ResolvedSchema({required this.common, required this.createsNewType});

  final CommonProperties common;

  /// Whether this schema creates a new type and thus needs to be rendered.
  final bool createsNewType;

  JsonPointer get pointer => common.pointer;

  String get snakeName => common.snakeName;

  ResolvedSchema copyWith({CommonProperties? common});

  @override
  List<Object?> get props => [common];

  @override
  String toString() => '$runtimeType(snakeName: $snakeName, pointer: $pointer)';
}

class ResolvedString extends ResolvedSchema {
  const ResolvedString({
    required super.common,
    required super.createsNewType,
    this.defaultValue,
    this.maxLength,
    this.minLength,
    this.pattern,
  });

  /// The default value of the resolved schema.
  final String? defaultValue;

  /// The maximum length of the resolved schema.
  final int? maxLength;

  /// The minimum length of the resolved schema.
  final int? minLength;

  /// The pattern to match the string against.
  final String? pattern;

  @override
  ResolvedString copyWith({CommonProperties? common}) {
    return ResolvedString(
      common: common ?? this.common,
      createsNewType: createsNewType,
      defaultValue: defaultValue,
      maxLength: maxLength,
      minLength: minLength,
      pattern: pattern,
    );
  }

  @override
  List<Object?> get props => [
    super.props,
    defaultValue,
    maxLength,
    minLength,
    pattern,
  ];
}

abstract class ResolvedNumeric<T extends num> extends ResolvedSchema {
  const ResolvedNumeric({
    required super.common,
    required super.createsNewType,
    this.defaultValue,
    this.maximum,
    this.minimum,
    this.exclusiveMaximum,
    this.exclusiveMinimum,
    this.multipleOf,
  });

  /// The default value of the resolved schema.
  final T? defaultValue;

  /// The maximum value of the resolved schema.
  final T? maximum;

  /// The minimum value of the resolved schema.
  final T? minimum;

  /// The exclusive maximum value of the resolved schema.
  final T? exclusiveMaximum;

  /// The exclusive minimum value of the resolved schema.
  final T? exclusiveMinimum;

  /// The multiple of value of the resolved schema.
  final T? multipleOf;

  @override
  List<Object?> get props => [
    super.props,
    maximum,
    minimum,
    exclusiveMaximum,
    exclusiveMinimum,
    multipleOf,
  ];
}

class ResolvedNumber extends ResolvedNumeric<double> {
  const ResolvedNumber({
    required super.common,
    required super.createsNewType,
    super.maximum,
    super.minimum,
    super.exclusiveMaximum,
    super.exclusiveMinimum,
    super.multipleOf,
    super.defaultValue,
  });

  @override
  ResolvedNumber copyWith({CommonProperties? common}) {
    return ResolvedNumber(
      common: common ?? this.common,
      createsNewType: createsNewType,
      defaultValue: defaultValue,
      maximum: maximum,
      minimum: minimum,
      exclusiveMaximum: exclusiveMaximum,
      exclusiveMinimum: exclusiveMinimum,
      multipleOf: multipleOf,
    );
  }
}

class ResolvedInteger extends ResolvedNumeric<int> {
  const ResolvedInteger({
    required super.common,
    required super.createsNewType,
    super.maximum,
    super.minimum,
    super.exclusiveMaximum,
    super.exclusiveMinimum,
    super.multipleOf,
    super.defaultValue,
  });

  @override
  ResolvedInteger copyWith({CommonProperties? common}) {
    return ResolvedInteger(
      common: common ?? this.common,
      createsNewType: createsNewType,
      defaultValue: defaultValue,
      maximum: maximum,
      minimum: minimum,
      exclusiveMaximum: exclusiveMaximum,
      exclusiveMinimum: exclusiveMinimum,
      multipleOf: multipleOf,
    );
  }
}

// TODO(eseidel): defaultValue should be strongly typed.
class ResolvedPod extends ResolvedSchema {
  const ResolvedPod({
    required super.common,
    required this.type,
    required super.createsNewType,
    this.defaultValue,
  });

  /// The type of the resolved schema.
  final PodType type;

  /// The default value of the pop type.
  final dynamic defaultValue;

  @override
  ResolvedPod copyWith({CommonProperties? common}) {
    return ResolvedPod(
      common: common ?? this.common,
      type: type,
      createsNewType: createsNewType,
      defaultValue: defaultValue,
    );
  }

  @override
  List<Object?> get props => [super.props, type, defaultValue];
}

class ResolvedArray extends ResolvedSchema {
  const ResolvedArray({
    required super.common,
    required this.items,
    required super.createsNewType,
    this.defaultValue,
    this.maxItems,
    this.minItems,
    this.uniqueItems = false,
  });

  /// type of the items in the array
  final ResolvedSchema items;

  /// The maximum number of items in the array.
  final int? maxItems;

  /// The minimum number of items in the array.
  final int? minItems;

  /// Whether the items in the array must be unique.
  final bool uniqueItems;

  /// The default value of the array type.
  final dynamic defaultValue;

  @override
  ResolvedArray copyWith({CommonProperties? common}) {
    return ResolvedArray(
      common: common ?? this.common,
      items: items,
      createsNewType: createsNewType,
      defaultValue: defaultValue,
      maxItems: maxItems,
      minItems: minItems,
      uniqueItems: uniqueItems,
    );
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
}

class ResolvedEnum extends ResolvedSchema {
  const ResolvedEnum({
    required super.common,
    required this.defaultValue,
    required this.values,
    required this.descriptions,
  }) : super(createsNewType: true);

  /// The values of the resolved schema.
  // If we support non-string, non-integer enums, we will need to fix path
  // parameter validation to only allow string and integer enum types.
  final List<String> values;

  /// The default value of the enum type.
  final dynamic defaultValue;

  /// Optional per-value dartdoc descriptions, parallel to [values].
  final List<String>? descriptions;

  @override
  ResolvedEnum copyWith({CommonProperties? common}) {
    return ResolvedEnum(
      common: common ?? this.common,
      defaultValue: defaultValue,
      values: values,
      descriptions: descriptions,
    );
  }

  @override
  List<Object?> get props => [super.props, values, defaultValue, descriptions];
}

class ResolvedObject extends ResolvedSchema {
  const ResolvedObject({
    required super.common,
    required this.properties,
    required this.additionalProperties,
    required this.requiredProperties,
  }) : super(createsNewType: true);

  /// The properties of the resolved schema.
  final Map<String, ResolvedSchema> properties;

  /// The value type when the schema is a map.
  // TODO(eseidel): Should this be a separate type?
  final ResolvedSchema? additionalProperties;

  /// The required properties of the resolved schema.
  final List<String> requiredProperties;

  @override
  ResolvedObject copyWith({CommonProperties? common}) {
    return ResolvedObject(
      common: common ?? this.common,
      properties: properties,
      additionalProperties: additionalProperties,
      requiredProperties: requiredProperties,
    );
  }

  @override
  List<Object?> get props => [
    super.props,
    properties,
    additionalProperties,
    requiredProperties,
  ];
}

/// An unknown schema, typically means empty (e.g. schema: {})
class ResolvedUnknown extends ResolvedSchema {
  const ResolvedUnknown({required super.common, required super.createsNewType});

  @override
  ResolvedUnknown copyWith({CommonProperties? common}) {
    return ResolvedUnknown(
      common: common ?? this.common,
      createsNewType: createsNewType,
    );
  }
}

abstract class ResolvedSchemaCollection extends ResolvedSchema {
  const ResolvedSchemaCollection({
    required super.common,
    required super.createsNewType,
    required this.schemas,
  });

  /// The schemas of the resolved schema collection.
  final List<ResolvedSchema> schemas;

  @override
  List<Object?> get props => [super.props, schemas];
}

class ResolvedOneOf extends ResolvedSchemaCollection {
  const ResolvedOneOf({required super.schemas, required super.common})
    : super(createsNewType: true);

  @override
  ResolvedOneOf copyWith({CommonProperties? common}) {
    return ResolvedOneOf(common: common ?? this.common, schemas: schemas);
  }
}

class ResolvedAnyOf extends ResolvedSchemaCollection {
  const ResolvedAnyOf({required super.schemas, required super.common})
    : super(createsNewType: true);

  @override
  ResolvedAnyOf copyWith({CommonProperties? common}) {
    return ResolvedAnyOf(common: common ?? this.common, schemas: schemas);
  }
}

class ResolvedAllOf extends ResolvedSchemaCollection {
  const ResolvedAllOf({required super.schemas, required super.common})
    : super(createsNewType: true);

  @override
  ResolvedAllOf copyWith({CommonProperties? common}) {
    return ResolvedAllOf(common: common ?? this.common, schemas: schemas);
  }
}

class ResolvedVoid extends ResolvedSchema {
  const ResolvedVoid({required super.common}) : super(createsNewType: false);

  @override
  ResolvedVoid copyWith({CommonProperties? common}) {
    return ResolvedVoid(common: common ?? this.common);
  }
}

class ResolvedBinary extends ResolvedSchema {
  const ResolvedBinary({required super.common, required super.createsNewType});

  @override
  ResolvedBinary copyWith({CommonProperties? common}) {
    return ResolvedBinary(
      common: common ?? this.common,
      createsNewType: createsNewType,
    );
  }
}

class ResolvedNull extends ResolvedSchema {
  const ResolvedNull({required super.common}) : super(createsNewType: false);

  @override
  ResolvedNull copyWith({CommonProperties? common}) {
    return ResolvedNull(common: common ?? this.common);
  }
}

class ResolvedMap extends ResolvedSchema {
  const ResolvedMap({
    required super.common,
    required this.valueSchema,
    required this.keySchema,
    required super.createsNewType,
  });

  final ResolvedSchema valueSchema;

  /// Optional typed key schema. Must resolve to a string enum.
  final ResolvedEnum? keySchema;

  @override
  ResolvedMap copyWith({CommonProperties? common}) {
    return ResolvedMap(
      common: common ?? this.common,
      valueSchema: valueSchema,
      keySchema: keySchema,
      createsNewType: createsNewType,
    );
  }
}

class ResolvedEmptyObject extends ResolvedSchema {
  const ResolvedEmptyObject({required super.common})
    : super(createsNewType: true);

  @override
  ResolvedEmptyObject copyWith({CommonProperties? common}) {
    return ResolvedEmptyObject(common: common ?? this.common);
  }
}

class ResolvedRecursiveRef extends ResolvedSchema {
  const ResolvedRecursiveRef({
    required super.common,
    required this.targetPointer,
  }) : super(createsNewType: false);

  /// The pointer to the referenced schema in the registry
  final JsonPointer targetPointer;

  @override
  ResolvedRecursiveRef copyWith({CommonProperties? common}) {
    return ResolvedRecursiveRef(
      common: common ?? this.common,
      targetPointer: targetPointer,
    );
  }

  @override
  List<Object?> get props => [super.props, targetPointer];
}
