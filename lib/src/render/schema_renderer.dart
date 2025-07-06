import 'package:space_gen/src/quirks.dart';
import 'package:space_gen/src/render/render_tree.dart';
import 'package:space_gen/src/render/templates.dart';

/// Context for rendering the spec.
class SchemaRenderer {
  /// Create a new context for rendering the spec.
  SchemaRenderer({required this.templates, this.quirks = const Quirks()});

  /// The provider of templates.
  final TemplateProvider templates;

  /// The quirks to use for rendering.
  final Quirks quirks;

  /// The type of the json object passed to fromJson.
  String get fromJsonJsonType =>
      quirks.dynamicJson ? 'dynamic' : 'Map<String, dynamic>';

  /// Renders a schema to a string, does not render the imports.
  String renderSchema(RenderSchema schema) {
    if (!schema.createsNewType) {
      throw StateError('No code to render non-newtype: $schema');
    }
    final template = switch (schema) {
      RenderEnum() => 'schema_enum',
      RenderObject() => 'schema_object',
      RenderString() => 'schema_string_newtype',
      RenderInteger() || RenderNumber() => 'schema_number_newtype',
      RenderOneOf() => 'schema_one_of',
      RenderEmptyObject() => 'schema_empty_object',
      RenderSchema() => throw StateError('No code to render $schema'),
    };
    return templates
        .load(template)
        .renderString(schema.toTemplateContext(this));
  }

  String renderEndpoints({
    required String? description,
    required String className,
    required List<Endpoint> endpoints,
    String? removePrefix,
  }) {
    final endpointsContext = endpoints
        .map((e) => e.toTemplateContext(this, removePrefix: removePrefix))
        .toList();
    return templates.load('api').renderString({
      'api_doc_comment': createDocCommentFromParts(body: description),
      'className': className,
      'endpoints': endpointsContext,
    });
  }

  /// Renders an api to a string, does not render the imports.
  String renderApi(Api api) => renderEndpoints(
    description: api.description,
    className: api.className,
    endpoints: api.endpoints,
    removePrefix: api.removePrefix,
  );
}
