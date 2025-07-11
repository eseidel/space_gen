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
  void visitReference<T extends Parseable>(RefOr<T> ref) {
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

void validatePackageName(String packageName) {
  // Validate that packageName is a valid dart package name.
  // Should be snake_case starting with a letter.
  final validRegexp = RegExp(r'^[a-z][a-z0-9_]{0,63}$');
  if (!validRegexp.hasMatch(packageName)) {
    throw FormatException('"$packageName" is not a valid dart package name.');
  }
}

Future<void> loadAndRenderSpec({
  required Uri specUrl,
  required String packageName,
  required Directory outDir,
  Directory? templateDir,
  RunProcess? runProcess,
  Quirks quirks = const Quirks(),
  bool logSchemas = true,
}) async {
  final fs = outDir.fileSystem;
  validatePackageName(packageName);

  final templates = templateDir == null
      ? TemplateProvider.defaultLocation()
      : TemplateProvider.fromDirectory(templateDir);

  // Load the spec and warm the cache before rendering.
  final cache = Cache(fs);
  final specJson = await cache.load(specUrl);
  final spec = parseOpenApi(specJson);

  // Pre-warm the cache. Rendering assumes all refs are present in the cache.
  for (final ref in collectRefs(spec)) {
    // We need to walk all the refs and get type and location.
    // We load the locations, and then parse them as the types.
    // And then stick them in the resolver cache.

    // If any of the refs are network urls, we need to fetch them.
    // The cache does not handle fragments, so we need to remove them.
    final resolved = specUrl.resolve(ref).removeFragment();
    await cache.load(resolved);
  }

  // Resolve all references in the spec.
  final resolved = resolveSpec(spec, specUrl: specUrl);
  final resolver = SpecResolver(quirks);
  // Convert the resolved spec into render objects.
  final renderSpec = resolver.toRenderSpec(resolved);
  // SchemaRenderer is responsible for rendering schemas and APIs into strings.
  final schemaRenderer = SchemaRenderer(templates: templates, quirks: quirks);

  logger.info('Generating $specUrl to ${outDir.path}');

  final formatter = Formatter(runProcess: runProcess);
  final spellChecker = SpellChecker(runProcess: runProcess);
  final fileWriter = FileWriter(outDir: outDir);

  // FileRenderer is responsible for deciding the layout of the files
  // and rendering the rest of directory structure.
  FileRenderer(
    packageName: packageName,
    templates: templates,
    schemaRenderer: schemaRenderer,
    formatter: formatter,
    fileWriter: fileWriter,
    spellChecker: spellChecker,
  ).render(renderSpec);
}

@visibleForTesting
String renderTestSchema(
  Map<String, dynamic> schemaJson, {
  String schemaName = 'test',
  Quirks quirks = const Quirks(),
  bool asComponent = false,
}) {
  final MapContext context;
  // If asComponent is true, we need to parse the schema as though it were
  // defined in #/components/schemas/schemaName, this is used to make
  // hasExplicitName return true, and thus the schema be rendered as a
  // separate class.
  if (asComponent) {
    context = MapContext(
      pointerParts: ['components', 'schemas', schemaName],
      snakeNameStack: [schemaName],
      json: schemaJson,
    );
  } else {
    // Otherwise parse as though the schema was defined in the root
    // (which isn't realistic, but makes for short pointers).
    context = MapContext.initial(schemaJson).addSnakeName(schemaName);
  }
  final parsedSchema = parseSchema(context);
  final resolvedSchema = resolveSchemaRef(
    SchemaRef.object(parsedSchema, const JsonPointer.empty()),
    ResolveContext.test(),
  );
  final resolver = SpecResolver(quirks);
  final templates = TemplateProvider.defaultLocation();

  final renderSchema = resolver.toRenderSchema(resolvedSchema);
  final schemaRenderer = SchemaRenderer(templates: templates, quirks: quirks);
  return schemaRenderer.renderSchema(renderSchema);
}

/// Render a set of schemas to separate strings.
@visibleForTesting
Map<String, String> renderTestSchemas(
  Map<String, Map<String, dynamic>> schemas, {
  required Uri specUrl,
  Quirks quirks = const Quirks(),
}) {
  final schemasContext = MapContext(
    pointerParts: ['components', 'schemas'],
    snakeNameStack: [],
    json: schemas,
  );
  final parsedSchemas = schemas.map<String, Schema>((key, value) {
    final context = MapContext.fromParent(
      parent: schemasContext,
      json: value,
      key: key,
    ).addSnakeName(key);
    return MapEntry(key, parseSchema(context));
  });

  final refRegistry = RefRegistry();
  void add(HasPointer object) {
    final fragment = object.pointer.urlEncodedFragment;
    final uri = specUrl.resolve(fragment);
    refRegistry.register(uri, object);
  }

  for (final parsedSchema in parsedSchemas.values) {
    add(parsedSchema);
  }
  final resolveContext = ResolveContext(
    specUrl: specUrl,
    refRegistry: refRegistry,
  );

  final resolvedSchemas = parsedSchemas.map((key, value) {
    return MapEntry(
      key,
      resolveSchemaRef(
        SchemaRef.object(value, const JsonPointer.empty()),
        resolveContext,
      ),
    );
  });
  final resolver = SpecResolver(quirks);
  final templates = TemplateProvider.defaultLocation();

  final renderSchemas = resolvedSchemas.map((key, value) {
    final renderSchema = resolver.toRenderSchema(value);
    final schemaRenderer = SchemaRenderer(templates: templates, quirks: quirks);
    return MapEntry(key, schemaRenderer.renderSchema(renderSchema));
  });

  return renderSchemas;
}

@visibleForTesting
String renderTestOperation({
  required String path,
  required Map<String, dynamic> operationJson,
  required Uri serverUrl,
  Quirks quirks = const Quirks(),
  String? removePrefix,
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
  final className = '${tag.capitalizeFirst()}Api';
  final endpoint = Endpoint(serverUrl: serverUrl, operation: renderOperation);
  return schemaRenderer.renderEndpoints(
    description: 'Test API',
    className: className,
    endpoints: [endpoint],
    removePrefix: removePrefix,
  );
}

/// Render the first api from a complete spec.
/// This is mostly useful for testing tags which are not part of the operation
/// and need to be looked up from the root spec tags list.
@visibleForTesting
String renderTestApiFromSpec({
  required Map<String, dynamic> specJson,
  required Uri serverUrl,
  required Uri specUrl,
  Quirks quirks = const Quirks(),
}) {
  final spec = parseOpenApi(specJson);
  final resolvedSpec = resolveSpec(spec, specUrl: specUrl, logSchemas: false);
  final renderSpec = SpecResolver(quirks).toRenderSpec(resolvedSpec);
  final api = renderSpec.apis.first;
  final templateProvider = TemplateProvider.defaultLocation();
  final schemaRenderer = SchemaRenderer(
    templates: templateProvider,
    quirks: quirks,
  );
  return schemaRenderer.renderApi(api);
}
