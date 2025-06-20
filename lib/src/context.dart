import 'dart:io';

import 'package:collection/collection.dart';
import 'package:file/file.dart';
import 'package:file/local.dart';
import 'package:mustache_template/mustache_template.dart';
import 'package:path/path.dart' as p;
import 'package:space_gen/src/logger.dart';
import 'package:space_gen/src/render_tree.dart';
import 'package:space_gen/src/string.dart';
import 'package:space_gen/src/types.dart';

String avoidReservedWord(String value) {
  if (isReservedWord(value)) {
    return '${value}_';
  }
  return value;
}

Never _unimplemented(String message, String pointer) {
  throw UnimplementedError('$message at $pointer');
}

/// A convenience class created for each operation within a path item
/// for compatibility with our existing rendering code.
class Endpoint {
  const Endpoint({required this.operation, required this.serverUrl});

  /// The server url of the endpoint.
  final Uri serverUrl;

  /// The operation of the endpoint.
  final RenderOperation operation;

  /// The method of the endpoint.
  Method get method => operation.method;

  String get path => operation.path;

  String get tag => operation.tags.firstOrNull ?? 'Default';

  String get snakeName => operation.snakeName;

  List<RenderParameter> get parameters => operation.parameters;

  String get methodName => lowercaseCamelFromSnake(snakeName);

  Uri get uri => Uri.parse('$serverUrl$path');

  Map<String, dynamic> toTemplateContext(SchemaRenderer context) {
    final serverParameters = parameters.map((param) {
      return param.toTemplateContext(context);
    }).toList();

    final requestBody = operation.requestBody?.toTemplateContext(context);
    // Parameters as passed to the Dart function call, including the request
    // body if it exists.
    final dartParameters = [...serverParameters, ?requestBody];

    final responseSchema = operation.responses.first.content;
    final returnType = responseSchema.typeName(context);
    final responseFromJson = responseSchema.fromJsonExpression(
      'jsonDecode(response.body)',
      context,
      jsonIsNullable: false,
      dartIsNullable: false,
    );

    final namedParameters = dartParameters.where((p) => p['required'] == false);
    final positionalParameters = dartParameters.where(
      (p) => p['required'] == true,
    );

    // TODO(eseidel): This grouping should happen before converting to
    // template context while we still have strong types.
    final bySendIn = serverParameters.groupListsBy((p) => p['sendIn']);

    final pathParameters = bySendIn['path'] ?? [];
    final queryParameters = bySendIn['query'] ?? [];
    final hasQueryParameters = queryParameters.isNotEmpty;
    final cookieParameters = bySendIn['cookie'] ?? [];
    if (cookieParameters.isNotEmpty) {
      _unimplemented('Cookie parameters are not yet supported.', path);
    }
    final headerParameters = bySendIn['header'] ?? [];
    final hasHeaderParameters = headerParameters.isNotEmpty;

    return {
      'methodName': methodName,
      'httpMethod': method.name,
      'path': path,
      'url': uri,
      // Parameters grouped for dart parameter generation.
      'positionalParameters': positionalParameters,
      'hasNamedParameters': namedParameters.isNotEmpty,
      'namedParameters': namedParameters,
      // Parameters grouped for call to server.
      'pathParameters': pathParameters,
      'hasQueryParameters': hasQueryParameters,
      'queryParameters': queryParameters,
      'hasHeaderParameters': hasHeaderParameters,
      'headerParameters': headerParameters,
      'requestBody': requestBody,
      'returnType': returnType,
      'responseFromJson': responseFromJson,
    };
  }
}

/// The spec calls these tags, but the Dart openapi generator groups endpoints
/// by tag into an API class so we do too.
class Api {
  const Api({required this.name, required this.endpoints});

  final String name;
  final List<Endpoint> endpoints;

  String get className => '${name.capitalize()}Api';
  String get fileName => '${name.toLowerCase()}_api';
}

enum SchemaRenderType { enumeration, object, stringNewtype, numberNewtype, pod }

typedef RunProcess =
    ProcessResult Function(
      String executable,
      List<String> arguments, {
      String? workingDirectory,
    });

class TemplateProvider {
  TemplateProvider.fromDirectory(this.templateDir) {
    if (!templateDir.existsSync()) {
      throw Exception('Template directory does not exist: ${templateDir.path}');
    }
  }

