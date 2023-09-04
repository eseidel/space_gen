import 'dart:convert';
import 'dart:io';

import 'package:mustache_template/mustache_template.dart';
import 'package:path/path.dart' as p;
import 'package:space_gen/space_gen.dart';
import 'package:space_gen/src/logger.dart';
import 'package:space_gen/src/string.dart';

Template loadTemplate(String name) {
  // I'm not sure how to load a template relative to the package root
  // for when this is installed via pub.  I'm sure it's possible.
  return Template(
    File('lib/templates/$name.mustache').readAsStringSync(),
    partialResolver: loadTemplate,
    name: name,
  );
}

String _apiPath(Api api) {
  return 'lib/src/api/${api.fileName}.dart';
}

String _modelPath(Schema schema) {
  return 'lib/src/model/${schema.fileName}.dart';
}

extension ApiGeneration on Api {
  String get className => '${name.capitalize()}Api';
  String get fileName => '${name.toLowerCase()}_api';
}

extension EndpointGeneration on Endpoint {
  String get methodName {
    final name = operationId.splitMapJoin(
      '-',
      onMatch: (m) => '',
      onNonMatch: (n) => n.capitalize(),
    );
    return name[0].toLowerCase() + name.substring(1);
  }

  Uri uri(Context context) => Uri.parse('${context.spec.serverUrl}$path');

  Map<String, dynamic> toTemplateContext(Context context) {
    final resolver = context.resolver;
    final parameters = this
        .parameters
        .map(
          (param) => param.toTemplateContext(resolver),
        )
        .toList();
    if (requestBody != null) {
      final bodySchema = resolver.resolve(requestBody!);
      final typeName = bodySchema.typeName(resolver);
      final paramName = typeName[0].toLowerCase() + typeName.substring(1);
      parameters.add({
        'paramName': paramName,
        'paramType': typeName,
        'paramToJson': bodySchema.toJsonExpression(resolver, paramName),
        'paramFromJson': bodySchema.fromJsonExpression(resolver, 'json'),
      });
    }
    return {
      'methodName': methodName,
      'httpMethod': method,
      'path': path,
      'url': uri(context),
      'parameters': parameters,
      'returnType':
          responses.responses.first.content.schema!.typeName(resolver),
    };
  }
}

extension SchemaGeneration on Schema {
  // Some Schema don't have names.
  String get className => name;
  String get fileName => snakeFromCamel(name);

  String typeName(RefResolver resolver) {
    switch (type) {
      case SchemaType.string:
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
        return 'List<${resolver.resolve(items!).typeName(resolver)}>';
    }
    // throw UnimplementedError('Unknown type $type');
  }

  String toJsonExpression(RefResolver resolver, String name) {
    switch (type) {
      case SchemaType.string:
      case SchemaType.integer:
      case SchemaType.number:
      case SchemaType.boolean:
        return name;
      case SchemaType.object:
        return '$name.toJson()';
      case SchemaType.array:
        final itemsSchema = resolver.resolve(items!);
        switch (itemsSchema.type) {
          case SchemaType.string:
          case SchemaType.integer:
          case SchemaType.number:
          case SchemaType.boolean:
            // Don't call toJson on primitives.
            return name;
          case SchemaType.object:
          case SchemaType.array:
            return '$name.map((e) => e.toJson()).toList()';
        }
    }
  }

  String fromJsonExpression(RefResolver resolver, String jsonValue) {
    switch (type) {
      case SchemaType.string:
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
        final itemsSchema = resolver.resolve(items!);
        final itemTypeName = itemsSchema.typeName(resolver);
        if (itemsSchema.type == SchemaType.object) {
          return '($jsonValue as List<dynamic>).map<$itemTypeName>((e) => '
              '$itemTypeName.fromJson(e as Map<String, dynamic>)).toList()';
        } else {
          return '($jsonValue as List<dynamic>).cast<$itemTypeName>()';
        }
    }
  }

  Map<String, dynamic> toTemplateContext(RefResolver resolver) {
    final renderProperties = properties.entries.map(
      (entry) {
        final name = entry.key;
        final schema = resolver.resolve(entry.value);
        return {
          'propertyName': name,
          'propertyType': schema.typeName(resolver),
          'propertyToJson': schema.toJsonExpression(resolver, name),
          'propertyFromJson':
              schema.fromJsonExpression(resolver, "json['$name']"),
        };
      },
    );
    return {
      'className': className,
      'hasProperties': renderProperties.isNotEmpty,
      'properties': renderProperties,
    };
  }
}

extension ParameterGeneration on Parameter {
  Map<String, dynamic> toTemplateContext(
    RefResolver resolver,
  ) {
    final schema = resolver.resolve(type);
    return {
      'paramName': name,
      'paramType': schema.typeName(resolver),
      'paramToJson': schema.toJsonExpression(resolver, name),
      'paramFromJson': schema.fromJsonExpression(resolver, "json['$name']"),
    };
  }
}

extension SchemaRefGeneration on SchemaRef {
  String packageImport(Context context) {
    final name = p.basenameWithoutExtension(uri!.path);
    final snakeName = snakeFromCamel(name);
    return 'package:${context.packageName}/src/model/$snakeName.dart';
  }
}

