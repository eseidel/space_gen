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
    final Map<String, dynamic> schemaContext;
    final String template;
    switch (schema) {
      case RenderEnum():
        schemaContext = schema.toTemplateContext(this);
        template = 'schema_enum';
      case RenderObject():
        schemaContext = schema.toTemplateContext(this);
        template = 'schema_object';
      case RenderStringNewType():
        schemaContext = schema.toTemplateContext(this);
        template = 'schema_string_newtype';
      case RenderNumberNewType():
        schemaContext = schema.toTemplateContext(this);
        template = 'schema_number_newtype';
      case RenderOneOf():
        schemaContext = schema.toTemplateContext(this);
        template = 'schema_one_of';
      case RenderEmptyObject():
        schemaContext = schema.toTemplateContext(this);
        template = 'schema_empty_object';
      default:
        throw StateError('No code to render $schema');
    }

    return templates.load(template).renderString(schemaContext);
  }

  String renderEndpoints({
    required String className,
    required List<Endpoint> endpoints,
  }) {
    return templates.load('api').renderString({
      'className': className,
      'endpoints': endpoints.map((e) => e.toTemplateContext(this)).toList(),
    });
  }

  /// Renders an api to a string, does not render the imports.
  String renderApi(Api api) =>
      renderEndpoints(className: api.className, endpoints: api.endpoints);
}