  TemplateProvider.defaultLocation()
    : templateDir = const LocalFileSystem().directory('lib/templates');

  final Directory templateDir;

  Template loadTemplate(String name) {
    return Template(
      templateDir.childFile('$name.mustache').readAsStringSync(),
      partialResolver: loadTemplate,
      name: name,
    );
  }
}

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
      case RenderEnum():
      case RenderStringNewType():
      case RenderNumberNewType():
      case RenderPod():
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

  void walkOperation(RenderOperation operation) {
    visitor.visitOperation(operation);
    if (operation.requestBody != null) {
      walkRequestBody(operation.requestBody!);
    }
    for (final response in operation.responses) {
      walkResponse(response);
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
}

class _ModelCollector extends RenderTreeVisitor {
  final Set<RenderSchema> schemas = {};

  @override
  void visitSchema(RenderSchema schema) {
    schemas.add(schema);
  }
}

Set<RenderSchema> collectAllSchemas(RenderSpec spec) {
  final collector = _ModelCollector();
  RenderTreeWalker(visitor: collector).walkRoot(spec);
  return collector.schemas;
}

Set<RenderSchema> collectSchemasUnderApi(Api api) {
  final collector = _ModelCollector();
  RenderTreeWalker(visitor: collector).walkApi(api);
  return collector.schemas;
}

Set<RenderSchema> collectSchemasUnderSchema(RenderSchema schema) {
  final collector = _ModelCollector();
  RenderTreeWalker(visitor: collector).walkSchema(schema);
  return collector.schemas;
}

class Import {
  const Import(this.path, {this.asName});

  final String path;
  final String? asName;

  Map<String, dynamic> toTemplateContext() {
    return {'path': path, 'asName': asName};
  }
}

/// Responsible for determining the layout of the files and rendering the
/// for the directory structure of the rendered spec.
///
/// This FileRenderer uses a directory structure that is similar to the
/// OpenAPI generator.  Eventually we should make this an interface to allow
/// rendering to other directory structures.
class FileRenderer {
  FileRenderer({
    required this.outDir,
    required this.packageName,
    required this.templateProvider,
    required this.schemaRenderer,
    RunProcess? runProcess,
  }) : fs = outDir.fileSystem,
       runProcess = runProcess ?? Process.runSync;

  /// The output directory.
  final Directory outDir;

  /// The file system where the rendered files will go.
  final FileSystem fs;

  /// The package name this spec is being rendered into.
  final String packageName;

  /// The provider of templates.  Could be different from the one used by
  /// the schema renderer, so we hold our own.
  final TemplateProvider templateProvider;

  /// The function to run a process. Allows for mocking in tests.
  final RunProcess runProcess;

  /// The renderer for schemas and APIs.
  final SchemaRenderer schemaRenderer;

  /// The quirks to use for rendering.
  Quirks get quirks => schemaRenderer.quirks;

  /// The path to the api file.
  static String apiFilePath(Api api) {
    // openapi generator does not use /src/ in the path.
    return 'lib/api/${api.fileName}.dart';
  }

  static String apiPackagePath(Api api) {
    return 'api/${api.fileName}.dart';
  }

  static String modelFilePath(RenderSchema schema) {
    // openapi generator does not use /src/ in the path.
    return 'lib/model/${schema.snakeName}.dart';
  }

  static String modelPackagePath(RenderSchema schema) {
    return 'model/${schema.snakeName}.dart';
  }

  String modelPackageImport(FileRenderer context, RenderSchema schema) {
    return 'package:${context.packageName}/model/${schema.snakeName}.dart';
  }

  // String packageImport(_Context context) {
  //   final name = p.basenameWithoutExtension(ref!);
  //   final snakeName = snakeFromCamel(name);
  //   return 'package:${context.packageName}/model/$snakeName.dart';
  // }

  /// Ensure a file exists.
  File _ensureFile(String path) {
    final file = fs.file(p.join(outDir.path, path));
    file.parent.createSync(recursive: true);
    return file;
  }

  /// Write a file.
  void _writeFile({required String path, required String content}) {
    _ensureFile(path).writeAsStringSync(content);
  }

  /// Render a template.
  void _renderTemplate({
    required String template,
    required String outPath,
    Map<String, dynamic> context = const {},
  }) {
    final output = templateProvider
        .loadTemplate(template)
        .renderString(context);
    _writeFile(path: outPath, content: output);
  }

  /// Render the package directory including
  /// pubspec, analysis_options, and gitignore.
  void _renderDirectory() {
    outDir.createSync(recursive: true);
    _renderTemplate(
      template: 'pubspec',
      outPath: 'pubspec.yaml',
      context: {'packageName': packageName},
    );
    _renderTemplate(
      template: 'analysis_options',
      outPath: 'analysis_options.yaml',
      context: {
        'mutableModels': quirks.mutableModels,
        'screamingCapsEnums': quirks.screamingCapsEnums,
      },
    );
    _renderTemplate(template: 'gitignore', outPath: '.gitignore');
  }

  /// Render the api client.
  void _renderApiClient(RenderSpec spec) {
    _renderTemplate(
      template: 'api_exception',
      outPath: 'lib/api_exception.dart',
    );
    _renderTemplate(
      template: 'api_client',
      outPath: 'lib/api_client.dart',
      context: {'baseUri': spec.serverUrl, 'packageName': packageName},
    );
    _renderTemplate(
      template: 'model_helpers',
      outPath: 'lib/model_helpers.dart',
    );
  }

  /// Run a dart command.
  void _runDart(List<String> args) {
    logger.detail('dart ${args.join(' ')} in ${outDir.path}');
    final result = runProcess(
      Platform.executable,
      args,
      workingDirectory: outDir.path,
    );
    if (result.exitCode != 0) {
      logger.info(result.stderr as String);
      throw Exception('Failed to run dart ${args.join(' ')}');
    }
    logger.detail(result.stdout as String);
  }

  /// Render the public API file.
  void _renderPublicApi(Iterable<Api> apis, Iterable<RenderSchema> schemas) {
    final paths = {
      ...apis.map(apiPackagePath),
      ...schemas.map(modelPackagePath),
      'api_client.dart',
      'api_exception.dart',
    };
    final exports = paths
        .map((path) => 'package:$packageName/$path')
        .sorted()
        .toList();
    _renderTemplate(
      template: 'public_api',
      outPath: 'lib/api.dart',
      context: {'imports': <String>[], 'exports': exports},
    );
  }

  bool rendersToSeparateFile(RenderSchema schema) {
    return switch (schema) {
      RenderEnum() => true,
      RenderStringNewType() => true,
      RenderNumberNewType() => true,
      RenderObject() => true,
      RenderArray() => false,
      RenderPod() => false,
      RenderUnknown() => false,
      RenderVoid() => false,
      RenderSchema() => false,
    };
  }

  void _renderApis(List<Api> apis) {
    for (final api in apis) {
      final content = schemaRenderer.renderApi(api);
      final imports = [
        const Import('dart:async'),
        const Import('dart:convert'),
        const Import('dart:io'),
        Import('package:$packageName/api_client.dart'),
        Import('package:$packageName/api_exception.dart'),
        const Import('package:http/http.dart', asName: 'http'),
      ];

      final apiSchemas = collectSchemasUnderApi(
        api,
      ).where(rendersToSeparateFile);
      final apiImports = apiSchemas
          .map((s) => Import(modelPackageImport(this, s)))
          .toList();
      imports.addAll(apiImports);

      final importsContext = imports.map((i) => i.toTemplateContext()).toList();
      final outPath = apiFilePath(api);
      _renderTemplate(
        template: 'add_imports',
        outPath: outPath,
        context: {'imports': importsContext, 'content': content},
      );
    }
  }

  void _renderModels(Iterable<RenderSchema> schemas) {
    for (final schema in schemas) {
      final content = schemaRenderer.renderSchema(schema);
      final referencedSchemas = collectSchemasUnderSchema(
        schema,
      ).where(rendersToSeparateFile).toSet();
      final referencedImports = referencedSchemas
          .map((s) => Import(modelPackageImport(this, s)))
          .toList();

      final imports = [
        const Import('dart:convert'),
        const Import('dart:io'),
        const Import('package:meta/meta.dart'),
        Import('package:$packageName/model_helpers.dart'),
        ...referencedImports,
      ];

      final importsContext = [
        ...imports,
        ...referencedImports,
      ].map((i) => i.toTemplateContext()).toList();

      final outPath = modelFilePath(schema);
      _renderTemplate(
        template: 'add_imports',
        outPath: outPath,
        context: {'imports': importsContext, 'content': content},
      );
    }
  }

  /// Render the entire spec.
  void render(RenderSpec spec) {
    // Collect all the Apis and Model Schemas.
    // Do we walk through each endpoint and ask which class to put it on?
    // Do we then walk through each class and ask what file to put it in?
    // Then we walk through all model objects and ask what file to put them in?
    // And then for each rendered we collect any imports, by asking for the
    // file path for each referenced schema?
    // Set up the package directory.
    _renderDirectory();
    // Render the apis (endpoint groups).
    _renderApis(spec.apis);

    final schemas = collectAllSchemas(spec).where(rendersToSeparateFile);
    // Render the models (schemas).
    _renderModels(schemas);
    // Render the api client.
    _renderApiClient(spec);
    // Render the combined api.dart exporting all rendered schemas.
    _renderPublicApi(spec.apis, schemas);
    // Consider running pub upgrade here to ensure packages are up to date.
    // Might need to make offline configurable?
    _runDart(['pub', 'get', '--offline']);
    // Run format first to add missing commas.
    _runDart(['format', '.']);
    // Then run fix to clean up various other things.
    _runDart(['fix', '.', '--apply']);
    // Run format again to fix wrapping of lines.
    _runDart(['format', '.']);
  }
}

/// Context for rendering the spec.
class SchemaRenderer {
  /// Create a new context for rendering the spec.
  SchemaRenderer({
    required this.specUrl,
    required this.templateProvider,
    this.quirks = const Quirks(),
  });

  /// The url of the spec being rendered.  Used for resolving relative urls.
  final Uri specUrl;

  /// The provider of templates.
  final TemplateProvider templateProvider;

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
      case RenderPod():
        throw StateError('Pod schemas should not be rendered: $schema');
      default:
        throw StateError('Unknown schema: $schema');
    }

    return templateProvider.loadTemplate(template).renderString(schemaContext);
  }

  /// Renders an api to a string, does not render the imports.
  String renderApi(Api api) {
    final endpoints = api.endpoints
        .map((e) => e.toTemplateContext(this))
        .toList();

    // The OpenAPI generator only includes the APIs in the api/ directory
    // all other classes and enums go in the model/ directory even ones
    // which were defined inline in the main spec.
    return templateProvider.loadTemplate('api').renderString({
      'className': api.className,
      'endpoints': endpoints,
    });
  }
}