// Separate load context vs. render context?
class Context {
  Context({
    required this.specUrl,
    required this.outDir,
    required this.packageName,
  }) : resolver = RefResolver(specUrl);

  late Spec spec;
  final Uri specUrl;
  final Directory outDir;
  final String packageName;
  final RefResolver resolver;

  Schema resolve(SchemaRef ref) {
    return resolver.resolve(ref);
  }

  Future<void> load() async {
    spec = await Spec.load(specUrl, resolver);
    // Crawl the spec and load all the schemas?
  }

  File _ensureFile(String path) {
    final file = File(p.join(outDir.path, path));
    file.parent.createSync(recursive: true);
    return file;
  }

  void writeFile({required String path, required String content}) {
    _ensureFile(path).writeAsStringSync(content);
  }

  void renderTemplate({
    required String template,
    required String outPath,
    required Map<String, dynamic> context,
  }) {
    final output = loadTemplate(template).renderString(context);
    writeFile(path: outPath, content: output);
  }

  void renderDirectory() {
    outDir.createSync(recursive: true);
    renderTemplate(
      template: 'pubspec',
      outPath: 'pubspec.yaml',
      context: {
        'packageName': packageName,
      },
    );
    renderTemplate(
      template: 'analysis_options',
      outPath: 'analysis_options.yaml',
      context: {},
    );
  }

  void renderApis() {
    for (final api in spec.apis) {
      final renderContext = RenderContext();
      renderApi(renderContext, this, api);
    }
  }

  void runDart(List<String> args) {
    logger.detail('dart ${args.join(' ')} in ${outDir.path}');
    final result = Process.runSync('dart', args, workingDirectory: outDir.path);
    if (result.exitCode != 0) {
      logger.info(result.stderr as String);
      throw Exception('Failed to run dart ${args.join(' ')}');
    }
    logger.detail(result.stdout as String);
  }

  void renderModelFile(String path) {
    final file = File(path);
    final contents = file.readAsStringSync();
    final name = p.basenameWithoutExtension(file.path);
    final uri = Uri.parse(file.path);
    final schema = parseSchema(
      current: uri,
      name: name,
      json: jsonDecode(contents) as Map<String, dynamic>,
    );
    renderRootSchema(this, schema);
  }

  void renderModels() {
    // This is a hack.
    const modelsPath = '../api-docs/models';
    final dir = Directory(modelsPath);
    for (final entity in dir.listSync()) {
      if (entity is! File) {
        continue;
      }
      renderModelFile(entity.path);
    }
  }

  void render() {
    renderDirectory();
    renderApis();
    renderModels();
    runDart(['pub', 'get']);
    // Run format first to add missing commas.
    runDart(['format', '.']);
    // Then run fix to clean up various other things.
    runDart(['fix', '.', '--apply']);
    // Run format again to fix wrapping of lines.
    runDart(['format', '.']);
  }
}

class RenderContext {
  /// Schemas to render in this file.
  List<Schema> inlineSchemas = [];

  /// Schemas to import and render in other files.
  List<SchemaRef> imported = [];

  void visitRef(SchemaRef ref) {
    if (ref.schema != null) {
      collectSchema(ref.schema!);
    } else {
      imported.add(ref);
    }
  }

  void collectApi(Api api) {
    for (final endpoint in api.endpoints) {
      for (final response in endpoint.responses.responses) {
        visitRef(response.content);
      }
      for (final param in endpoint.parameters) {
        visitRef(param.type);
      }
      if (endpoint.requestBody != null) {
        visitRef(endpoint.requestBody!);
      }
    }
  }

  void collectSchema(Schema schema) {
    if (schema.type == SchemaType.object) {
      inlineSchemas.add(schema);
    }
    for (final entry in schema.properties.entries) {
      visitRef(entry.value);
    }
    if (schema.type == SchemaType.array) {
      visitRef(schema.items!);
    }
  }
}

/// Starts a new RenderContext for rendering a new schema file.
void renderRootSchema(Context context, Schema schema) {
  // logger.info('Rendering ${schema.className}');

  final renderContext = RenderContext()..collectSchema(schema);
  // logger
  //   ..info('To import: ${renderContext.imported}')
  //   ..info('To render: ${renderContext.inlineSchemas}');

  final imports = <String>{};
  for (final ref in renderContext.imported) {
    imports.add(ref.packageImport(context));
  }
  final models = renderContext.inlineSchemas
      .map((schema) => schema.toTemplateContext(context.resolver))
      .toList();

  context.renderTemplate(
    template: 'model',
    outPath: _modelPath(schema),
    context: {
      'imports': imports.toList()..sort(),
      'models': models,
    },
  );
}

void renderApi(RenderContext renderContext, Context context, Api api) {
  final resolver = context.resolver;
  final endpoints =
      api.endpoints.map((e) => e.toTemplateContext(context)).toList();
  renderContext.collectApi(api);
  final imports =
      renderContext.imported.map((ref) => ref.packageImport(context)).toSet();
  final models = renderContext.inlineSchemas
      .map((schema) => schema.toTemplateContext(resolver))
      .toList();
  context.renderTemplate(
    template: 'api',
    outPath: _apiPath(api),
    context: {
      'className': api.className,
      'imports': imports.toList()..sort(),
      'endpoints': endpoints,
      'models': models,
    },
  );
}
