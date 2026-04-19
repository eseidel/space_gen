import 'dart:isolate';

import 'package:args/args.dart';
import 'package:file/local.dart';
import 'package:path/path.dart' as p;
import 'package:space_gen/src/logger.dart';
import 'package:space_gen/src/render.dart';
import 'package:space_gen/src/render/file_renderer.dart';

/// Entrypoint helper: parses the standard space_gen CLI flags
/// (`--in`/`--out`/`--verbose`/`--openapi`), wires up a [Logger],
/// resolves the bundled templates directory, and runs
/// [loadAndRenderSpec].
///
/// The core CLI is identical across every consumer; only the
/// [fileRendererBuilder] tends to vary. Shorebird's entrypoint, for
/// example, is:
///
/// ```dart
/// Future<int> main(List<String> args) =>
///     runCli(args, fileRendererBuilder: ShorebirdFileRenderer.new);
/// ```
///
/// Consumers that need to customise anything else — new flags,
/// non-CLI argument sources, programmatic invocation — should build
/// their own `GeneratorConfig` and call [loadAndRenderSpec] directly.
Future<int> runCli(
  List<String> arguments, {
  FileRendererBuilder fileRendererBuilder = FileRenderer.new,
}) {
  return runWithLogger(
    Logger(),
    () => _runCli(arguments, fileRendererBuilder: fileRendererBuilder),
  );
}

Future<int> _runCli(
  List<String> arguments, {
  required FileRendererBuilder fileRendererBuilder,
}) async {
  const fs = LocalFileSystem();
  final parser = ArgParser()
    ..addOption('in', abbr: 'i', help: 'Path or URL to spec', mandatory: true)
    ..addOption(
      'out',
      abbr: 'o',
      help: 'Path to output directory',
      mandatory: true,
    )
    ..addFlag('verbose', abbr: 'v', help: 'Verbose output')
    ..addFlag('openapi', help: 'Use OpenAPI quirks');
  final results = parser.parse(arguments);
  if (results.rest.isNotEmpty) {
    logger
      ..err('Unexpected arguments: ${results.rest}')
      ..info(parser.usage);
    return 1;
  }

  if (results['verbose'] as bool) setVerboseLogging();

  final specUrl = Uri.parse(results['in'] as String);
  final outDir = fs.directory(results['out'] as String);
  final packageName = p.basename(outDir.path);
  final quirks = results['openapi'] as bool
      ? const Quirks.openapi()
      : const Quirks();

  final templatesUri = await Isolate.resolvePackageUri(
    Uri.parse('package:space_gen/templates'),
  );
  final templatesDir = templatesUri != null
      ? fs.directory(templatesUri.toFilePath())
      // TODO(eseidel): This fallback is likely wrong.
      : fs.directory('lib/templates');

  await loadAndRenderSpec(
    GeneratorConfig(
      specUrl: specUrl,
      packageName: packageName,
      outDir: outDir,
      quirks: quirks,
      templatesDir: templatesDir,
      fileRendererBuilder: fileRendererBuilder,
    ),
  );
  return 0;
}
