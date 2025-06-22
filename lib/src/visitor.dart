import 'package:space_gen/src/spec.dart';

/// Subclass this and override the methods you want to visit.
abstract class Visitor {
  void visitHeader(Header header) {}
  void visitOperation(Operation operation) {}
  void visitParameter(Parameter parameter) {}
  void visitPathItem(PathItem pathItem) {}
  void visitReference<T>(RefOr<T> ref) {}
  void visitRequestBody(RequestBody requestBody) {}
  void visitResponse(Response response) {}
  void visitRoot(OpenApi root) {}
  void visitSchema(Schema schema) {}
}

class _RefCollector extends Visitor {
  _RefCollector(this._refs);

  final Set<String> _refs;

  @override
  void visitReference<T>(RefOr<T> ref) {
    if (ref.ref != null) {
      _refs.add(ref.ref!);
    }
  }
}

Iterable<String> collectRefs(OpenApi root) {
  final refs = <String>{};
  final collector = _RefCollector(refs);
  SpecWalker(collector).walkRoot(root);
  return refs;
}

// Would be nice if Dart had a generic way to do this, without needing to
// teach the walker about all the types.
class SpecWalker {
  SpecWalker(this.visitor);

  final Visitor visitor;

  void _walkComponents(Components components) {
    for (final schema in components.schemas.values) {
      walkSchema(schema);
    }
    for (final parameter in components.parameters.values) {
      _parameter(parameter);
    }
    for (final requestBody in components.requestBodies.values) {
      _requestBody(requestBody);
    }
    for (final response in components.responses.values) {
      _response(response);
    }
    for (final header in components.headers.values) {
      _header(header);
    }
  }

  void walkRoot(OpenApi root) {
    visitor.visitRoot(root);
    for (final path in root.paths.paths.values) {
      walkPathItem(path);
    }
    _walkComponents(root.components);
  }

  void walkPathItem(PathItem pathItem) {
    visitor.visitPathItem(pathItem);
    // for (final parameter in pathItem.parameters) {
    //   _parameter(parameter);
    // }
    for (final operation in pathItem.operations.values) {
      _operation(operation);
    }
  }

  void _operation(Operation operation) {
    visitor.visitOperation(operation);
    for (final response in operation.responses.responses.values) {
      _ref(response);
    }
    for (final parameter in operation.parameters) {
      _ref(parameter);
    }
    _maybeRef(operation.requestBody);
  }

  void _parameter(Parameter parameter) {
    visitor.visitParameter(parameter);
    _maybeRef(parameter.type);
  }

  void _response(Response response) {
    visitor.visitResponse(response);
    final content = response.content;
    if (content != null) {
      for (final mediaType in content.values) {
        _mediaType(mediaType);
      }
    }
  }

  void _header(Header header) {
    visitor.visitHeader(header);
    _maybeRef(header.schema);
  }

  void _maybeRef<T>(RefOr<T>? ref) {
    if (ref != null) {
      _ref(ref);
    }
  }

  void _ref<T>(RefOr<T> ref) {
    visitor.visitReference(ref);
    final object = ref.object;
    if (object == null) {
      return;
    }
    if (object is Schema) {
      walkSchema(object);
    } else if (object is RequestBody) {
      _requestBody(object);
    } else if (object is Parameter) {
      _parameter(object);
    } else if (object is Response) {
      _response(object);
    } else {
      throw UnimplementedError('Unknown ref type: ${object.runtimeType}');
    }
  }

  void _mediaType(MediaType mediaType) {
    // visitor.visitMediaType(mediaType);
    _ref(mediaType.schema);
  }

  void _requestBody(RequestBody requestBody) {
    visitor.visitRequestBody(requestBody);
    for (final mediaType in requestBody.content.values) {
      _mediaType(mediaType);
    }
  }

  void walkSchema(Schema schema) {
    visitor.visitSchema(schema);
    switch (schema) {
      case SchemaObject():
        for (final property in schema.properties.values) {
          _maybeRef(property);
        }
        _maybeRef(schema.additionalProperties);
      case SchemaArray():
        _maybeRef(schema.items);
      case SchemaEnum():
      case SchemaMap():
      case SchemaUnknown():
      case SchemaPod():
      case SchemaNull():
      case SchemaBinary():
        break;
      case SchemaCombiner():
        for (final schema in schema.schemas) {
          _maybeRef(schema);
        }
      default:
        throw UnimplementedError('Unknown schema type: ${schema.runtimeType}');
    }
  }
}
