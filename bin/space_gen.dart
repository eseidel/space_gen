import 'package:args/args.dart';
import 'package:file/local.dart';
import 'package:space_gen/space_gen.dart';
import 'package:space_gen/src/config.dart';
import 'package:space_gen/src/logger.dart';

Future<int> main(List<String> arguments) async {
  const fs = LocalFileSystem();
  // Mostly trying to match openapi-generator-cli
  final parser = ArgParser()
    ..addOption('config', abbr: 'c', help: 'Path to config file');
  final results = parser.parse(arguments);
  if (results.rest.isNotEmpty) {
    logger
      ..err('Unexpected arguments: ${results.rest}')
      ..info(parser.usage);
    return 1;
  }

  final configPath = results['config'] as String?;
  final Config config;
  if (configPath != null) {
    config = loadFromFile(fs, configPath);
  } else {
    logger
      ..err('No config file provided')
      ..info(parser.usage);
    return 1;
  }

  final specPath = config.specUri;
  final outDirPath = config.outDirPath;
  logger.info('Generating $specPath to $outDirPath');

  // Could make clearing of the directory optional.
  final outDir = fs.directory(outDirPath);
  if (outDir.existsSync()) {
    outDir.deleteSync(recursive: true);
  }
  final context = Context(
    fileSystem: fs,
    specUrl: config.specUri,
    outDir: outDir,
    packageName: config.packageName,
  );
  await context.load();
  context.render();
  return 0;
}
