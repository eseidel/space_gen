import 'package:file/file.dart';
import 'package:meta/meta.dart';
import 'package:space_gen/src/loader.dart';
import 'package:space_gen/src/logger.dart';
import 'package:space_gen/src/parse/spec.dart';
import 'package:space_gen/src/parse/visitor.dart';
import 'package:space_gen/src/parser.dart';
import 'package:space_gen/src/quirks.dart';
import 'package:space_gen/src/render/file_renderer.dart';
import 'package:space_gen/src/render/render_tree.dart';
import 'package:space_gen/src/render/schema_renderer.dart';
import 'package:space_gen/src/render/templates.dart';
import 'package:space_gen/src/resolver.dart';
import 'package:space_gen/src/string.dart';

export 'package:space_gen/src/quirks.dart';

class _RefCollector extends Visitor {
  _RefCollector(this._refs);

  final Set<String> _refs;

  @override
  void visitReference<T>(RefOr<T> ref) {
    if (ref.ref != null) {
      _refs.add(ref.ref!);
    }
  }
}

Iterable<String> collectRefs(OpenApi root) {
  final refs = <String>{};
  final collector = _RefCollector(refs);
  SpecWalker(collector).walkRoot(root);
  return refs;
}

Future<void> loadAndRenderSpec({
  required Uri specUri,
  required String packageName,
  required Directory outDir,
  Directory? templateDir,
  RunProcess? runProcess,
  Quirks quirks = const Quirks(),
}) async {
  final fs = outDir.fileSystem;

  final templates = templateDir == null
      ? TemplateProvider.defaultLocation()
      : TemplateProvider.fromDirectory(templateDir);

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

  // Resolve all references in the spec.
  final resolved = resolveSpec(spec);
  final resolver = SpecResolver(quirks);
  // Convert the resolved spec into render objects.
  final renderSpec = resolver.toRenderSpec(resolved);
  // SchemaRenderer is responsible for rendering schemas and APIs into strings.
  final schemaRenderer = SchemaRenderer(templates: templates, quirks: quirks);

  logger.info('Generating $specUri to ${outDir.path}');
  // Could make clearing of the directory optional.
  if (outDir.existsSync()) {
    outDir.deleteSync(recursive: true);
  }

  final formatter = Formatter(runProcess: runProcess);
  final fileWriter = FileWriter(outDir: outDir);

  // FileRenderer is responsible for deciding the layout of the files
  // and rendering the rest of directory structure.
  FileRenderer(
    packageName: packageName,
    templates: templates,
    schemaRenderer: schemaRenderer,
    formatter: formatter,
    fileWriter: fileWriter,
  ).render(renderSpec);
}

/// Convenient for testing, should eventually clean up more and expose as API.
@visibleForTesting
String renderSchema(
  Map<String, dynamic> schemaJson, {
  String schemaName = 'test',
  Quirks quirks = const Quirks(),
}) {
  final parsedSchema = parseSchema(
    MapContext.initial(schemaJson).addSnakeName(schemaName),
  );
  final resolvedSchema = resolveSchemaRef(
    SchemaRef.schema(parsedSchema, const JsonPointer.empty()),
    ResolveContext.test(),
  );
  final resolver = SpecResolver(quirks);
  final templates = TemplateProvider.defaultLocation();

  final renderSchema = resolver.toRenderSchema(resolvedSchema);
  final schemaRenderer = SchemaRenderer(templates: templates, quirks: quirks);
  return schemaRenderer.renderSchema(renderSchema);
}

@visibleForTesting
String renderOperation({
  required String path,
  required Map<String, dynamic> operationJson,
  required Uri serverUrl,
  Quirks quirks = const Quirks(),
}) {
  final parsedOperation = parseOperation(
    MapContext.initial(operationJson),
    path,
  );
  final resolvedOperation = resolveOperation(
    path: path,
    method: Method.post,
    operation: parsedOperation,
    context: ResolveContext.test(),
  );
  final resolver = SpecResolver(quirks);
  final renderOperation = resolver.toRenderOperation(resolvedOperation);
  final templateProvider = TemplateProvider.defaultLocation();
  final schemaRenderer = SchemaRenderer(
    templates: templateProvider,
    quirks: quirks,
  );
  final tag = resolvedOperation.tags.firstOrNull ?? 'Default';
  final className = '${tag.capitalize()}Api';
  final endpoint = Endpoint(serverUrl: serverUrl, operation: renderOperation);
  return schemaRenderer.renderEndpoints(
    className: className,
    endpoints: [endpoint],
  );
}
