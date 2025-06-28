import 'package:space_gen/src/render/render_tree.dart';

class RenderTreeVisitor {
  void visitSchema(RenderSchema schema) {}
  void visitApi(Api api) {}
  void visitEndpoint(Endpoint endpoint) {}
  void visitOperation(RenderOperation operation) {}
  void visitParameter(RenderParameter parameter) {}
  void visitRequestBody(RenderRequestBody requestBody) {}
  void visitResponse(RenderResponse response) {}
}

class RenderTreeWalker {
  RenderTreeWalker({required this.visitor});
  final RenderTreeVisitor visitor;

  void walkRoot(RenderSpec spec) {
    for (final api in spec.apis) {
      walkApi(api);
    }
  }

  void maybeWalkSchema(RenderSchema? schema) {
    if (schema != null) {
      walkSchema(schema);
    }
  }

  void walkSchema(RenderSchema schema) {
    visitor.visitSchema(schema);
    switch (schema) {
      case RenderObject():
        for (final property in schema.properties.values) {
          walkSchema(property);
        }
        maybeWalkSchema(schema.additionalProperties);
      case RenderArray():
        maybeWalkSchema(schema.items);
      case RenderOneOf():
        for (final schema in schema.schemas) {
          walkSchema(schema);
        }
      case RenderMap():
        walkSchema(schema.valueSchema);
      case RenderEnum():
      case RenderString():
      case RenderInteger():
      case RenderNumber():
      case RenderPod():
      case RenderUnknown():
      case RenderVoid():
        break;
    }
  }

  void walkApi(Api api) {
    for (final endpoint in api.endpoints) {
      walkEndpoint(endpoint);
    }
  }

  void walkEndpoint(Endpoint endpoint) {
    visitor.visitEndpoint(endpoint);
    walkOperation(endpoint.operation);
  }

  void walkParameter(RenderParameter parameter) {
    visitor.visitParameter(parameter);
    walkSchema(parameter.type);
  }

  void walkOperation(RenderOperation operation) {
    visitor.visitOperation(operation);
    final requestBody = operation.requestBody;
    if (requestBody != null) {
      walkRequestBody(requestBody);
    }
    for (final response in operation.responses) {
      walkResponse(response);
    }
    for (final parameter in operation.parameters) {
      walkParameter(parameter);
    }
    walkSchema(operation.returnType);
  }

  void walkRequestBody(RenderRequestBody requestBody) {
    visitor.visitRequestBody(requestBody);
    walkSchema(requestBody.schema);
  }

  void walkResponse(RenderResponse response) {
    visitor.visitResponse(response);
    walkSchema(response.content);
  }
}
