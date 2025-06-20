import 'package:file/file.dart';
import 'package:meta/meta.dart';
import 'package:space_gen/src/context.dart';
import 'package:space_gen/src/loader.dart';
import 'package:space_gen/src/logger.dart';
import 'package:space_gen/src/parser.dart';
import 'package:space_gen/src/render_tree.dart';
import 'package:space_gen/src/resolver.dart';
import 'package:space_gen/src/spec.dart';
import 'package:space_gen/src/visitor.dart';

export 'package:space_gen/src/context.dart' show Quirks;

Future<void> loadAndRenderSpec({
  required Uri specUri,
  required String packageName,
  required Directory outDir,
  Directory? templateDir,
  RunProcess? runProcess,
  Quirks quirks = const Quirks(),
}) async {
  final fs = outDir.fileSystem;

  // Load the spec and warm the cache before rendering.
  final cache = Cache(fs);
  final specJson = await cache.load(specUri);
  final spec = parseOpenApi(specJson);

  // TODO(eseidel): The cache is not used for anything yet.
  // We need a multi-file example spec to test this.
  // Pre-warm the cache. Rendering assumes all refs are present in the cache.
  for (final ref in collectRefs(spec)) {
    // If any of the refs are network urls, we need to fetch them.
    // The cache does not handle fragments, so we need to remove them.
    final resolved = specUri.resolve(ref).removeFragment();
    await cache.load(resolved);
  }

  final resolved = resolveSpec(spec);
  logger.info('Generating $specUri to ${outDir.path}');

  // Could make clearing of the directory optional.
  if (outDir.existsSync()) {
    outDir.deleteSync(recursive: true);
  }

  renderSpec(
    spec: resolved,
    specUri: specUri,
    outDir: outDir,
    packageName: packageName,
    templateDir: templateDir,
    runProcess: runProcess,
    quirks: quirks,
  );
}

void renderSpec({
  required Uri specUri,
  required String packageName,
  required Directory outDir,
  required ResolvedSpec spec,
  Directory? templateDir,
  RunProcess? runProcess,
  Quirks quirks = const Quirks(),
}) {
  final templateProvider = templateDir == null
      ? TemplateProvider.defaultLocation()
      : TemplateProvider.fromDirectory(templateDir);

  // Prepare a resolved spec for rendering converting into render objects.
  final renderSpec = toRenderSpec(spec);
  // SchemaRenderer is responsible for rendering schemas and APIs into strings.
  final schemaRenderer = SchemaRenderer(
    specUrl: specUri,
    templateProvider: templateProvider,
    quirks: quirks,
  );

  // FileRenderer is responsible for deciding the layout of the files
  // and rendering the rest of directory structure.
  FileRenderer(
    outDir: outDir,
    packageName: packageName,
    templateProvider: templateProvider,
    runProcess: runProcess,
    schemaRenderer: schemaRenderer,
  ).render(renderSpec);
}

/// Convenient for testing, should eventually clean up more and expose as API.
@visibleForTesting
String renderSchema(
  Map<String, dynamic> schemaJson, {
  String schemaName = 'test',
  Directory? templateDir,
  Quirks quirks = const Quirks(),
}) {
  final specUri = Uri.parse('https://example.com');
  final parsedSchema = parseSchema(
    MapContext.initial(schemaJson).addSnakeName(schemaName),
  );
  final resolveContext = ResolveContext(
    specUrl: specUri,
    refRegistry: RefRegistry(),
  );
  final resolvedSchema = resolveSchemaRef(
    SchemaRef.schema(parsedSchema),
    resolveContext,
  );
  final templateProvider = templateDir == null
      ? TemplateProvider.defaultLocation()
      : TemplateProvider.fromDirectory(templateDir);

  final renderSchema = toRenderSchema(resolvedSchema);
  final schemaRenderer = SchemaRenderer(
    specUrl: specUri,
    templateProvider: templateProvider,
    quirks: quirks,
  );
  return schemaRenderer.renderSchema(renderSchema);
}
