import 'dart:convert';
import 'dart:io';

import 'package:mustache_template/mustache_template.dart';
import 'package:path/path.dart' as p;
import 'package:space_gen/space_gen.dart';
import 'package:space_gen/src/string.dart';

Template loadTemplate(String name) {
  return Template(
    File('templates/$name.mustache').readAsStringSync(),
    name: name,
  );
}

extension ApiGeneration on Api {
  String get className => '${name.capitalize()}Api';
  String get fileName => '${name.toLowerCase()}_api';
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
}

// Separate load context vs. render context?
class Context {
  Context(this.specUrl, this.outDir) : resolver = RefResolver(specUrl);
  late Spec spec;
  final Uri specUrl;
  final Directory outDir;
  final packageName = 'space_gen_example';
  final RefResolver resolver;

  Schema resolve(SchemaRef ref) {
    return resolver.resolve(ref);
  }

  Future<void> load() async {
    spec = await Spec.load(specUrl, resolver);
    // Crawl the spec and load all the schemas.
  }

  File _ensureFile(String path) {
    final file = File(p.join(outDir.path, path));
    file.parent.createSync(recursive: true);
    return file;
  }

  Uri uriForEndpoint(Endpoint endpoint) {
    return Uri.parse('${spec.serverUrl}${endpoint.path}');
  }

  void writeFile({required String path, required String content}) {
    _ensureFile(path).writeAsStringSync(content);
  }

  File fileForApi(Api api) {
    return _ensureFile('lib/src/api/${api.fileName}.dart');
  }

  void renderDirectory() {
    outDir.createSync(recursive: true);
    final template = loadTemplate('pubspec');
    final output = template.renderString(<String, dynamic>{
      'packageName': packageName,
    });
    writeFile(path: 'pubspec.yaml', content: output);
  }

  void renderApis() {
    for (final api in spec.apis) {
      renderApi(this, api);
    }
  }

  void runDart(List<String> args) {
    Process.runSync('dart', args, workingDirectory: outDir.path);
  }

  void renderModels() {
    // This is a hack.
    const modelsPath = '../api-docs/models';
    final dir = Directory(modelsPath);
    for (final entity in dir.listSync()) {
      if (entity is! File) {
        continue;
      }
      final file = entity;
      final contents = file.readAsStringSync();
      final name = p.basenameWithoutExtension(file.path);
      final uri = Uri.parse(file.path);
      final schema = parseSchema(
        current: uri,
        name: name,
        json: jsonDecode(contents) as Map<String, dynamic>,
      );
      renderModel(this, schema);
    }
  }

  void render() {
    renderDirectory();
    renderApis();
    renderModels();
    runDart(['pub', 'get']);
    runDart(['fix', '.']);
    runDart(['format', '.']);
  }
}

Schema endpointResponseBaseModel(Endpoint endpoint) {
  // Hack to make get cooldown compile.
  final responseCodes = endpoint.responses.keys.toList()..remove('204');
  if (responseCodes.length != 1) {
    throw UnimplementedError(
      'Multiple responses not supported, ${endpoint.path}',
    );
  }
  final camelName = endpoint.operationId.splitMapJoin(
    '-',
    onMatch: (m) => '',
    onNonMatch: (n) => n.capitalize(),
  );
  final responseCode = responseCodes.first;
  final className = '$camelName${responseCode}Response';
  return Schema(name: className, type: SchemaType.object);
}

List<Schema> modelsFromEndpoint(Endpoint endpoint) {
  return [endpointResponseBaseModel(endpoint)];
}

String methodNameForEndpoint(Endpoint endpoint) {
  return endpoint.operationId.splitMapJoin(
    '-',
    onMatch: (m) => '',
    onNonMatch: (n) => n.capitalize(),
  );
}

void renderModel(Context context, Schema schema) {
  print('Rendering model ${schema.className}');
  final template = loadTemplate('model');
  final properties = [
    for (final entry in schema.properties.entries)
      {
        'propertyName': entry.key,
        'propertyType': context.resolve(entry.value).typeName(context.resolver),
      },
  ];
  final output = template.renderString(
    {
      'className': schema.className,
      'hasProperties': properties.isNotEmpty,
      'properties': properties,
    },
  );
  context.writeFile(
    path: 'lib/src/model/${schema.fileName}.dart',
    content: output,
  );
}

List<Schema> modelsForApi(Api api) {
  final models = <Schema>[];
  for (final endpoint in api.endpoints) {
    models.addAll(modelsFromEndpoint(endpoint));
  }
  return models;
}

String importForModel(Context context, Schema schema) {
  return 'package:${context.packageName}/src/model/${schema.fileName}.dart';
}

void renderApi(Context context, Api api) {
  final models = modelsForApi(api);
  final imports = <String>{};
  for (final model in models) {
    imports.add(importForModel(context, model));
  }

  for (final model in models) {
    renderModel(context, model);
  }

  final template = loadTemplate('api');
  final output = template.renderString(
    {
      'className': api.className,
      'imports': imports,
      'endpoints': [
        for (final endpoint in api.endpoints)
          {
            'url': '${context.uriForEndpoint(endpoint)}',
            'methodName': methodNameForEndpoint(endpoint),
            'allParams': [
              for (final param in endpoint.parameters)
                {
                  'paramName': param.name,
                  'paramType': param.type,
                },
            ],
            'returnType': endpointResponseBaseModel(endpoint).className,
          },
      ],
    },
  );
  context.fileForApi(api).writeAsStringSync(output);
}
