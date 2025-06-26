import 'dart:io';

import 'package:collection/collection.dart';
import 'package:file/file.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart' as p;
import 'package:space_gen/src/logger.dart';
import 'package:space_gen/src/quirks.dart';
import 'package:space_gen/src/render/render_tree.dart';
import 'package:space_gen/src/render/schema_renderer.dart';
import 'package:space_gen/src/render/templates.dart';
import 'package:space_gen/src/render/tree_visitor.dart';

typedef RunProcess =
    ProcessResult Function(
      String executable,
      List<String> arguments, {
      String? workingDirectory,
    });

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

@visibleForTesting
void logNameCollisions(Iterable<RenderSchema> schemas) {
  // List schemas with name collisions but different pointers.
  final nameCollisions = schemas.groupListsBy((s) => s.snakeName);
  for (final entry in nameCollisions.entries) {
    if (entry.value.length > 1) {
      logger.warn(
        'Schema ${entry.key} has ${entry.value.length} name collisions',
      );
      for (final schema in entry.value) {
        logger.info('${schema.pointer}');
      }
    }
  }
}

class Formatter {
  Formatter({RunProcess? runProcess})
    : runProcess = runProcess ?? Process.runSync;

  /// The function to run a process. Allows for mocking in tests.
  final RunProcess runProcess;

  /// Run a dart command.
  void _runDart(List<String> args, {required String workingDirectory}) {
    final command = 'dart ${args.join(' ')}';
    logger
      ..info('Running $command')
      ..detail('$command in $workingDirectory');
    final stopwatch = Stopwatch()..start();
    final result = runProcess(
      Platform.executable,
      args,
      workingDirectory: workingDirectory,
    );
    if (result.exitCode != 0) {
      logger.info(result.stderr as String);
      throw Exception('Failed to run dart ${args.join(' ')}');
    }
    final ms = stopwatch.elapsed.inMilliseconds;
    logger
      ..detail(result.stdout as String)
      ..info('$command took $ms ms');
  }

  void formatAndFix({required String pkgDir}) {
    // Consider running pub upgrade here to ensure packages are up to date.
    // Might need to make offline configurable?
    _runDart(['pub', 'get', '--offline'], workingDirectory: pkgDir);
    // Run format first to add missing commas.
    _runDart(['format', '.'], workingDirectory: pkgDir);
    // Then run fix to clean up various other things.
    _runDart(['fix', '.', '--apply'], workingDirectory: pkgDir);
    // Run format again to fix wrapping of lines.
    _runDart(['format', '.'], workingDirectory: pkgDir);
  }
}

class FileWriter {
  FileWriter({required this.outDir}) : fs = outDir.fileSystem;

  /// The output directory.
  final Directory outDir;

  /// The file system where the rendered files will go.
  final FileSystem fs;

  final Set<String> _writtenFiles = {};

  /// Ensure a file exists.
  File _ensureFile(String path) {
    final file = fs.file(p.join(outDir.path, path));
    file.parent.createSync(recursive: true);
    return file;
  }

  /// Write a file.
  void writeFile({required String path, required String content}) {
    if (_writtenFiles.contains(path)) {
      throw Exception('File $path already written');
    }
    _writtenFiles.add(path);
    _ensureFile(path).writeAsStringSync(content);
  }

  /// Create a directory.
  void createOutDir() {
    fs.directory(outDir.path).createSync(recursive: true);
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
    required this.packageName,
    required this.templates,
    required this.schemaRenderer,
    required this.formatter,
    required this.fileWriter,
  });

  /// The package name this spec is being rendered into.
  final String packageName;

  /// The file writer to use for writing the files.
  final FileWriter fileWriter;

  /// The provider of templates.  Could be different from the one used by
  /// the schema renderer, so we hold our own.
  final TemplateProvider templates;

  /// The formatter to use for formatting the files.
  final Formatter formatter;

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

  /// Render a template.
  void _renderTemplate({
    required String template,
    required String outPath,
    Map<String, dynamic> context = const {},
  }) {
    final output = templates.load(template).renderString(context);
    fileWriter.writeFile(path: outPath, content: output);
  }

  /// Render the package directory including
  /// pubspec, analysis_options, and gitignore.
  void _renderDirectory() {
    fileWriter.createOutDir();
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
      RenderNewType() => true,
      RenderSchema() => false,
    };
  }

  @visibleForTesting
  Iterable<Import> importsForApi(Api api) {
    // TODO(eseidel): Make type imports dynamic based on used schemas.
    final imports = {
      const Import('dart:async'),
      const Import('dart:convert'),
      const Import('dart:io'),
      Import('package:$packageName/api_client.dart'),
      Import('package:$packageName/api_exception.dart'),
      const Import('package:http/http.dart', asName: 'http'),
    };

    final apiSchemas = collectSchemasUnderApi(api);
    final inlineSchemas = apiSchemas.where((s) => !rendersToSeparateFile(s));
    final importedSchemas = apiSchemas.where(rendersToSeparateFile);
    final apiImports = importedSchemas
        .map((s) => Import(modelPackageImport(this, s)))
        .toList();
    imports.addAll({
      ...inlineSchemas.expand((s) => s.additionalImports),
      ...apiImports,
    });
    return imports;
  }

  void _renderApis(List<Api> apis) {
    for (final api in apis) {
      final content = schemaRenderer.renderApi(api);
      final imports = importsForApi(api);
      final importsContext = imports
          .sortedBy((i) => i.path)
          .map((i) => i.toTemplateContext())
          .toList();
      final outPath = apiFilePath(api);
      _renderTemplate(
        template: 'add_imports',
        outPath: outPath,
        context: {'imports': importsContext, 'content': content},
      );
    }
  }

  @visibleForTesting
  Iterable<Import> importsForModel(RenderSchema schema) {
    final referencedSchemas = collectSchemasUnderSchema(schema);
    final localSchemas = referencedSchemas.where(
      (s) => !rendersToSeparateFile(s),
    );
    final importedSchemas = referencedSchemas
        .where(rendersToSeparateFile)
        .toSet();
    final referencedImports = importedSchemas
        .map((s) => Import(modelPackageImport(this, s)))
        .toList();

    final imports = {
      const Import('dart:convert'),
      const Import('dart:io'),
      const Import('package:meta/meta.dart'),
      Import('package:$packageName/model_helpers.dart'),
      ...schema.additionalImports,
      ...localSchemas.expand((s) => s.additionalImports),
      ...referencedImports,
    };
    return imports;
  }

  void renderModels(Iterable<RenderSchema> schemas) {
    for (final schema in schemas) {
      final content = schemaRenderer.renderSchema(schema);
      final imports = importsForModel(schema);
      final importsContext = imports
          .sortedBy((i) => i.path)
          .map((i) => i.toTemplateContext())
          .toList();

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
    logNameCollisions(schemas);

    // Render the models (schemas).
    renderModels(schemas);
    // Render the api client.
    _renderApiClient(spec);
    // Render the combined api.dart exporting all rendered schemas.
    _renderPublicApi(spec.apis, schemas);
    formatter.formatAndFix(pkgDir: fileWriter.outDir.path);
  }
}
