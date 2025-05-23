import 'package:args/args.dart';
import 'package:file/local.dart';
import 'package:space_gen/src/config.dart';
import 'package:space_gen/src/logger.dart';
import 'package:space_gen/src/render.dart';

Future<int> run(List<String> arguments) async {
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
    config = loadFromFile(fs.file(configPath));
  } else {
    logger
      ..err('No config file provided')
      ..info(parser.usage);
    return 1;
  }

  await renderSpec(
    specUri: config.specUri,
    packageName: config.packageName,
    outDir: config.outDir,
  );
  return 0;
}

Future<int> main(List<String> arguments) async {
  return runWithLogger(Logger(), () => run(arguments));
}
