import 'package:args/args.dart';
import 'package:file/local.dart';
import 'package:space_gen/space_gen.dart';
import 'package:space_gen/src/config.dart';
import 'package:space_gen/src/loader.dart';
import 'package:space_gen/src/logger.dart';
import 'package:space_gen/src/spec.dart';
import 'package:space_gen/src/visitor.dart';

Future<int> main(List<String> arguments) async {
  const fs = LocalFileSystem();
  // Mostly trying to match openapi-generator-cli
  final parser =
      ArgParser()..addOption('config', abbr: 'c', help: 'Path to config file');
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

  final specPath = config.specUri;
  final outDir = config.outDir;
  logger.info('Generating $specPath to ${outDir.path}');

  // Could make clearing of the directory optional.
  if (outDir.existsSync()) {
    outDir.deleteSync(recursive: true);
  }

  final cache = Cache(fs);
  final parseContext = ParseContext.initial(config.specUri);
  final specJson = await cache.load(config.specUri);
  final spec = parseSpec(specJson, parseContext);

  logger.detail('Registered schemas:');
  for (final uri in parseContext.schemas.schemas.keys) {
    logger.detail('  - $uri');
  }

  // Print stats about the spec.
  logger.detail('Spec:');
  for (final api in spec.tags) {
    logger.detail('  - $api');
    final endpoints = spec.endpoints.where((e) => e.tag == api);
    for (final endpoint in endpoints) {
      logger.detail('    - ${endpoint.method.key} ${endpoint.path}');
    }
  }

  // Pre-warm the cache. Rendering assumes all refs are present in the cache.
  for (final ref in collectRefs(spec)) {
    // If any of the refs are network urls, we need to fetch them.
    // The cache does not handle fragments, so we need to remove them.
    final resolved = config.specUri.resolve(ref).removeFragment();
    await cache.load(resolved);
  }

  Context(
    spec: spec,
    schemaRegistry: parseContext.schemas,
    specUrl: config.specUri,
    fs: fs,
    outDir: outDir,
    packageName: config.packageName,
  ).render();
  return 0;
}
