import 'package:space_gen/src/spec.dart';

/// Subclass this and override the methods you want to visit.
abstract class Visitor {
  void visitRoot(OpenApi root) {}
  void visitPathItem(PathItem pathItem) {}
  void visitOperation(Operation operation) {}
  void visitParameter(Parameter parameter) {}
  void visitReference<T>(RefOr<T> ref) {}
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

  void walkRoot(OpenApi root) {
    visitor.visitRoot(root);
    for (final path in root.paths.paths.values) {
      _pathItem(path);
    }
  }

  void _pathItem(PathItem pathItem) {
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
      final content = response.content;
      if (content == null) {
        continue;
      }
      for (final mediaType in content.values) {
        _ref(mediaType.schema);
      }
    }
    for (final parameter in operation.parameters) {
      _parameter(parameter);
    }
    _maybeRef(operation.requestBody);
  }

  void _parameter(Parameter parameter) {
    visitor.visitParameter(parameter);
    _maybeRef(parameter.type);
  }

  void _maybeRef<T>(RefOr<T>? ref) {
    if (ref != null) {
      _ref(ref);
    }
  }

  void _ref<T>(RefOr<T> ref) {
    visitor.visitReference(ref);
    final object = ref.object;
    if (object is Schema?) {
      _maybeSchema(object);
    }
  }

  void _maybeSchema(Schema? schema) {
    if (schema != null) {
      _schema(schema);
    }
  }

  void _schema(Schema schema) {
    visitor.visitSchema(schema);
    for (final property in schema.properties.values) {
      _maybeRef(property);
    }
    _maybeRef(schema.items);
  }
}
