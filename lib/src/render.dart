import 'package:file/file.dart';
import 'package:space_gen/src/context.dart';
import 'package:space_gen/src/loader.dart';
import 'package:space_gen/src/logger.dart';
import 'package:space_gen/src/spec.dart';
import 'package:space_gen/src/visitor.dart';

Future<void> loadAndRenderSpec({
  required Uri specUri,
  required String packageName,
  required Directory outDir,
  Directory? templateDir,
  RunProcess? runProcess,
}) async {
  final fs = outDir.fileSystem;
  logger.info('Generating $specUri to ${outDir.path}');

  // Could make clearing of the directory optional.
  if (outDir.existsSync()) {
    outDir.deleteSync(recursive: true);
  }

  final cache = Cache(fs);
  final parseContext = ParseContext.initial(specUri);
  final specJson = await cache.load(specUri);
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
    final resolved = specUri.resolve(ref).removeFragment();
    await cache.load(resolved);
  }

  renderSpec(
    spec: spec,
    schemaRegistry: parseContext.schemas,
    specUri: specUri,
    outDir: outDir,
    packageName: packageName,
    templateDir: templateDir,
    runProcess: runProcess,
  );
}
