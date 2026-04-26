import 'package:space_gen/src/render/render_tree.dart';

class RenderTreeVisitor {
  void visitSchema(RenderSchema schema) {}
  void visitApi(Api api) {}
  void visitEndpoint(Endpoint endpoint) {}
  void visitOperation(RenderOperation operation) {}
  void visitParameter(RenderParameter parameter) {}
  void visitRequestBody(RenderRequestBody requestBody) {}
  void visitResponse(RenderResponse response) {}
  void visitRangeResponse(RenderRangeResponse response) {}
  void visitDefaultResponse(RenderDefaultResponse response) {}
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
        final keySchema = schema.keySchema;
        if (keySchema != null) walkSchema(keySchema);
      case RenderRecursiveRef():
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
    for (final response in operation.rangeResponses) {
      walkRangeResponse(response);
    }
    final defaultResponse = operation.defaultResponse;
    if (defaultResponse != null) {
      walkDefaultResponse(defaultResponse);
    }
    for (final parameter in operation.parameters) {
      walkParameter(parameter);
    }
    // SingleSchemaReturn is a synthesized type (the legacy oneOf
    // fallback or a real schema) that needs its imports collected.
    // MultiStatusReturn's per-status bodies are already covered by the
    // walkResponse loop above — they live on operation.responses.
    switch (operation.returnShape) {
      case SingleSchemaReturn(:final schema):
        walkSchema(schema);
      case MultiStatusReturn():
        break;
    }
  }

  void walkRequestBody(RenderRequestBody requestBody) {
    visitor.visitRequestBody(requestBody);
    walkSchema(requestBody.schema);
  }

  void walkResponse(RenderResponse response) {
    visitor.visitResponse(response);
    walkSchema(response.content);
  }

  void walkRangeResponse(RenderRangeResponse response) {
    visitor.visitRangeResponse(response);
    walkSchema(response.content);
  }

  void walkDefaultResponse(RenderDefaultResponse response) {
    visitor.visitDefaultResponse(response);
    walkSchema(response.content);
  }
}
