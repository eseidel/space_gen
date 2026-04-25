import 'dart:io';

import 'package:collection/collection.dart';
import 'package:file/file.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart' as p;
import 'package:space_gen/src/logger.dart';
import 'package:space_gen/src/quirks.dart';
import 'package:space_gen/src/render/render_tree.dart';
import 'package:space_gen/src/render/schema_renderer.dart';
import 'package:space_gen/src/render/templates.dart';
import 'package:space_gen/src/render/tree_visitor.dart';
import 'package:space_gen/src/string.dart';

typedef RunProcess =
    ProcessResult Function(
      String executable,
      List<String> arguments, {
      String? workingDirectory,
    });

class _ModelCollector extends RenderTreeVisitor {
  final Set<RenderSchema> schemas = {};

  @override
  void visitSchema(RenderSchema schema) {
    schemas.add(schema);
  }
}

/// Collects every `additionalImports` entry reachable from one or more
/// schema subtrees. Used by `renderPublicApi` to decide which
/// third-party packages to re-export from the barrel.
class _ImportCollector extends RenderTreeVisitor {
  final imports = <Import>{};

  @override
  void visitSchema(RenderSchema schema) {
    imports.addAll(schema.additionalImports);
  }
}

Set<RenderSchema> collectAllSchemas(RenderSpec spec) {
  final collector = _ModelCollector();
  RenderTreeWalker(visitor: collector).walkRoot(spec);
  return collector.schemas;
}

Set<RenderSchema> collectSchemasUnderApi(Api api) {
  final collector = _ModelCollector();
  RenderTreeWalker(visitor: collector).walkApi(api);
  return collector.schemas;
}

Set<RenderSchema> collectSchemasUnderSchema(RenderSchema schema) {
  final collector = _ModelCollector();
  RenderTreeWalker(visitor: collector).walkSchema(schema);
  return collector.schemas;
}

@visibleForTesting
void logNameCollisions(Iterable<RenderSchema> schemas) {
  // List schemas with name collisions but different pointers.
  final nameCollisions = schemas.groupListsBy((s) => s.snakeName);
  for (final entry in nameCollisions.entries) {
    if (entry.value.length > 1) {
      logger.warn(
        'Schema ${entry.key} has ${entry.value.length} name collisions',
      );
      for (final schema in entry.value) {
        logger.info('${schema.pointer}');
      }
    }
  }
}

/// Block prepended to generated `.dart` files that still contain a
/// line over 80 cols after `dart format` / `dart fix`. The preceding
/// comment satisfies the `document_ignores` lint from
/// `very_good_analysis`. Exposed for tests.
@visibleForTesting
const longLineIgnoreBlock =
    '// Some OpenAPI specs flatten inline schemas into class names long\n'
    "// enough that `dart format` can't keep imports and call sites under\n"
    '// 80 cols as bare identifiers.\n'
    '// ignore_for_file: lines_longer_than_80_chars';

/// Walks [dir] and prepends [longLineIgnoreBlock] to any `.dart` file
/// that still has a line over 80 cols after `dart format`. Some specs
/// flatten deeply-nested inline schemas into class names long enough
/// that common call-site patterns (`.map<Name>(`,
/// `Name.maybeFromJson(`) and import paths overflow as bare
/// identifiers — cases `dart format` provably cannot fix by
/// reflowing. Emitting the directive per-file keeps the lint live
/// everywhere it could still catch a real generator bug, and it
/// self-documents which files have structurally-unavoidable long
/// lines.
@visibleForTesting
void suppressLongLineLintInGeneratedFiles(Directory dir) {
  const marker = '// ignore_for_file: lines_longer_than_80_chars';
  final dartFiles = dir
      .listSync(recursive: true)
      .whereType<File>()
      .where((f) => f.path.endsWith('.dart'));
  for (final file in dartFiles) {
    final content = file.readAsStringSync();
    // Idempotent — a previous run or handwritten override of the
    // directive already covers this file.
    if (content.contains(marker)) continue;
    final hasLongLine = content.split('\n').any((line) => line.length > 80);
    if (!hasLongLine) continue;
    file.writeAsStringSync('$longLineIgnoreBlock\n$content');
  }
}

