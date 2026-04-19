// Example consumer entrypoint for space_gen.
//
// Shows how a downstream caller plugs a custom [FileRenderer] into
// the standard [loadAndRenderSpec] pipeline. This script generates
// a layout matching Shorebird's hand-written
// `shorebird_code_push_protocol` package: request/response DTOs
// owned by a single operation nest under a per-operation directory,
// domain models land in `lib/models/`, shared messages stay flat.
//
// Treat the space_gen extension surface used here
// (`fileRendererBuilder`, the `@protected` hooks on `FileRenderer`)
// as a preview — names and shape may still change.
//
// Usage:
//   dart run tool/gen_shorebird.dart -i codepush.yaml -o codepush_out

import 'dart:isolate';

import 'package:args/args.dart';
import 'package:file/local.dart';
import 'package:path/path.dart' as p;
import 'package:space_gen/space_gen.dart';

class ShorebirdFileRenderer extends FileRenderer {
  ShorebirdFileRenderer({
    required super.packageName,
    required super.templates,
    required super.schemaRenderer,
    required super.formatter,
    required super.fileWriter,
    required super.spellChecker,
  });

  @override
  String modelSubdir(RenderSchema schema) {
    final className = schema.typeName;
    final isMessage =
        className.endsWith('Request') || className.endsWith('Response');
    if (!isMessage) return 'models';
    final base = _messageBaseName(schema.snakeName);
    if (operationSnakeNames.contains(base)) {
      return 'messages/$base';
    }
    return 'messages';
  }

  /// Strip a trailing `_request`/`_response` (and any HTTP status code
  /// inline-schema suffix like `200_response`) from [snake], returning
  /// the operation-name portion. Non-matching input is returned as-is.
  static String _messageBaseName(String snake) {
    for (final suffix in const ['_request', '_response']) {
      if (snake.endsWith(suffix)) {
        var base = snake.substring(0, snake.length - suffix.length);
        final match = RegExp(r'\d+$').firstMatch(base);
        if (match != null) {
          base = base.substring(0, match.start);
        }
        return base;
      }
    }
    return snake;
  }
}

Future<int> main(List<String> arguments) async {
  const fs = LocalFileSystem();
  final parser = ArgParser()
    ..addOption('in', abbr: 'i', mandatory: true, help: 'Path or URL to spec')
    ..addOption('out', abbr: 'o', mandatory: true, help: 'Output directory')
    ..addFlag('verbose', abbr: 'v');
  final results = parser.parse(arguments);

  return runWithLogger(Logger(), () async {
    if (results['verbose'] as bool) setVerboseLogging();

    final specUrl = Uri.parse(results['in'] as String);
    final outDir = fs.directory(results['out'] as String);
    final packageName = p.basename(outDir.path);

    final templatesUri = await Isolate.resolvePackageUri(
      Uri.parse('package:space_gen/templates'),
    );
    final templatesDir = templatesUri != null
        ? fs.directory(templatesUri.toFilePath())
        : fs.directory('lib/templates');

    await loadAndRenderSpec(
      specUrl: specUrl,
      packageName: packageName,
      outDir: outDir,
      templatesDir: templatesDir,
      fileRendererBuilder: ShorebirdFileRenderer.new,
    );
    return 0;
  });
}
