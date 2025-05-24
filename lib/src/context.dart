import 'dart:io';

import 'package:collection/collection.dart';
import 'package:file/file.dart';
import 'package:mustache_template/mustache_template.dart';
import 'package:path/path.dart' as p;
import 'package:space_gen/space_gen.dart';
import 'package:space_gen/src/logger.dart';
import 'package:space_gen/src/spec.dart';
import 'package:space_gen/src/string.dart';

class Paths {
  static String apiFilePath(Api api) {
    // openapi generator does not use /src/ in the path.
    return 'lib/api/${api.fileName}.dart';
  }

  static String apiPackagePath(Api api) {
    return 'api/${api.fileName}.dart';
  }

  static String modelFilePath(Schema schema) {
    // openapi generator does not use /src/ in the path.
    return 'lib/model/${schema.fileName}.dart';
  }

  static String modelPackagePath(Schema schema) {
    return 'model/${schema.fileName}.dart';
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

extension SpecGeneration on Spec {
  List<Api> get apis => tags
      .map(
        (tag) => Api(
          name: tag,
          endpoints: endpoints.where((e) => e.tag == tag).toList(),
        ),
      )
      .toList();
}

extension EndpointGeneration on Endpoint {
  String get methodName {
    final name = camelFromSnake(snakeName);
    return name[0].toLowerCase() + name.substring(1);
  }

  Uri uri(Context context) => Uri.parse('${context.spec.serverUrl}$path');

  Map<String, dynamic> toTemplateContext(Context context) {
    final parameters = this.parameters
        .map((param) => param.toTemplateContext(context))
        .toList();
    final bodySchema = context.maybeResolve(requestBody);
    if (bodySchema != null) {
      final typeName = bodySchema.typeName(context);
      final paramName = typeName[0].toLowerCase() + typeName.substring(1);
      parameters.add({
        'name': paramName,
        'bracketedName': '{$paramName}',
        'type': typeName,
        'nullableType': bodySchema.nullableTypeName(context),
        'required': true,
        'toJson': bodySchema.toJsonExpression(
          paramName,
          context,
          isNullable: false,
        ),
        'fromJson': bodySchema.fromJsonExpression('json', context),
        'sendIn': 'query',
      });
    }

    final firstResponse = context.maybeResolve(responses.firstOrNull?.content);
    final returnType = firstResponse?.typeName(context) ?? 'void';

    final namedParameters = parameters.where((p) => p['required'] == false);
    final positionalParameters = parameters.where((p) => p['required'] == true);

    final pathParameters = parameters.where((p) => p['sendIn'] == 'path');
    final queryParameters = parameters.where((p) => p['sendIn'] == 'query');
    final hasQueryParameters = queryParameters.isNotEmpty;

    // Cookie parameters are not supported for now.

    return {
      'methodName': methodName,
      'httpMethod': method.name,
      'path': path,
      'url': uri(context),
      // Parameters grouped for dart parameter generation.
      'positionalParameters': positionalParameters,
      'hasNamedParameters': namedParameters.isNotEmpty,
      'namedParameters': namedParameters,
      // Parameters grouped for call to server.
      'pathParameters': pathParameters,
      'hasQueryParameters': hasQueryParameters,
      'queryParameters': queryParameters,
      // TODO(eseidel): remove void support, it's unused.
      'returnIsVoid': returnType == 'void',
      'returnType': returnType,
    };
  }
}

extension SchemaGeneration on Schema {
  /// Schema name in file name format.
  String get fileName => snakeName;

  /// Schema name in class name format.
  String get className => camelFromSnake(snakeName);

  /// Whether this schema needs to be rendered.
  bool get needsRender => type == SchemaType.object || isEnum;

  /// Whether this schema is a date time.
  bool get isDateTime => type == SchemaType.string && format == 'date-time';

  /// Whether this schema is an enum.
  bool get isEnum => type == SchemaType.string && enumValues.isNotEmpty;

  // Is a Map with a specified value type.
  Schema? valueSchema(Context context) {
    if (type != SchemaType.object) {
      return null;
    }
    return context.maybeResolve(additionalProperties);
  }

  /// The type name of this schema.
  String typeName(Context context) {
    switch (type) {
      case SchemaType.string:
        if (isDateTime) {
          return 'DateTime';
        } else if (isEnum) {
          return className;
        }
        return 'String';
      case SchemaType.integer:
        return 'int';
      case SchemaType.number:
        return 'double';
      case SchemaType.boolean:
        return 'bool';
      case SchemaType.object:
        return className;
      case SchemaType.array:
        final itemsSchema = context.maybeResolve(items)!;
        return 'List<${itemsSchema.typeName(context)}>';
      case SchemaType.unknown:
        return 'dynamic';
    }
    // throw UnimplementedError('Unknown type $type');
  }

  String nullableTypeName(Context context) {
    final typeName = this.typeName(context);
    return typeName.endsWith('?') ? typeName : '$typeName?';
  }

  /// The toJson expression for this schema.
  String toJsonExpression(
    String name,
    Context context, {
    required bool isNullable,
  }) {
    final nameCall = isNullable ? '$name?' : name;
    switch (type) {
      case SchemaType.string:
        if (isDateTime) {
          return '$nameCall.toIso8601String()';
        } else if (isEnum) {
          return '$nameCall.toJson()';
        }
        return name;
      case SchemaType.integer:
      case SchemaType.number:
      case SchemaType.boolean:
        return name;
      case SchemaType.object:
        return '$nameCall.toJson()';
      case SchemaType.array:
        final itemsSchema = context.maybeResolve(items)!;
        switch (itemsSchema.type) {
          case SchemaType.unknown:
          case SchemaType.string:
          case SchemaType.integer:
          case SchemaType.number:
          case SchemaType.boolean:
            // Don't call toJson on primitives.
            return name;
          case SchemaType.object:
          case SchemaType.array:
            return '$nameCall.map((e) => e.toJson()).toList()';
        }
      case SchemaType.unknown:
        return name;
    }
  }

  /// The fromJson expression for this schema.
  String fromJsonExpression(String jsonValue, Context context) {
    switch (type) {
      case SchemaType.string:
        if (isDateTime) {
          return 'DateTime.parse($jsonValue as String)';
        } else if (isEnum) {
          return '$className.fromJson($jsonValue as String)';
        }
        return '$jsonValue as String';
      case SchemaType.integer:
        return '$jsonValue as int';
      case SchemaType.number:
        return '$jsonValue as double';
      case SchemaType.boolean:
        return '$jsonValue as bool';
      case SchemaType.object:
        return '$className.fromJson($jsonValue as Map<String, dynamic>)';
      case SchemaType.array:
        final itemsSchema = context.maybeResolve(items)!;
        final itemTypeName = itemsSchema.typeName(context);
        if (itemsSchema.type == SchemaType.object) {
          return '($jsonValue as List<dynamic>).map<$itemTypeName>((e) => '
              '$itemTypeName.fromJson(e as Map<String, dynamic>)).toList()';
        } else {
          return '($jsonValue as List<dynamic>).cast<$itemTypeName>()';
        }
      case SchemaType.unknown:
        return jsonValue;
    }
  }

  /// Template context for an object schema.
  Map<String, dynamic> _objectToTemplateContext(Context context) {
    final renderProperties = properties.entries.map((entry) {
      final jsonName = entry.key;
      // TODO(eseidel): Remove this once we've migrated to the new generator.
      final dartName = avoidReservedWord(entry.key);
      final schema = context.maybeResolve(entry.value)!;
      return {
        'propertyName': dartName,
        'propertyType': schema.typeName(context),
        'propertyToJson': schema.toJsonExpression(
          dartName,
          context,
          isNullable: false,
        ),
        'propertyFromJson': schema.fromJsonExpression(
          "json['$jsonName']",
          context,
        ),
      };
    });
    final valueSchema = this.valueSchema(context);
    return {
      'schemaName': className,
      'hasProperties': renderProperties.isNotEmpty,
      'properties': renderProperties,
      'hasAdditionalProperties': valueSchema != null,
      'valueSchema': valueSchema?.typeName(context),
      'valueToJson': valueSchema?.toJsonExpression(
        'value',
        context,
        isNullable: false,
      ),
      'valueFromJson': valueSchema?.fromJsonExpression('value', context),
    };
  }

  String _sharedPrefix(List<String> values) {
    final prefix = '${values.first.split('_').first}_';
    for (final value in values) {
      if (!value.startsWith(prefix)) {
        return '';
      }
    }
    return prefix;
  }

  String avoidReservedWord(String value) {
    if (isReservedWord(value)) {
      return '${value}_';
    }
    return value;
  }

  /// Template context for an enum schema.
  Map<String, dynamic> _enumToTemplateContext() {
    final sharedPrefix = _sharedPrefix(enumValues);
    Map<String, dynamic> enumValueToTemplateContext(String value) {
      // var dartName = camelFromScreamingCaps(value);
      // OpenAPI uses screaming caps for enum values so we're matching for now.
      var dartName = value;
      // OpenAPI also removes shared prefixes from enum values.
      dartName = dartName.replaceAll(sharedPrefix, '');
      // And avoids reserved words.
      dartName = avoidReservedWord(dartName);
      return {'enumValueName': dartName, 'enumValue': value};
    }

    return {
      'schemaName': className,
      'enumValues': enumValues.map(enumValueToTemplateContext).toList(),
    };
  }

  /// Convert this schema to a template context.
  Map<String, dynamic> toTemplateContext(Context context) {
    return isEnum
        ? _enumToTemplateContext()
        : _objectToTemplateContext(context);
  }

  /// package import string for this schema.
  String packageImport(Context context) {
    return 'package:${context.packageName}/model/$snakeName.dart';
  }
}

/// Extensions for rendering parameters.
extension ParameterGeneration on Parameter {
  /// Template context for a parameter.
  Map<String, dynamic> toTemplateContext(Context context) {
    final typeSchema = context.maybeResolve(type)!;
    return {
      'name': name,
      'bracketedName': '{$name}',
      'required': isRequired,
      'defaultValue': typeSchema.defaultValue,
      'type': typeSchema.typeName(context),
      'nullableType': typeSchema.nullableTypeName(context),
      'sendIn': sendIn.name,
      'toJson': typeSchema.toJsonExpression(
        name,
        context,
        isNullable: !isRequired,
      ),
      'fromJson': typeSchema.fromJsonExpression("json['$name']", context),
    };
  }
}

/// Extensions for rendering schema references.
extension SchemaRefGeneration on SchemaRef {
  /// package import string for this schema reference.
  String packageImport(Context context) {
    final name = p.basenameWithoutExtension(uri!);
    final snakeName = snakeFromCamel(name);
    return 'package:${context.packageName}/model/$snakeName.dart';
  }
}

typedef RunProcess =
    ProcessResult Function(
      String executable,
      List<String> arguments, {
      String? workingDirectory,
    });

/// Context for rendering the spec.
/// This is separate from a RenderContext which is per-file.
class Context {
  /// Create a new context for rendering the spec.
  Context({
    required this.specUrl,
    required this.spec,
    required this.outDir,
    required this.packageName,
    required this.schemaRegistry,
    Directory? templateDir,
    RunProcess? runProcess,
  }) : fs = outDir.fileSystem,
       templateDir =
           templateDir ?? outDir.fileSystem.directory('lib/templates'),
       runProcess = runProcess ?? Process.runSync {
    final dir = this.templateDir;
    if (!dir.existsSync()) {
      throw Exception('Template directory does not exist: ${dir.path}');
    }
  }

  /// The spec url.
  final Uri specUrl;

  /// The spec.
  final Spec spec;

  /// The output directory.
  final Directory outDir;

  /// The package name this spec is being rendered into.
  final String packageName;

  /// The directory containing the templates.
  final Directory templateDir;

  /// The file system where the rendered files will go.
  final FileSystem fs;

  /// The schema registry.
  /// This must be fully populated before rendering.
  final SchemaRegistry schemaRegistry;

  /// The function to run a process. Allows for mocking in tests.
  final RunProcess runProcess;

  Template loadTemplate(String name) {
    // I'm not sure how to load a template relative to the package root
    // for when this is installed via pub.  I'm sure it's possible.
    return Template(
      templateDir.childFile('$name.mustache').readAsStringSync(),
      partialResolver: loadTemplate,
      name: name,
    );
  }

  /// Resolve a nullable schema reference into a nullable schema.
  Schema? maybeResolve(SchemaRef? ref) {
    if (ref == null) {
      return null;
    }
    return resolve(ref);
  }

  /// Resolve a schema reference into a schema.
  Schema resolve(SchemaRef ref) {
    if (ref.schema != null) {
      return ref.schema!;
    }
    final uri = specUrl.resolve(ref.uri!);
    return resolveUri(uri);
  }

  Schema resolveUri(Uri uri) {
    return schemaRegistry.get(uri);
  }

  /// Ensure a file exists.
  File _ensureFile(String path) {
    final file = fs.file(p.join(outDir.path, path));
    file.parent.createSync(recursive: true);
    return file;
  }

  /// Write a file.
  void writeFile({required String path, required String content}) {
    _ensureFile(path).writeAsStringSync(content);
  }

  /// Render a template.
  void renderTemplate({
    required String template,
    required String outPath,
    Map<String, dynamic> context = const {},
  }) {
    final output = loadTemplate(template).renderString(context);
    writeFile(path: outPath, content: output);
  }

  /// Render the package directory including
  /// pubspec, analysis_options, and gitignore.
  void renderDirectory() {
    outDir.createSync(recursive: true);
    renderTemplate(
      template: 'pubspec',
      outPath: 'pubspec.yaml',
      context: {'packageName': packageName},
    );
    renderTemplate(
      template: 'analysis_options',
      outPath: 'analysis_options.yaml',
    );
    renderTemplate(template: 'gitignore', outPath: '.gitignore');
  }

  /// Render the API classes and supporting models.
  Set<Uri> renderApis() {
    final rendered = <Uri>{};
    final renderQueue = <Uri>{};
    Set<Uri> urisFromSchemaRefs(Set<SchemaRef> refs) {
      return refs.map((ref) => specUrl.resolve(ref.uri!)).toSet();
    }

    Set<Uri> urisFromSchemas(List<Schema> schemas) {
      return schemas
          .map((schema) => specUrl.replace(fragment: schema.pointer))
          .toSet();
    }

    for (final api in spec.apis) {
      final renderContext = RenderContext(specUri: specUrl);
      renderApi(renderContext, this, api);
      // Api files only contain the API class, any inline schemas
      // end up in the model files.
      renderQueue.addAll([
        ...urisFromSchemas(renderContext.inlineSchemas),
        ...urisFromSchemaRefs(renderContext.importedSchemas),
      ]);
    }

    // Render all the schemas that were collected while rendering the API.
    while (renderQueue.isNotEmpty) {
      final uri = renderQueue.first;
      renderQueue.remove(uri);
      if (rendered.contains(uri)) {
        continue;
      }
      rendered.add(uri);
      final schema = resolveUri(uri);
      final renderContext = renderSchema(this, schema);
      renderQueue.addAll([
        ...urisFromSchemas(renderContext.inlineSchemas),
        ...urisFromSchemaRefs(renderContext.importedSchemas),
      ]);
    }
    return rendered;
  }

  /// Render the api client.
  void renderApiClient() {
    renderTemplate(
      template: 'api_exception',
      outPath: 'lib/api_exception.dart',
    );
    renderTemplate(
      template: 'api_client',
      outPath: 'lib/api_client.dart',
      context: {'baseUri': spec.serverUrl, 'packageName': packageName},
    );
  }

  /// Run a dart command.
  void runDart(List<String> args) {
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
  void renderPublicApi(Iterable<Schema> renderedModels) {
    final paths = [
      ...spec.apis.map(Paths.apiPackagePath),
      ...renderedModels.map(Paths.modelPackagePath),
      'api_client.dart',
      'api_exception.dart',
    ];
    final exports = paths
        .map((path) => 'package:$packageName/$path')
        .sorted()
        .toList();
    renderTemplate(
      template: 'public_api',
      outPath: 'lib/api.dart',
      context: {'imports': <String>[], 'exports': exports},
    );
  }

  /// Render the entire spec.
  void render() {
    renderDirectory();
    final rendered = renderApis();
    renderApiClient();
    // renderModels();
    final renderedModels = rendered.map(schemaRegistry.get);
    renderPublicApi(renderedModels);
    runDart(['pub', 'get']);
    // Run format first to add missing commas.
    runDart(['format', '.']);
    // Then run fix to clean up various other things.
    runDart(['fix', '.', '--apply']);
    // Run format again to fix wrapping of lines.
    runDart(['format', '.']);
  }
}

/// A per-file rendering context used for collecting imports and inline schemas.
/// Used for a single API or model file.
class RenderContext {
  /// Create a new render context.
  RenderContext({required this.specUri});

  /// The spec uri used for resolving internal references into full urls
  /// which can be used to look up schemas in the schema registry.
  final Uri specUri;

  /// Schemas declared within this file.
  List<Schema> inlineSchemas = [];

  /// Schemas imported by this file.
  Set<SchemaRef> importedSchemas = {};

  /// Visit a schema reference and collect it if it is not already in the
  /// importedSchemas set.
  void visitRef(SchemaRef? ref) {
    if (ref == null) {
      return;
    }
    if (ref.schema != null) {
      collectSchema(ref.schema!);
    } else {
      importedSchemas.add(ref);
    }
  }

  /// Collect an API and all its endpoints and responses.
  // TODO(eseidel): Could use Visitor for this?
  void collectApi(Api api) {
    for (final endpoint in api.endpoints) {
      for (final response in endpoint.responses) {
        visitRef(response.content);
      }
      for (final param in endpoint.parameters) {
        visitRef(param.type);
      }
      if (endpoint.requestBody != null) {
        visitRef(endpoint.requestBody);
      }
    }
  }

  /// Collect a schema if it needs to be rendered.
  void collectSchema(Schema schema) {
    if (schema.needsRender) {
      inlineSchemas.add(schema);
    }
    for (final entry in schema.properties.entries) {
      visitRef(entry.value);
    }
    if (schema.type == SchemaType.array) {
      visitRef(schema.items);
    }
  }

  /// Get the sorted package imports for this render context.
  List<String> sortedPackageImports(
    Context context, {
    bool includeInlineSchema = false,
  }) {
    final imports = <String>{};
    for (final ref in importedSchemas) {
      imports.add(ref.packageImport(context));
    }
    if (includeInlineSchema) {
      for (final schema in inlineSchemas) {
        imports.add(schema.packageImport(context));
      }
    }
    return imports.toList()..sort();
  }
}

/// Starts a new RenderContext for rendering a new schema file.
RenderContext renderSchema(Context context, Schema schema) {
  final renderContext = RenderContext(specUri: context.specUrl)
    ..collectSchema(schema);

  final imports = renderContext.sortedPackageImports(
    context,
    includeInlineSchema: true,
  );
  final schemaContext = schema.toTemplateContext(context);
  final template = schema.isEnum ? 'schema_enum' : 'schema_object';

  final outPath = Paths.modelFilePath(schema);
  logger.detail('rendering $outPath from ${schema.pointer}');
  context.renderTemplate(
    template: template,
    outPath: outPath,
    context: {'imports': imports, ...schemaContext},
  );
  return renderContext;
}

void renderApi(RenderContext renderContext, Context context, Api api) {
  final endpoints = api.endpoints
      .map((e) => e.toTemplateContext(context))
      .toList();
  renderContext.collectApi(api);

  final imports = renderContext.sortedPackageImports(
    context,
    includeInlineSchema: true,
  );

  // The OpenAPI generator only includes the APIs in the api/ directory
  // all other classes and enums go in the model/ directory even ones
  // which were defined inline in the main spec.
  context.renderTemplate(
    template: 'api',
    outPath: Paths.apiFilePath(api),
    context: {
      'className': api.className,
      'imports': imports,
      'endpoints': endpoints,
      'packageName': context.packageName,
    },
  );
}