/// Block prepended to generated `.dart` files whose dartdoc contains
/// `[…]` patterns that don't resolve (e.g. github's code-of-conduct
/// description literally says "contacting the project team at
/// [EMAIL]", and the MIT license template carries `[year] [fullname]`
/// placeholders). Exposed for tests.
@visibleForTesting
const commentReferencesIgnoreBlock =
    "// Spec descriptions copy prose verbatim into dartdoc, where `[x]`\n"
    '// inside a sentence (placeholder text, ALL_CAPS tokens, license\n'
    "// templates) is parsed as a symbol reference even when no such\n"
    '// symbol exists. Suppress file-locally so the lint stays live\n'
    '// elsewhere; spec authors do not always escape brackets.\n'
    '// ignore_for_file: comment_references';

/// Returns [content] with [commentReferencesIgnoreBlock] prepended if
/// any `///` doc comment carries a bracketed token that doesn't look
/// like a `[Foo](url)` markdown link. Used at file-emit time on the
/// two render paths that splice raw spec descriptions into dartdoc
/// (schemas, operations) — hand-written templates skip the call so a
/// spurious `[FormatException]` reference in their docs doesn't get
/// silently suppressed when it should be fixed at the source.
@visibleForTesting
String maybeAddCommentReferencesIgnore(String content) {
  // `///` followed by anything, then a `[word]` bracketed token NOT
  // followed by `(` (which would make it a `[Foo](url)` link). Matches
  // both prose placeholders (`[EMAIL]`, `[year]`) and stray symbol
  // references the spec author meant as plain text.
  final docCommentBracketRe = RegExp(r'///.*\[[^\]\s]+\](?!\()');
  if (!docCommentBracketRe.hasMatch(content)) return content;
  return '$commentReferencesIgnoreBlock\n$content';
}

@visibleForTesting
String applyMandatoryReplacements(
  String template,
  Map<String, String> replacements,
) {
  var output = template;
  for (final replacement in replacements.entries) {
    final before = output;
    output = output.replaceAll(replacement.key, replacement.value);
    // Each replacement must be used, at least once or we fail.
    if (output == before) {
      throw Exception('Replacement ${replacement.key} not found');
    }
  }
  return output;
}

class SpellChecker {
  SpellChecker({RunProcess? runProcess})
    : runProcess = runProcess ?? Process.runSync;

  /// The function to run a process. Allows for mocking in tests.
  final RunProcess runProcess;

  List<String> filesToCheck(Directory dir) {
    final extensions = {'.dart', '.md', '.yaml'};
    return dir
        .listSync(recursive: true)
        .whereType<File>()
        .where((f) => extensions.contains(p.extension(f.path)))
        .map((f) => f.path)
        .toList();
  }

  List<String> collectMisspellings(Directory dir) {
    // cspell seems to add an F/A prefix to the misspellings if we don't
    // pass explicit file paths, unclear why.
    final ProcessResult result;
    try {
      result = runProcess('cspell', [
        '--no-summary',
        '--words-only',
        '--unique',
        '--quiet',
        '--no-color',
        '--no-progress',
        ...filesToCheck(dir),
      ]);
    } on ProcessException {
      // cspell not installed — treat as "no misspellings detected".
      // CI that cares can install it; local runs and pipelines without
      // it shouldn't hard-fail the whole generator.
      logger.detail('cspell not found on PATH; skipping misspelling check');
      return const [];
    }
    // Lowercase, unique and sort the misspellings.
    return (result.stdout as String)
        .trim()
        .split('\n')
        .map((w) => w.toLowerCase())
        .toSet()
        .sorted();
  }
}

class Formatter {
  Formatter({RunProcess? runProcess})
    : runProcess = runProcess ?? Process.runSync;

  /// The function to run a process. Allows for mocking in tests.
  final RunProcess runProcess;