/// Quirks are a set of flags that can be used to customize the generated code.
class Quirks {
  const Quirks({
    this.dynamicJson = false,
    this.mutableModels = false,
    // Avoiding ever having List? seems reasonable so we default to true.
    this.allListsDefaultToEmpty = true,
    this.nonNullableDefaultValues = false,
    this.screamingCapsEnums = false,
  });

  const Quirks.openapi()
    : this(
        dynamicJson: true,
        mutableModels: true,
        nonNullableDefaultValues: true,
        allListsDefaultToEmpty: true,
        screamingCapsEnums: true,
      );

  /// Use "dynamic" instead of "Map\<String, dynamic\>" for passing to fromJson
  /// to match OpenAPI's behavior.
  final bool dynamicJson;

  /// Use mutable models instead of immutable ones to match OpenAPI's behavior.
  final bool mutableModels;

  /// OpenAPI seems to have the behavior whereby all Lists default to empty
  /// lists.
  final bool allListsDefaultToEmpty;

  /// OpenAPI seems to have the behavior whereby if a property has a default
  /// value it can never be nullable.  Since OpenAPI also makes all Lists
  /// default to empty lists, this means that all Lists are non-nullable.
  final bool nonNullableDefaultValues;

  /// OpenAPI uses SCREAMING_CAPS for enum values, but that's not Dart style.
  final bool screamingCapsEnums;

  // Potential future quirks:

  /// OpenAPI flattens everything into the top level `lib` folder.
  // final bool doNotUseSrcPaths;
}
