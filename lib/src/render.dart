import 'dart:collection';

import 'package:file/file.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart' as p;
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

/// Visitor that collects every [Ref] it sees. Used to find the full set of
/// references in a spec (root or external) so the loader can pull in every
/// externally-ref'd document before resolution runs.
class _RefCollector extends Visitor {
  _RefCollector(this._refs);

  final Set<Ref<Parseable>> _refs;

  @override
  void visitRefOr<T extends Parseable>(RefOr<T> refOr) {
    final ref = refOr.ref;
    if (ref != null) _refs.add(ref);
  }
}

Set<Ref<Parseable>> _collectRefsFromRoot(OpenApi root) {
  final refs = <Ref<Parseable>>{};
  SpecWalker(_RefCollector(refs)).walkRoot(root);
  return refs;
}

Set<Ref<Parseable>> _collectRefsFromComponents(Components components) {
  final refs = <Ref<Parseable>>{};
  SpecWalker(_RefCollector(refs)).walkComponents(components);
  return refs;
}

/// Load every document reachable from [rootSpec] through external `$ref`
/// and register its components in [refRegistry].
///
/// Uses the full parser (not a raw JSON scan) to find refs: a scan would
/// false-positive on `$ref` strings that sit inside `example:` payloads
/// or unsupported extension fields. The parser only surfaces refs in
/// spec-meaningful positions.
///
/// External documents are parsed as a "components library": only the
/// `components:` section is walked. That covers virtually all real-world
/// external refs (shared schema files, vendor extension libraries, etc.)
/// and side-steps the fact that external files aren't usually valid
/// standalone OpenAPI specs. Non-components external refs surface as a
/// lookup miss during resolution.
Future<void> _loadExternalRefs({
  required OpenApi rootSpec,
  required Uri rootSpecUrl,
  required Cache cache,
  required RefRegistry refRegistry,
}) async {
  final processedDocs = <Uri>{rootSpecUrl};
  // Each work item carries the URL of the doc containing the ref, so the
  // ref's (possibly relative) URI resolves against the right base.
  final workItems = Queue<(Uri sourceDoc, Ref<Parseable> ref)>();

  void enqueue(Uri sourceDoc, Iterable<Ref<Parseable>> refs) {
    for (final ref in refs) {
      workItems.add((sourceDoc, ref));
    }
  }

  enqueue(rootSpecUrl, _collectRefsFromRoot(rootSpec));

  while (workItems.isNotEmpty) {
    final (sourceDoc, ref) = workItems.removeFirst();
    final docUri = sourceDoc.resolveUri(ref.uri).removeFragment();
    if (!processedDocs.add(docUri)) continue;

    final doc = await cache.load(docUri);
    final componentsJson = doc['components'];
    if (componentsJson is! Map<String, dynamic>) {
      throw FormatException(
        'External ref target $docUri has no `components:` section; '
        'space_gen only supports external refs into OpenAPI-shaped '
        'components libraries.',
      );
    }
    final componentsContext = MapContext(
      pointerParts: ['components'],
      snakeNameStack: const [],
      json: componentsJson,
    );
    final components = parseComponents(componentsContext);

    SpecWalker(
      RegistryBuilder(docUri, refRegistry),
    ).walkComponents(components);

    enqueue(docUri, _collectRefsFromComponents(components));
  }
}

void validatePackageName(String packageName) {
  // Validate that packageName is a valid dart package name.
  // Should be snake_case starting with a letter.
  final validRegexp = RegExp(r'^[a-z][a-z0-9_]{0,63}$');
  if (!validRegexp.hasMatch(packageName)) {
    throw FormatException('"$packageName" is not a valid dart package name.');
  }
}

/// Coerce an arbitrary string into something that passes
/// [validatePackageName]: `.` `-` and any other non-alnum characters
/// collapse to `_`, casing is lowered, leading underscores and digits
/// are prefixed with `p`, and the result is clamped to 64 chars.
/// Used by the CLI so `--out api.github.com` works without the user
/// having to pre-sanitize the directory name for pub.
String sanitizePackageName(String raw) {
  var s = raw.toLowerCase().replaceAll(RegExp(r'[^a-z0-9_]'), '_');
  s = s.replaceAll(RegExp('_+'), '_').replaceAll(RegExp(r'^_+|_+$'), '');
  if (s.isEmpty || RegExp('^[0-9]').hasMatch(s)) {
    s = 'p_$s';
    s = s.replaceAll(RegExp(r'_+$'), '');
  }
  if (s.length > 64) s = s.substring(0, 64);
  return s;
}

/// Format [url] for log output: `file:` URLs are shown as paths
/// relative to the cwd (readable), everything else prints as-is.
@visibleForTesting
String describeSpecUrl(Uri url) {
  if (url.isScheme('file')) return p.relative(url.toFilePath());
  return url.toString();
}

/// Builds the [FileRenderer] used to lay out and write files for a
/// given spec. The default is `FileRenderer.new`; consumers with
/// their own layout conventions can pass a builder that returns a
/// subclass (see `tool/gen_shorebird.dart` in this repo for an
/// example).
typedef FileRendererBuilder = FileRenderer Function(FileRendererConfig config);