  /// Run a dart command.
  void _runDart(List<String> args, {required String workingDirectory}) {
    final command = 'dart ${args.join(' ')}';
    logger
      ..info('Running $command')
      ..detail('$command in $workingDirectory');
    final stopwatch = Stopwatch()..start();
    final result = runProcess(
      Platform.executable,
      args,
      workingDirectory: workingDirectory,
    );
    if (result.exitCode != 0) {
      logger.info(result.stderr as String);
      throw Exception('Failed to run dart ${args.join(' ')}');
    }
    final ms = stopwatch.elapsed.inMilliseconds;
    logger
      ..detail(result.stdout as String)
      ..info('$command took $ms ms');
  }

  void formatAndFix({required String pkgDir}) {
    // `pub get` (not `--offline`) so generation doesn't silently depend on
    // whatever happens to be in the machine-global pub cache. On a warm
    // cache the network round-trip is marginal; on a cold one (e.g. CI),
    // `--offline` fails with a confusing "package X not in cache" error
    // whenever a template dep isn't coincidentally also a space_gen dep.
    _runDart(['pub', 'get'], workingDirectory: pkgDir);
    // Run format first to add missing commas.
    _runDart(['format', '.'], workingDirectory: pkgDir);
    // Then run fix to clean up various other things.
    _runDart(['fix', '.', '--apply'], workingDirectory: pkgDir);
    // Run format again to fix wrapping of lines.
    _runDart(['format', '.'], workingDirectory: pkgDir);
  }
}

class FileWriter {
  FileWriter({required this.outDir}) : fs = outDir.fileSystem;

  /// The output directory.
  final Directory outDir;

  /// The file system where the rendered files will go.
  final FileSystem fs;

  final Set<String> _writtenFiles = {};

  /// Ensure a file exists.
  File _ensureFile(String path) {
    final file = fs.file(p.join(outDir.path, path));
    file.parent.createSync(recursive: true);
    return file;
  }

  /// Write a file.
  void writeFile({required String path, required String content}) {
    if (_writtenFiles.contains(path)) {
      throw Exception('File $path already written');
    }
    _writtenFiles.add(path);
    _ensureFile(path).writeAsStringSync(content);
  }

  /// Create a directory.
  void createOutDir() {
    fs.directory(outDir.path).createSync(recursive: true);
  }
}

/// Bundles the collaborators a [FileRenderer] needs. Held as a single
/// value so subclasses can forward it via `super(config)` without
/// tracking constructor-parameter drift as the renderer grows. All
/// fields are considered implementation detail — public to make the
/// config shape legible, not to invite direct construction.
class FileRendererConfig {
  FileRendererConfig({
    required this.packageName,
    required this.templates,
    required this.schemaRenderer,
    required this.formatter,
    required this.fileWriter,
    required this.spellChecker,
    this.generateTests = true,
  });

  final String packageName;
  final TemplateProvider templates;
  final SchemaRenderer schemaRenderer;
  final Formatter formatter;
  final FileWriter fileWriter;
  final SpellChecker spellChecker;

  /// Whether to emit round-trip tests for each generated model.
  final bool generateTests;
}

/// The information a layout hook (e.g. [FileRenderer.modelPath]) is
/// given when deciding where a particular schema's file lands.
///
/// The [schema] is the one currently being placed;
/// [operationSnakeNames] is the set of operation names snake-cased
/// to match `RenderSchema.snakeName`, so a subclass can compare the
/// two without doing its own casing dance (e.g. to detect whether a
/// message DTO is owned by a single endpoint).
class LayoutContext {
  const LayoutContext({
    required this.schema,
    required this.operationSnakeNames,
  });

  /// The schema whose output path is being decided.
  final RenderSchema schema;

  /// Snake-cased operation names, in the same casing as
  /// `RenderSchema.snakeName` so direct comparisons work.
  final Set<String> operationSnakeNames;
}

