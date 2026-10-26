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
/// [loadAndRenderSpec]. Returns the process exit code: 0 on success,
/// 64 (usage) for bad arguments. Dart ignores `main`'s return value, so
/// callers assign it to `exitCode` from `dart:io`.
///
/// The core CLI is identical across every consumer; only the
/// [fileRendererBuilder] tends to vary. Shorebird's entrypoint, for
/// example, is:
///
/// ```dart
/// Future<void> main(List<String> args) async {
///   exitCode = await runCli(
///     args,
///     fileRendererBuilder: ShorebirdFileRenderer.new,
///   );
/// }
/// ```
///
/// Consumers that need to customize anything else — new flags,
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
    ..addFlag('help', abbr: 'h', negatable: false, help: 'Show this help')
    ..addFlag('verbose', abbr: 'v', help: 'Verbose output')
    ..addFlag('openapi', help: 'Use OpenAPI quirks')
    ..addFlag(
      'clear',
      defaultsTo: true,
      help:
          'Remove files we did not generate from the directories we '
          'generate into, so a renamed or deleted schema leaves no '
          'stale file behind. Pass --no-clear to manage stale output '
          'yourself.',
    );
  int usageError(String message) {
    logger
      ..err(message)
      ..info(parser.usage);
    return ExitCode.usage.code;
  }

  final ArgResults results;
  try {
    results = parser.parse(arguments);
  } on ArgParserException catch (e) {
    return usageError(e.message);
  }
  if (results['help'] as bool) {
    logger.info(parser.usage);
    return ExitCode.success.code;
  }
  if (results.rest.isNotEmpty) {
    return usageError('Unexpected arguments: ${results.rest}');
  }
  // ArgResults throws an ArgumentError when a missing mandatory option
  // is read, so check for them up front.
  for (final option in parser.options.values.where((o) => o.mandatory)) {
    if (!results.wasParsed(option.name)) {
      return usageError('Missing required option --${option.name}.');
    }
  }

  if (results['verbose'] as bool) setVerboseLogging();

  final specUrl = Uri.parse(results['in'] as String);
  final outDir = fs.directory(results['out'] as String);
  final rawPackageName = p.basename(outDir.path);
  final packageName = sanitizePackageName(rawPackageName);
  if (packageName != rawPackageName) {
    logger.info(
      "Using '$packageName' as the package name "
      "since '$rawPackageName' is not a valid Dart package name.",
    );
  }
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
      clearDirectory: results['clear'] as bool,
      fileRendererBuilder: fileRendererBuilder,
    ),
  );
  return 0;
}
