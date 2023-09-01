import 'dart:io';

import 'package:mustache_template/mustache_template.dart';
import 'package:path/path.dart' as p;
import 'package:space_gen/space_gen.dart';

Template loadTemplate(String name) {
  return Template(
    File('templates/$name.mustache').readAsStringSync(),
    name: name,
  );
}

class Model {
  Model({required this.className, required this.fileName});
  final String className;
  final String fileName;
}

extension ApiGeneration on Api {
  String get className => '${name.capitalize()}Api';
  String get fileName => '${name.toLowerCase()}_api';
}

class Context {
  Context(this.spec, this.outDir);
  final Spec spec;
  final Directory outDir;
  final packageName = 'space_gen_example';
  final baseUrl = 'https://api.spacetraders.io/v2';

  File _ensureFile(String path) {
    final file = File(p.join(outDir.path, path));
    file.parent.createSync(recursive: true);
    return file;
  }

  Uri uriForEndpoint(Endpoint endpoint) {
    return Uri.parse('$baseUrl${endpoint.path}');
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

  void render() {
    renderDirectory();
    renderApis();
    runDart(['pub', 'get']);
    runDart(['fix', '.']);
    runDart(['format', '.']);
  }
}

extension on String {
  String capitalize() {
    if (isEmpty) {
      return this;
    }
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}

Model endpointResponseBaseModel(Endpoint endpoint) {
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

  final snakeName = endpoint.operationId.splitMapJoin(
    '-',
    onMatch: (m) => '_',
    onNonMatch: (n) => n.toLowerCase(),
  );
  final fileName = '$snakeName${responseCode}_response';
  return Model(className: className, fileName: fileName);
}

List<Model> modelsFromEndpoint(Endpoint endpoint) {
  return [endpointResponseBaseModel(endpoint)];
}

String methodNameForEndpoint(Endpoint endpoint) {
  return endpoint.operationId.splitMapJoin(
    '-',
    onMatch: (m) => '',
    onNonMatch: (n) => n.capitalize(),
  );
}

void renderModel(Context context, Model model) {
  final template = loadTemplate('model');
  final output = template.renderString(
    {
      'className': model.className,
    },
  );
  context.writeFile(
    path: 'lib/src/model/${model.fileName}.dart',
    content: output,
  );
}

List<Model> modelsForApi(Api api) {
  final models = <Model>[];
  for (final endpoint in api.endpoints) {
    models.addAll(modelsFromEndpoint(endpoint));
  }
  return models;
}

String importForModel(Context context, Model model) {
  return 'package:${context.packageName}/src/model/${model.fileName}.dart';
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