/// Responsible for determining the layout of the files and rendering the
/// directory structure of the rendered spec.
///
/// Subclass and override the `@protected` hooks to plug custom layouts
/// and file-set choices into `loadAndRenderSpec` without forking the
/// generator. Two flavors:
///
///   - Layout hooks ([modelPath], [testPath], [testBarrelImport]) decide
///     where each generated file lands.
///   - Per-file emit hooks ([renderPubspec], [renderAnalysisOptions],
///     [renderGitignore], [renderApiException], [renderAuth],
///     [renderApiClient], [renderModelHelpers], [renderApis],
///     [renderClient], [renderPublicApi], [renderCspellConfig]) each
///     produce a single output file. A subclass that doesn't want a
///     given file overrides its hook to a no-op. This is how a
///     generator-consumer package (e.g. one with a hand-maintained
///     `pubspec.yaml` or its own HTTP client) keeps the parts it owns
///     without giving up regeneration of models/messages/tests.
class FileRenderer {
  FileRenderer(this.config);

  /// The collaborators this renderer was constructed with. Subclasses
  /// rarely need to touch this directly — prefer the narrower getters
  /// below and the `@protected` hook methods.
  @protected
  final FileRendererConfig config;

  String get packageName => config.packageName;
  FileWriter get fileWriter => config.fileWriter;
  TemplateProvider get templates => config.templates;
  Formatter get formatter => config.formatter;
  SpellChecker get spellChecker => config.spellChecker;
  SchemaRenderer get schemaRenderer => config.schemaRenderer;

  /// The quirks to use for rendering.
  Quirks get quirks => schemaRenderer.quirks;

  /// Snake-cased operation names, captured from the spec at the top
  /// of [render]. Threaded into every [LayoutContext] handed to
  /// [modelPath].
  Set<String> _operationSnakeNames = const {};

  /// The path to the api file.
  static String apiFilePath(Api api) {
    // openapi generator does not use /src/ in the path.
    return 'lib/api/${api.fileName}.dart';
  }

  static String apiPackagePath(Api api) {
    return 'api/${api.fileName}.dart';
  }

  /// The path a schema renders to, relative to the package's `lib/`
  /// directory, e.g. `models/widget.dart`. Dart packages only expose
  /// files under `lib/`, so the `lib/` prefix is added by the caller
  /// and doesn't appear in the hook contract.
  ///
  /// Default: classes whose Dart name ends in `Request` or `Response`
  /// are treated as message DTOs and land under `messages/`;
  /// everything else is a domain model and lands under `models/`.
  /// With [Quirks.flatModelDir] on (implied by `Quirks.openapi()`),
  /// everything lands in a single flat `model/` directory to match
  /// the layout OpenAPI Generator produces.
  ///
  /// Override point for custom layouts — see `tool/gen_shorebird.dart`
  /// in this repo for an example that nests operation-owned messages
  /// under a per-operation directory.
  @protected
  @visibleForOverriding
  String modelPath(LayoutContext context) {
    final snakeName = context.schema.snakeName;
    if (quirks.flatModelDir) return 'model/$snakeName.dart';
    final className = context.schema.typeName;
    final isMessage =
        className.endsWith('Request') || className.endsWith('Response');
    final subdir = isMessage ? 'messages' : 'models';
    return '$subdir/$snakeName.dart';
  }

  /// Path for a schema's generated round-trip test, relative to the
  /// package root (so the returned value includes the leading `test/`).
  /// Return `null` to skip emitting a test for this schema.
  ///
  /// Default: mirrors [modelPath] under `test/`, with `_test` before the
  /// `.dart` extension — so a schema at `lib/models/app.dart` gets a
  /// test at `test/models/app_test.dart`.
  ///
  /// Override this hook to redirect generated tests (e.g. to
  /// `test/generated/` so they sit alongside hand-written tests without
  /// colliding), or return null to opt out entirely.
  @protected
  @visibleForOverriding
  String? testPath(LayoutContext context) {
    final libRelative = modelPath(context);
    final withSuffix = libRelative.replaceFirst(
      RegExp(r'\.dart$'),
      '_test.dart',
    );
    return 'test/$withSuffix';
  }

  /// `lib/`-relative path to the package-level barrel that a generated
  /// test should import. The test imports a single barrel (rather than
  /// each nested model) so that any type referenced in an
  /// example-value expression resolves without extra import wiring.
  ///
  /// Default: `api.dart`, which is the barrel space_gen emits by
  /// default. Consumers that keep their own hand-written barrel (e.g.
  /// Shorebird's `shorebird_code_push_protocol.dart`) should override
  /// to point at that.
  @protected
  @visibleForOverriding
  String testBarrelImport() => 'api.dart';

