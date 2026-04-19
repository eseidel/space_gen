import 'package:space_gen/src/quirks.dart';
import 'package:space_gen/src/render/render_tree.dart';
import 'package:space_gen/src/render/templates.dart';

/// Which imports a rendered schema body needs beyond the schemas it
/// references.
///
/// Today we derive this from the rendered body via substring checks. The
/// long-term plan is for the rendering pipeline in render_tree.dart to
/// populate this directly as it emits helper calls — the [importsFor]
/// interface will not change.
class SchemaUsage {
  const SchemaUsage({
    this.usesMetaAnnotations = false,
    this.usesModelHelpers = false,
  });

  /// Derives usage by inspecting a rendered body.
  factory SchemaUsage.fromBody(String body) {
    return SchemaUsage(
      usesMetaAnnotations: body.contains('@immutable'),
      usesModelHelpers: ModelHelpers.all.any(body.contains),
    );
  }

  final bool usesMetaAnnotations;
  final bool usesModelHelpers;

  /// Imports required by the body itself. Package-local imports are
  /// resolved against [packageName].
  Iterable<Import> importsFor(String packageName) sync* {
    if (usesMetaAnnotations) yield const Import('package:meta/meta.dart');
    if (usesModelHelpers) {
      yield Import('package:$packageName/model_helpers.dart');
    }
  }
}

/// Which imports a rendered api body needs beyond the schemas it
/// references.
class ApiUsage {
  const ApiUsage();

  // No conditional fields yet; body kept to match the SchemaUsage shape
  // so a future refactor can populate them without changing callers.
  // ignore: avoid_unused_constructor_parameters
  factory ApiUsage.fromBody(String body) => const ApiUsage();

  Iterable<Import> importsFor(String packageName) => const [];
}

/// A rendered schema body paired with the usage of that body.
class RenderedSchema {
  const RenderedSchema({required this.body, required this.usage});
  final String body;
  final SchemaUsage usage;
}

/// A rendered api body paired with the usage of that body.
class RenderedApi {
  const RenderedApi({required this.body, required this.usage});
  final String body;
  final ApiUsage usage;
}

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

  /// Renders a schema, does not render the imports.
  RenderedSchema renderSchema(RenderSchema schema) {
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
    final body = templates
        .loadTemplate(template)
        .renderString(schema.toTemplateContext(this));
    return RenderedSchema(body: body, usage: SchemaUsage.fromBody(body));
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
    return templates.loadTemplate('api').renderString({
      'api_doc_comment': createDocCommentFromParts(body: description),
      'className': className,
      'endpoints': endpointsContext,
    });
  }

  /// Renders an api, does not render the imports.
  RenderedApi renderApi(Api api) {
    final body = renderEndpoints(
      description: api.description,
      className: api.className,
      endpoints: api.endpoints,
      removePrefix: api.removePrefix,
    );
    return RenderedApi(body: body, usage: ApiUsage.fromBody(body));
  }
}