/// Top-level configuration for a single [loadAndRenderSpec] run.
/// Holds every knob that controls the generation: where to read
/// from, where to write to, which quirks/layout to use, and which
/// template directory to pull mustache files out of.
class GeneratorConfig {
  const GeneratorConfig({
    required this.specUrl,
    required this.packageName,
    required this.outDir,
    required this.templatesDir,
    this.runProcess,
    this.quirks = const Quirks(),
    this.logSchemas = true,
    this.generateTests = true,
    this.fileRendererBuilder = FileRenderer.new,
  });

  /// The location of the OpenAPI spec to read.
  final Uri specUrl;

  /// The Dart package name to write into `pubspec.yaml`.
  final String packageName;

  /// The directory to generate the package into.
  final Directory outDir;

  /// The directory containing the mustache templates to render from.
  /// Typically points at `package:space_gen/templates`; overridden
  /// only by tests and by consumers that ship patched templates.
  final Directory templatesDir;

  /// Process runner for post-generation `dart format`/`dart fix`/
  /// `cspell` invocations. Defaults to running real processes;
  /// tests inject a no-op.
  final RunProcess? runProcess;

  /// Flags that change the shape of the generated code (see
  /// [Quirks]).
  final Quirks quirks;

  /// Whether to log each schema seen during resolution. Useful for
  /// debugging large specs; off by default for CLI usage.
  final bool logSchemas;

  /// Whether to emit round-trip tests next to each generated model.
  /// Default `true`. Individual schemas can still opt out by
  /// overriding [FileRenderer.testPath] to return `null`, or are
  /// skipped automatically when no safe example value can be
  /// constructed (recursive types, no-JSON types).
  final bool generateTests;

  /// Hook for plugging in a custom [FileRenderer] subclass. Defaults
  /// to `FileRenderer.new`.
  final FileRendererBuilder fileRendererBuilder;
}

Future<void> loadAndRenderSpec(GeneratorConfig config) async {
  final fs = config.outDir.fileSystem;
  validatePackageName(config.packageName);

  final templates = TemplateProvider.fromDirectory(config.templatesDir);

  final cache = Cache(fs);
  final specJson = await cache.load(config.specUrl);
  final spec = parseOpenApi(specJson);

  // Build the ref registry from the root spec plus every externally-ref'd
  // document. Has to happen before resolveSpec so refs into other files
  // don't fall off the edge.
  final refRegistry = RefRegistry();
  SpecWalker(
    RegistryBuilder(config.specUrl, refRegistry),
  ).walkRoot(spec);
  await _loadExternalRefs(
    rootSpec: spec,
    rootSpecUrl: config.specUrl,
    cache: cache,
    refRegistry: refRegistry,
  );

  final resolved = resolveSpec(
    spec,
    specUrl: config.specUrl,
    refRegistry: refRegistry,
  );
  final resolver = SpecResolver(config.quirks);
  // Convert the resolved spec into render objects.
  final renderSpec = resolver.toRenderSpec(resolved);
  // SchemaRenderer is responsible for rendering schemas and APIs into strings.
  final schemaRenderer = SchemaRenderer(
    templates: templates,
    quirks: config.quirks,
  );

  logger.info(
    'Generating ${describeSpecUrl(config.specUrl)} to '
    '${p.relative(config.outDir.path)}',
  );

  final formatter = Formatter(runProcess: config.runProcess);
  final spellChecker = SpellChecker(runProcess: config.runProcess);
  final fileWriter = FileWriter(outDir: config.outDir);

  // FileRenderer is responsible for deciding the layout of the files
  // and rendering the rest of directory structure.
  config
      .fileRendererBuilder(
        FileRendererConfig(
          packageName: config.packageName,
          templates: templates,
          schemaRenderer: schemaRenderer,
          formatter: formatter,
          fileWriter: fileWriter,
          spellChecker: spellChecker,
          generateTests: config.generateTests,
        ),
      )
      .render(renderSpec);
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
  return schemaRenderer.renderSchema(renderSchema).body;
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
    globalSecurityRequirements: const [],
    securitySchemes: const [],
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
    return MapEntry(key, schemaRenderer.renderSchema(renderSchema).body);
  });

  return renderSchemas;
}

@visibleForTesting
String renderTestOperation({
  required String path,
  required Map<String, dynamic> operationJson,
  required Uri serverUrl,
  Map<String, dynamic>? componentsJson,
  Quirks quirks = const Quirks(),
  String? removePrefix,
}) {
  final specUrl = Uri.parse('https://example.com/spec');
  final refRegistry = RefRegistry();
  List<SecurityScheme>? securitySchemes;
  if (componentsJson != null) {
    final parsedComponents = parseComponents(
      MapContext.initial(componentsJson),
    );
    final builder = RegistryBuilder(specUrl, refRegistry);
    SpecWalker(builder).walkComponents(parsedComponents);
    securitySchemes = parsedComponents.securitySchemes;
  }
  final resolveContext = ResolveContext.test(
    refRegistry: refRegistry,
    securitySchemes: securitySchemes,
  );
  final parsedOperation = parseOperation(
    MapContext.initial(operationJson),
    path,
  );
  final resolvedOperation = resolveOperation(
    path: path,
    method: Method.post,
    operation: parsedOperation,
    context: resolveContext,
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
  return schemaRenderer.renderApi(api).body;
}