  LayoutContext _contextFor(RenderSchema schema) => LayoutContext(
    schema: schema,
    operationSnakeNames: _operationSnakeNames,
  );

  /// The schema's path on disk, relative to the package root.
  String modelFilePath(RenderSchema schema) =>
      'lib/${modelPath(_contextFor(schema))}';

  /// The schema's path relative to the package's `lib/` directory.
  String modelPackagePath(RenderSchema schema) =>
      modelPath(_contextFor(schema));

  /// The `package:…` import that resolves to this schema's file.
  String modelPackageImport(FileRenderer context, RenderSchema schema) =>
      'package:${context.packageName}/${context.modelPackagePath(schema)}';

  /// Render a template. [transform] runs on the rendered content
  /// before it lands on disk — used by the schema/operation paths to
  /// add `// ignore_for_file: comment_references` when the spec's
  /// description text would trip the lint.
  void _renderTemplate({
    required String template,
    required String outPath,
    Map<String, dynamic> context = const {},
    String Function(String content)? transform,
  }) {
    final output = templates.loadTemplate(template).renderString(context);
    final finalContent = transform == null ? output : transform(output);
    fileWriter.writeFile(path: outPath, content: finalContent);
  }

  /// Set up the package directory (creates [fileWriter]'s outDir and
  /// emits package scaffolding). Default impl calls the three file-level
  /// hooks below; subclasses generally override those individually
  /// rather than this composite.
  @protected
  void renderPackageScaffold() {
    fileWriter.createOutDir();
    renderPubspec();
    renderAnalysisOptions();
    renderGitignore();
  }

  /// Emit `pubspec.yaml`. Override with a no-op if the package already
  /// has a hand-maintained pubspec.
  @protected
  void renderPubspec() {
    _renderTemplate(
      template: 'pubspec',
      outPath: 'pubspec.yaml',
      context: {'packageName': packageName},
    );
  }

  /// Emit `analysis_options.yaml`. Override to no-op to keep a
  /// hand-maintained lint config.
  @protected
  void renderAnalysisOptions() {
    _renderTemplate(
      template: 'analysis_options',
      outPath: 'analysis_options.yaml',
      context: {
        'mutableModels': quirks.mutableModels,
        'screamingCapsEnums': quirks.screamingCapsEnums,
      },
    );
  }

  /// Emit `.gitignore`. Override to no-op if the package has a
  /// hand-maintained one.
  @protected
  void renderGitignore() {
    _renderTemplate(template: 'gitignore', outPath: '.gitignore');
  }

  void _renderDartFile({
    required String name,
    required String outPath,
    Map<String, String> replacements = const {},
  }) {
    final output = templates.loadDartTemplate(name);
    final content = applyMandatoryReplacements(output, replacements);
    fileWriter.writeFile(path: outPath, content: content);
  }

  /// Emit `lib/api_exception.dart`. Override to no-op if the package
  /// supplies its own exception type.
  @protected
  void renderApiException() {
    _renderDartFile(name: 'api_exception', outPath: 'lib/api_exception.dart');
  }

  /// Emit `lib/auth.dart`. Override to no-op if the package supplies
  /// its own auth helpers.
  @protected
  void renderAuth() {
    _renderDartFile(name: 'auth', outPath: 'lib/auth.dart');
  }

  /// Emit `lib/api_client.dart`. Override to no-op if the package
  /// supplies its own HTTP client.
  @protected
  void renderApiClient(RenderSpec spec) {
    _renderDartFile(
      name: 'api_client',
      outPath: 'lib/api_client.dart',
      replacements: {
        'package:space_gen/templates': 'package:$packageName',
        'TEMPLATE_BASE_URI': spec.serverUrl.toString(),
      },
    );
  }

  /// The aggregate set of `model_helpers.dart` identifiers referenced by
  /// every generated file emitted so far. Populated as a side effect of
  /// [renderModels] and [renderApis]; consumed by [renderModelHelpers]
  /// to prune helpers that nothing imports.
  ///
  /// A subclass that replaces those emit hooks without calling `super`
  /// and that still writes files referencing model helpers is
  /// responsible for adding those names here. The default flow does
  /// this automatically.
  @protected
  final Set<String> usedModelHelpers = {};

