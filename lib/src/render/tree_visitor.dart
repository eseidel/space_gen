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
    for (final schema in spec.componentSchemas.values) {
      walkSchema(schema);
    }
    for (final api in spec.apis) {
      walkApi(api);
    }
  }

  void walkSchema(RenderSchema schema) {
    visitor.visitSchema(schema);
    // Every reachable schema, so each gets a file: descend through
    // everything, newtypes included. Child enumeration lives on
    // `RenderSchema.children` (see #289).
    for (final child in schema.children) {
      walkSchema(child);
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

/// The schemas one generated file's own declarations name, split by how
/// the name resolves.
///
/// This is a different question from the one [RenderTreeWalker] answers,
/// and conflating the two is what forced import decisions to be made by
/// re-reading rendered output. The walker answers **what must exist**:
/// every schema reachable from the spec, so that each one gets a file.
/// This answers **what does this file name**, which is what decides the
/// file's imports. They differ because a newtype's internals are named
/// only inside the newtype's own file — walking through it over-reports
/// for import purposes.
class NamedSchemas {
  const NamedSchemas({required this.imported, required this.inline});

  /// Newtypes the body names. Each renders to its own file, so each
  /// needs an import at this use site.
  final Set<RenderSchema> imported;

  /// Schemas whose code this file renders itself: inline structure
  /// (arrays, maps, non-newtype objects) and smooshed variants, which
  /// a sealed parent emits into its own library. Named without an
  /// import, but they can still contribute library imports of their
  /// own (see `RenderSchema.additionalImports`).
  final Set<RenderSchema> inline;
}

/// Collects the schemas named by the file rendered for [root].
///
/// Descends through everything this file renders and stops at every
/// newtype boundary, which is exactly where a name starts resolving
/// through an import instead of through local code.
NamedSchemas schemasNamedBy(RenderSchema root) =>
    (_NamedSchemaCollector()..collectRoot(root)).result;

/// The schemas the api file's endpoint methods name.
///
/// An api method names its parameter types, its request body, whatever
/// its return dispatch emits, and the one error body it throws — and
/// nothing else. Notably it does not name every response the spec
/// declares: per-status 4xx/5xx bodies that disagree with each other
/// collapse to `ApiException<Object?>`, so the tree carries response
/// schemas the file never mentions. (Those schemas still get their own
/// files and barrel exports; that is [RenderTreeWalker]'s question, not
/// this one.)
///
/// Asking [RenderOperation.returnShape] and [RenderOperation.errorSchema]
/// rather than the raw response lists is what keeps this honest as the
/// generator grows: both are the same values the template renders from,
/// so when error dispatch lands they grow and this grows with them, with
/// no second place to remember to update.
NamedSchemas schemasNamedByApi(Api api) {
  final collector = _NamedSchemaCollector();
  for (final endpoint in api.endpoints) {
    final operation = endpoint.operation;
    for (final parameter in operation.parameters) {
      collector.collect(parameter.type);
    }
    final requestBody = operation.requestBody;
    if (requestBody != null) collector.collect(requestBody.schema);
    // The method throws `ApiException<ErrorType>` when the spec's error
    // responses agree on one body, so that type is named too.
    final errorSchema = operation.errorSchema;
    if (errorSchema != null) collector.collect(errorSchema);
    switch (operation.returnShape) {
      case SingleSchemaReturn(:final schema):
        collector.collect(schema);
      case MultiStatusReturn(:final responses):
        // The sealed wrapper and its per-status subclasses are emitted
        // into the api file itself, so what needs importing is each
        // status's body type.
        for (final response in responses.values) {
          collector.collect(response.content);
        }
    }
  }
  return collector.result;
}

class _NamedSchemaCollector {
  final Set<RenderSchema> imported = {};
  final Set<RenderSchema> inline = {};

  NamedSchemas get result => NamedSchemas(imported: imported, inline: inline);

  /// Collects from [schema] itself, which this file renders — so it is
  /// never its own import.
  void collectRoot(RenderSchema schema) => _collect(schema, isRoot: true);

  /// Collects a schema the file refers to rather than declares.
  void collect(RenderSchema schema) => _collect(schema, isRoot: false);

  void _collect(RenderSchema schema, {required bool isRoot}) {
    if (!isRoot) {
      // A smooshed variant creates a type but has no file of its own —
      // its sealed parent renders it — so it resolves locally, and this
      // file goes on to name whatever the variant names.
      if (schema.createsNewType && !schema.isSmooshed) {
        imported.add(schema);
        return;
      }
      // Descend each inline schema once. An api file's endpoints share
      // structure freely, so without this the same subtree is re-walked
      // per endpoint that reaches it.
      if (!inline.add(schema)) return;
    }
    // A oneOf with no dispatch emits an `UnimplementedError` stub that
    // names no variant, so this file imports none of them. Asking the
    // oneOf rather than assuming keeps this in step with what the
    // dispatch actually emits. Every other schema names all its children,
    // so the shared enumeration (`RenderSchema.children`, see #289)
    // serves them directly.
    if (schema is RenderOneOf && !schema.emitsVariantDispatch) return;
    for (final child in schema.children) {
      _collect(child, isRoot: false);
    }
  }
}
