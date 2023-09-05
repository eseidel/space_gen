import 'dart:io';

import 'package:args/args.dart';
import 'package:space_gen/space_gen.dart';
import 'package:space_gen/src/config.dart';
import 'package:space_gen/src/logger.dart';

void main(List<String> arguments) async {
  // Mostly trying to match openapi-generator-cli
  final parser = ArgParser()
    ..addOption('config', abbr: 'c', help: 'Path to config file');
  final results = parser.parse(arguments);
  if (results.rest.isNotEmpty) {
    logger.err('Unexpected arguments: ${results.rest}');
    exit(1);
  }

  final configPath = results['config'] as String?;
  final Config config;
  if (configPath != null) {
    config = loadFromFile(configPath);
  } else {
    logger.err('No config file provided');
    exit(1);
  }

  final specPath = config.specUri;
  final outDirPath = config.outDirPath;
  logger.info('Generating $specPath to $outDirPath');

  // Could make clearing of the directory optional.
  final outDir = Directory(outDirPath);
  if (outDir.existsSync()) {
    outDir.deleteSync(recursive: true);
  }
  final context = Context(
    specUrl: config.specUri,
    outDir: outDir,
    packageName: config.packageName,
  );
  await context.load();
  context.render();
}