  /// Emit `lib/model_helpers.dart` containing only the helpers that any
  /// other generated file actually references (per [usedModelHelpers]).
  /// Called after [renderModels] and [renderApis] so the aggregate is
  /// complete.
  @protected
  void renderModelHelpers() {
    if (usedModelHelpers.isEmpty) return;
    _renderTemplate(
      template: 'model_helpers',
      outPath: 'lib/model_helpers.dart',
      context: {
        for (final h in ModelHelpers.all) h: usedModelHelpers.contains(h),
        'needsCollectionImport': const {
          ModelHelpers.listsEqual,
          ModelHelpers.mapsEqual,
          ModelHelpers.listHash,
          ModelHelpers.mapHash,
        }.any(usedModelHelpers.contains),
        'needsUriPackageImport': usedModelHelpers.contains(
          ModelHelpers.maybeParseUriTemplate,
        ),
      },
    );
  }

  /// Emit `lib/api.dart`, the barrel file re-exporting every generated
  /// model and api. Override to no-op if the package exposes its own
  /// hand-maintained barrel.
  @protected
  void renderPublicApi(Iterable<Api> apis, Iterable<RenderSchema> schemas) {
    final paths = {
      ...apis.map(apiPackagePath),
      ...schemas.map(modelPackagePath),
      'api_client.dart',
      'api_exception.dart',
    };
    // Collect third-party `package:` types that any model uses
    // (today: `package:uri/uri.dart` for `UriTemplate`). Dart exports
    // don't chain through imports — the model file imports them, but
    // consumers of the barrel (including the generated round-trip
    // tests) need them in scope to construct those models. Re-export
    // from the barrel, narrowed to `show <exact types>` so we only
    // surface the specific names used by public field signatures —
    // not every symbol the third-party package happens to define.
    final thirdPartyExports = collectThirdPartyExports(schemas);
    final exportContexts = [
      for (final path in (paths.toList()..sort()))
        {
          'path': 'package:$packageName/$path',
          'hasShow': false,
          'shownTypes': '',
        },
      for (final e in thirdPartyExports)
        {
          'path': e.path,
          'hasShow': e.shown.isNotEmpty,
          'shownTypes': (e.shown.toList()..sort()).join(', '),
        },
    ];
    _renderTemplate(
      template: 'public_api',
      outPath: 'lib/api.dart',
      context: {'imports': <String>[], 'exports': exportContexts},
    );
  }

  /// Imports (third-party, non-prefixed) that the public API surface
  /// references, grouped by package path. Each returned `Import` has a
  /// non-empty `shown` list (the union of shown types across all
  /// schema-level usages of that package).
  ///
  /// Only imports with an explicit `shown:` list are candidates — an
  /// unconstrained `Import('package:x/x.dart')` means "the schema
  /// needs the package internally" (e.g. `package:meta/meta.dart`
  /// for `@immutable`), not "expose every symbol in it to consumers
  /// of the barrel."
  @visibleForTesting
  List<Import> collectThirdPartyExports(Iterable<RenderSchema> schemas) {
    final collector = _ImportCollector();
    for (final schema in schemas) {
      RenderTreeWalker(visitor: collector).walkSchema(schema);
    }
    final byPath = <String, Set<String>>{};
    for (final i in collector.imports) {
      if (!i.path.startsWith('package:')) continue;
      if (i.path.startsWith('package:$packageName/')) continue;
      if (i.asName != null) continue;
      if (i.shown.isEmpty) continue;
      byPath.putIfAbsent(i.path, () => <String>{}).addAll(i.shown);
    }
    return [
      for (final entry in byPath.entries)
        Import(entry.key, shown: entry.value.toList()),
    ]..sort((a, b) => a.path.compareTo(b.path));
  }

