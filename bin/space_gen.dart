import 'package:args/args.dart';
import 'package:file/local.dart';
import 'package:path/path.dart' as p;
import 'package:space_gen/src/logger.dart';
import 'package:space_gen/src/render.dart';

Future<int> run(List<String> arguments) async {
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

  final verbose = results['verbose'] as bool;
  if (verbose) {
    setVerboseLogging();
  }

  final specUrl = Uri.parse(results['in'] as String);
  final outDir = fs.directory(results['out'] as String);
  final packageName = p.basename(outDir.path);
  final quirks = results['openapi'] as bool
      ? const Quirks.openapi()
      : const Quirks();

  await loadAndRenderSpec(
    specUrl: specUrl,
    packageName: packageName,
    outDir: outDir,
    quirks: quirks,
  );
  return 0;
}

Future<int> main(List<String> arguments) async {
  return runWithLogger(Logger(), () => run(arguments));
}
