import 'package:space_gen/src/parse/spec.dart';

/// Subclass this and override the methods you want to visit.
abstract class Visitor {
  void visitHeader(Header header) {}
  void visitOperation(Operation operation) {}
  void visitParameter(Parameter parameter) {}
  void visitPathItem(PathItem pathItem) {}
  void visitRefOr<T extends Parseable>(RefOr<T> refOr) {}
  void visitRequestBody(RequestBody requestBody) {}
  void visitResponse(Response response) {}
  void visitRoot(OpenApi root) {}
  void visitSchema(Schema schema) {}
}

// Would be nice if Dart had a generic way to do this, without needing to
// teach the walker about all the types.
class SpecWalker {
  SpecWalker(this.visitor);

  final Visitor visitor;

  void _walkComponents(Components components) {
    _walkRefs(components.schemas.values);
    _walkRefs(components.parameters.values);
    _walkRefs(components.requestBodies.values);
    _walkRefs(components.responses.values);
    _walkRefs(components.headers.values);
  }

  void _walkRefs<T extends Parseable>(Iterable<RefOr<T>> refs) {
    for (final ref in refs) {
      _refOr(ref);
    }
  }

  void walk(Parseable parseable) {
    switch (parseable) {
      case Header():
        _header(parseable);
      case Parameter():
        _parameter(parseable);
      case RequestBody():
        _requestBody(parseable);
      case Response():
        _response(parseable);
      case Schema():
        walkSchema(parseable);
      case _:
        throw UnimplementedError('Walking $parseable is not implemented');
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
      _refOr(response);
    }
    for (final parameter in operation.parameters) {
      _refOr(parameter);
    }
    _maybeRefOr(operation.requestBody);
  }

  void _parameter(Parameter parameter) {
    visitor.visitParameter(parameter);
    _maybeRefOr(parameter.type);
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
    _maybeRefOr(header.schema);
  }

  void _maybeRefOr<T extends Parseable>(RefOr<T>? ref) {
    if (ref != null) {
      _refOr(ref);
    }
  }

  void _refOr<T extends Parseable>(RefOr<T> refOr) {
    visitor.visitRefOr(refOr);
    final object = refOr.object;
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
    } else if (object is Header) {
      _header(object);
    } else {
      throw UnimplementedError('Unknown ref type: ${object.runtimeType}');
    }
  }

  void _mediaType(MediaType mediaType) {
    // visitor.visitMediaType(mediaType);
    _refOr(mediaType.schema);
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
          _maybeRefOr(property);
        }
        _maybeRefOr(schema.additionalProperties);
      case SchemaArray():
        _maybeRefOr(schema.items);
      case SchemaEnum():
      case SchemaMap():
      case SchemaUnknown():
      case SchemaPod():
      case SchemaInteger():
      case SchemaNumber():
      case SchemaString():
      case SchemaNull():
      case SchemaBinary():
      case SchemaEmptyObject():
        break;
      case SchemaCombiner():
        for (final schema in schema.schemas) {
          _maybeRefOr(schema);
        }
      default:
        throw UnimplementedError('Unknown schema type: ${schema.runtimeType}');
    }
  }
}