  /// Emit `cspell.config.yaml`. Override to no-op if the package has a
  /// hand-maintained cspell config.
  @protected
  void renderCspellConfig(List<String> misspellings) {
    _renderTemplate(
      template: 'cspell.config',
      outPath: 'cspell.config.yaml',
      context: {
        'hasMisspellings': misspellings.isNotEmpty,
        'misspellings': misspellings,
      },
    );
  }

  bool rendersToSeparateFile(RenderSchema schema) =>
      schema.createsNewType && schema is! RenderRecursiveRef;

  @visibleForTesting
  Iterable<Import> importsForApi(Api api, ApiUsage usage) {
    // TODO(eseidel): Make type imports dynamic based on used schemas.
    final imports = {
      const Import('dart:async'),
      const Import('dart:convert'), // jsonDecode, for decoding response body.
      const Import('dart:io'), // HttpStatus, emitted by api.mustache.
      Import('package:$packageName/api_client.dart'),
      Import('package:$packageName/api_exception.dart'),
      const Import('package:http/http.dart', asName: 'http'),
      ...usage.importsFor(packageName),
    };

    final apiSchemas = collectSchemasUnderApi(api);
    final inlineSchemas = apiSchemas.where((s) => !s.createsNewType);
    // Every newtype (including RenderRecursiveRef, which points at one)
    // lives in its own file and needs an import at the use site.
    final importedSchemas = apiSchemas.where((s) => s.createsNewType);
    final apiImports = importedSchemas
        .map((s) => Import(modelPackageImport(this, s)))
        .toList();
    imports.addAll({
      ...inlineSchemas.expand((s) => s.additionalImports),
      ...apiImports,
    });
    return imports;
  }

  /// Emit one `lib/api/<tag>_api.dart` per [Api]. Returns the list of
  /// APIs that were actually rendered (currently the same list passed
  /// in). Override to no-op (returning `const []`) if the package
  /// doesn't want the generated HTTP-client layer.
  @protected
  List<Api> renderApis(List<Api> apis) {
    final rendered = <Api>[];
    for (final api in apis) {
      final renderedApi = schemaRenderer.renderApi(api);
      usedModelHelpers.addAll(renderedApi.usage.modelHelpers);
      final imports = importsForApi(api, renderedApi.usage);
      final importsContext = imports
          .sortedBy((i) => i.path)
          .map((i) => i.toTemplateContext())
          .toList();
      final outPath = apiFilePath(api);
      _renderTemplate(
        template: 'add_imports',
        outPath: outPath,
        context: {'imports': importsContext, 'content': renderedApi.body},
        transform: maybeAddCommentReferencesIgnore,
      );
      rendered.add(api);
    }
    return rendered;
  }

  /// Emit `lib/client.dart`, the facade class holding one instance of
  /// each generated API. Override to no-op if the package doesn't want
  /// it.
  @protected
  void renderClient(List<Api> apis, {required String specName}) {
    final apiContexts = apis.map((a) {
      return {'apiClassName': a.className, 'apiName': a.clientVariableName};
    }).toList();
    _renderTemplate(
      template: 'client',
      outPath: 'lib/client.dart',
      context: {
        'apis': apiContexts,
        'packageName': packageName,
        'clientClassName': toUpperCamelCase(specName),
      },
    );
  }

  @visibleForTesting
  Iterable<Import> importsForModel(RenderSchema schema, SchemaUsage usage) {
    final referencedSchemas = collectSchemasUnderSchema(schema);
    final localSchemas = referencedSchemas.where(
      (s) => !s.createsNewType,
    );
    // Every newtype (including RenderRecursiveRef) imports the target's file.
    final importedSchemas = referencedSchemas
        .where((s) => s.createsNewType)
        .toSet();
    final referencedImports = importedSchemas
        .map((s) => Import(modelPackageImport(this, s)))
        .toList();

    final imports = {
      ...usage.importsFor(packageName),
      ...schema.additionalImports,
      ...localSchemas.expand((s) => s.additionalImports),
      ...referencedImports,
    };
    // A file never imports itself.
    final selfPath = modelPackageImport(this, schema);
    imports.removeWhere((i) => i.path == selfPath);
    return imports;
  }

  void renderModels(Iterable<RenderSchema> schemas) {
    for (final schema in schemas) {
      final rendered = schemaRenderer.renderSchema(schema);
      usedModelHelpers.addAll(rendered.usage.modelHelpers);
      final imports = importsForModel(schema, rendered.usage);
      final importsContext = imports
          .sortedBy((i) => i.path)
          .map((i) => i.toTemplateContext())
          .toList();

      final outPath = modelFilePath(schema);
      _renderTemplate(
        template: 'add_imports',
        outPath: outPath,
        context: {'imports': importsContext, 'content': rendered.body},
        transform: maybeAddCommentReferencesIgnore,
      );
    }
  }

  /// Render a round-trip test for each schema that has a testable
  /// example value. Skips schemas for which [testPath] returns null,
  /// or for which [RenderSchema.exampleValue] returns null (recursive
  /// types, no-JSON types).
  void renderModelTests(Iterable<RenderSchema> schemas) {
    final schemaContext = schemaRenderer;
    for (final schema in schemas) {
      if (!schema.createsNewType) continue;
      final layoutContext = _contextFor(schema);
      final outPath = testPath(layoutContext);
      if (outPath == null) continue;
      final example = schema.exampleValue(schemaContext);
      if (example == null) continue;
      final invalidJson = schema.invalidJsonExample(schemaContext);
      _renderTemplate(
        template: 'schema_round_trip_test',
        outPath: outPath,
        context: {
          'packageName': packageName,
          'barrelImportPath': testBarrelImport(),
          'typeName': schema.typeName,
          'exampleValue': example,
          'invalidJsonExample': invalidJson,
          'isEnum': schema is RenderEnum,
        },
      );
    }
  }

  /// Render the entire spec.
  void render(RenderSpec spec, {bool clearDirectory = true}) {
    if (clearDirectory) {
      // Only delete the directories we make to handle the case of changing
      // directory structure or adding/removing files.
      // All other files we make can be overwritten.
      final dirs = {
        p.join('lib', 'api'),
        // Previous output layouts we might inherit from — clear so stale
        // files from an earlier layout don't linger.
        p.join('lib', 'model'),
        // Current layout.
        p.join('lib', 'models'),
        p.join('lib', 'messages'),
      };
      for (final dirName in dirs) {
        final path = p.join(fileWriter.outDir.path, dirName);
        final dir = fileWriter.fs.directory(path);
        if (dir.existsSync()) {
          dir.deleteSync(recursive: true);
        }
      }
    }
    // Collect all the Apis and Model Schemas.
    // Do we walk through each endpoint and ask which class to put it on?
    // Do we then walk through each class and ask what file to put it in?
    // Then we walk through all model objects and ask what file to put them in?
    // And then for each rendered we collect any imports, by asking for the
    // file path for each referenced schema?
    // Set up the package directory.
    renderPackageScaffold();
    // Capture the spec's operation names up front so every
    // [LayoutContext] handed to [modelPath] sees the same set.
    _operationSnakeNames = {
      for (final api in spec.apis)
        for (final endpoint in api.endpoints) endpoint.snakeName,
    };
    // Render the apis (endpoint groups).
    final renderedApis = renderApis(spec.apis);

    final schemas = collectAllSchemas(spec).where(rendersToSeparateFile);
    logNameCollisions(schemas);

    // Render the models (schemas).
    renderModels(schemas);
    if (config.generateTests) {
      renderModelTests(schemas);
    }
    // Render the api client scaffolding.
    renderApiException();
    renderAuth();
    renderApiClient(spec);
    renderModelHelpers();
    // This is a bit of hack, but seems to work with the specs I've tested.
    // Probably ClientName should be a parameter to the render function.
    final specName = spec.title.split(' ').firstOrNull ?? '';
    renderClient(renderedApis, specName: specName);
    // Render the combined api.dart exporting all rendered schemas.
    renderPublicApi(spec.apis, schemas);
    formatter.formatAndFix(pkgDir: fileWriter.outDir.path);
    suppressLongLineLintInGeneratedFiles(fileWriter.outDir);

    final misspellings = spellChecker.collectMisspellings(fileWriter.outDir);
    renderCspellConfig(misspellings);
  }
}
