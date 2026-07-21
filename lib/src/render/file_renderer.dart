import 'dart:io';

import 'package:collection/collection.dart';
import 'package:file/file.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart' as p;
import 'package:space_gen/src/logger.dart';
import 'package:space_gen/src/quirks.dart';
import 'package:space_gen/src/render/dart_expression.dart';
import 'package:space_gen/src/render/formatting.dart';
import 'package:space_gen/src/render/render_tree.dart';
import 'package:space_gen/src/render/schema_renderer.dart';
import 'package:space_gen/src/render/templates.dart';
import 'package:space_gen/src/render/tree_visitor.dart';
import 'package:space_gen/src/string.dart';
import 'package:space_gen/src/types.dart';

export 'package:space_gen/src/render/formatting.dart'
    show Formatter, RunProcess;

class _ModelCollector extends RenderTreeVisitor {
  // Keyed by pointer (a schema's identity, per RenderSchema's doc): the
  // walk reaches one definition through many paths, and per `$ref` site as
  // a distinct instance, so without deduping the same
  // `lib/models/<name>.dart` would be written more than once.
  final Map<JsonPointer, RenderSchema> _byPointer = {};

  List<RenderSchema> get schemas => _byPointer.values.toList();

  @override
  void visitSchema(RenderSchema schema) {
    _byPointer.putIfAbsent(schema.pointer, () => schema);
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

/// An `import '<path>';` directive, capturing the path.
final _importDirectivePattern = RegExp("^import '([^']+)'");

/// [directives] in the order `directives_ordering` wants: `dart:` first,
/// then everything else, each section alphabetical by path. Returns the
/// ordered list and the index where the second section starts, which is
/// also where the conventional blank line goes (0 when there is only one
/// section).
///
/// The rule lives here rather than at each call site because the two
/// sites express the separator differently — `renderPublicApi` sets a
/// `separatorBefore` flag its mustache template reads, while
/// [sortDartImports] writes a real blank line into `.dart` output — and
/// duplicating the ordering to accommodate that is how the two drift.
/// If they drift, the symptom is `directives_ordering`, the very lint
/// this ordering exists to satisfy.
({List<T> ordered, int sectionBreak}) orderDirectives<T>(
  Iterable<T> directives,
  String Function(T) pathOf,
) {
  bool isDart(T d) => pathOf(d).startsWith('dart:');
  final dartOnes = directives.where(isDart).sortedBy(pathOf);
  final others = directives.whereNot(isDart).sortedBy(pathOf);
  return (
    ordered: [...dartOnes, ...others],
    sectionBreak: dartOnes.isEmpty || others.isEmpty ? 0 : dartOnes.length,
  );
}

/// [source] with its leading `import` directives sorted the way
/// `directives_ordering` wants them: `dart:` first, then everything
/// else, each section alphabetical by path, one blank line between.
///
/// The `.dart` file templates are real Dart — they analyze and format
/// in this repo — so their imports are written in a fixed order. That
/// order cannot be right for every consumer, because a same-package
/// import's position depends on the package name:
/// `package:aaa_petstore/auth.dart` sorts before `package:http/http.dart`
/// and `package:zzz_petstore/auth.dart` after. `api_client.dart` mixes
/// the two and so tripped `directives_ordering` on any package naming
/// itself before `http` (#282). `dart fix` was reordering it, which is
/// why it stayed invisible.
///
/// Applied to every `.dart` template rather than just that one, so a
/// template that later grows a same-package import cannot reintroduce
/// the bug.
///
/// Only the contiguous run of directives at the top is touched, and
/// only when it holds nothing but imports and blank lines; anything
/// else (a leading comment inside the run, an `export`) leaves the
/// source alone. Sorting what we do not fully understand risks
/// reordering across a directive whose position is load-bearing.
@visibleForTesting
String sortDartImports(String source) {
  final lines = source.split('\n');
  final first = lines.indexWhere(_importDirectivePattern.hasMatch);
  if (first == -1) return source;
  var last = first;
  for (var i = first; i < lines.length; i++) {
    if (_importDirectivePattern.hasMatch(lines[i])) {
      last = i;
    } else if (lines[i].trim().isNotEmpty) {
      break;
    }
  }
  final span = lines.sublist(first, last + 1);
  if (span.any(
    (l) => l.trim().isNotEmpty && !_importDirectivePattern.hasMatch(l),
  )) {
    return source;
  }

  final (:ordered, :sectionBreak) = orderDirectives(
    span.where((l) => l.trim().isNotEmpty),
    (line) => _importDirectivePattern.firstMatch(line)!.group(1)!,
  );
  final sorted = [
    ...ordered.take(sectionBreak),
    if (sectionBreak > 0) '',
    ...ordered.skip(sectionBreak),
  ];
  return [
    ...lines.sublist(0, first),
    ...sorted,
    ...lines.sublist(last + 1),
  ].join('\n');
}

List<RenderSchema> collectAllSchemas(RenderSpec spec) {
  final collector = _ModelCollector();
  RenderTreeWalker(visitor: collector).walkRoot(spec);
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
  /// Default: mirrors [modelPath] under `test/gen/`, with `_test`
  /// before the `.dart` extension — so a schema at `lib/models/app.dart`
  /// gets a test at `test/gen/models/app_test.dart`.
  ///
  /// The `gen/` level is the point. Generated tests are cleared on
  /// regeneration ([generatedDirs]), and `test/` is the one tree Dart
  /// convention shares with the consumer: all of a package's tests live
  /// there, and mirroring `lib/` is the idiomatic way to arrange them,
  /// so writing straight to `test/models/` would claim a directory the
  /// consumer has every reason to be using. `lib/` needs no equivalent
  /// — a generated client's `lib/` is ours — and prefixing it would put
  /// `gen/` in every import path.
  ///
  /// `dart test` recurses all of `test/`, so the extra level costs
  /// nothing at run time.
  ///
  /// Override to redirect generated tests, or return null to opt out
  /// entirely. An override needs a matching [generatedDirs] entry, or
  /// its output is never cleaned up.
  @protected
  @visibleForOverriding
  String? testPath(LayoutContext context) {
    final libRelative = modelPath(context);
    final withSuffix = libRelative.replaceFirst(
      RegExp(r'\.dart$'),
      '_test.dart',
    );
    return p.join('test', 'gen', withSuffix);
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

  /// The imports every generated round-trip test needs, sorted by path.
  ///
  /// Which of the two comes first depends on the package name —
  /// `package:spacetraders/...` sorts before `package:test/test.dart`,
  /// `package:train_travel/...` after — so the templates cannot hard-code
  /// the order without tripping `directives_ordering` on one spec or the
  /// other. Sorted here for the same reason [renderModels] sorts its own.
  List<Map<String, dynamic>> testImportsContext() => [
    Import.path('package:$packageName/${testBarrelImport()}'),
    const Import(Libraries.test),
  ].sortedBy((i) => i.path).map((i) => i.toTemplateContext()).toList();

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

  /// Lazily-constructed in-process Dart formatter, configured from
  /// the consuming package's `pubspec` + `analysis_options.yaml`.
  /// Reused across every `.dart` write.
  late final _dartFormatter = DartFileFormatter(
    fs: fileWriter.fs,
    outDir: fileWriter.outDir,
  );

  /// Render a hand-written template — pubspec, analysis_options,
  /// `auth.dart`, the `client.dart` facade, etc. The output is the
  /// template verbatim with no spec-derived class names spliced in,
  /// so the gen-time lint suppressions don't apply. `.dart` outputs
  /// are formatted in-process so the file lands on disk in canonical
  /// shape; the global `dart format` step becomes a near no-op for
  /// files we wrote (planned removal once every emit path is on this
  /// contract). See [_renderSpecTemplate] for the path that emits
  /// spec-derived content.
  void _renderTemplate({
    required String template,
    required String outPath,
    Map<String, dynamic> context = const {},
  }) {
    final output = templates.loadTemplate(template).renderString(context);
    fileWriter.writeFile(
      path: outPath,
      content: _dartFormatter.formatIfDart(outPath, output),
    );
  }

  /// Render a template that emits content shaped by the spec — model
  /// files, api files, generated round-trip tests. The output is
  /// formatted in-process (so the long-line check sees the same lines
  /// the analyzer will), then run through [maybeAddIgnoreDirectives]
  /// to add any necessary `// ignore_for_file:` block. Adding a new
  /// gen-time suppression is one edit inside
  /// [maybeAddIgnoreDirectives]; call sites stay unchanged.
  void _renderSpecTemplate({
    required String template,
    required String outPath,
    Map<String, dynamic> context = const {},
  }) {
    final output = templates.loadTemplate(template).renderString(context);
    final formatted = _dartFormatter.formatIfDart(outPath, output);
    fileWriter.writeFile(
      path: outPath,
      content: maybeAddIgnoreDirectives(formatted),
    );
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
    // After replacement, not before: the same-package imports only get
    // their real paths here, and where those sort among the third-party
    // ones depends on the package name.
    fileWriter.writeFile(path: outPath, content: sortDartImports(content));
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

  /// Emit `lib/date.dart` (the shared `Date` value class) iff any generated
  /// file references it. Called after [renderModels] / [renderApis] so
  /// [usedDate] is complete, mirroring [renderModelHelpers].
  @protected
  void renderDate() {
    // `lib/` is shared with the consumer, so nothing sweeps it — this
    // hook owns the file and removes it when a spec stops using dates.
    // Doing it here rather than from a list of files we own keeps it
    // safe for a subclass that no-ops this hook: our delete never runs,
    // so we never remove a file we did not produce.
    if (!usedDate) {
      final stale = fileWriter.fs.file(
        p.join(fileWriter.outDir.path, 'lib', 'date.dart'),
      );
      if (stale.existsSync()) stale.deleteSync();
      return;
    }
    _renderDartFile(name: 'date', outPath: 'lib/date.dart');
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

  /// Whether any generated file references the shared `Date` type (from a
  /// `format: date` field). Set as a side effect of [importsForModel] /
  /// [importsForApi]; consumed by [renderDate] (emit `lib/date.dart`) and
  /// [renderPublicApi] (re-export it from the barrel).
  @protected
  bool usedDate = false;

  /// The `lib/date.dart` import for [schemas] iff any of them is a [RenderDate]
  /// (a `format: date` field). Marks [usedDate] so the support file and its
  /// barrel export are emitted.
  Iterable<Import> _dateImportFor(
    Iterable<RenderSchema> schemas, {
    required bool bodyNamesDate,
  }) {
    if (!schemas.any((s) => s is RenderDate)) return const [];
    // A `RenderDate` anywhere in the tree means `lib/date.dart` gets
    // emitted; that's independent of whether this particular file uses
    // it. The import is only added when the body actually names `Date`.
    usedDate = true;
    return bodyNamesDate
        ? [Import.path('package:$packageName/date.dart')]
        : const [];
  }

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
        'needsBase64Imports': const {
          ModelHelpers.maybeBase64Encode,
          ModelHelpers.maybeBase64Decode,
        }.any(usedModelHelpers.contains),
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
      // Re-export the shared `Date` type so barrel consumers (including the
      // generated round-trip tests) can name it. Emitted only when used.
      if (usedDate) 'date.dart',
    };
    // Collect third-party `package:` types that any model uses
    // (today: `package:uri/uri.dart` for `UriTemplate`). Dart exports
    // don't chain through imports — the model file imports them, but
    // consumers of the barrel (including the generated round-trip
    // tests) need them in scope to construct those models. Re-export
    // from the barrel, narrowed to `show <exact types>` so we only
    // surface the specific names used by public field signatures —
    // not every symbol the third-party package happens to define.
    final externalExports = collectExternalBarrelExports(schemas);
    // Ordered in one place rather than local-then-external, because
    // `directives_ordering` wants `dart:` directives before `package:`
    // ones and each section alphabetized — and an external
    // `package:uri/uri.dart` sorts *among* the local exports, not after
    // them. Which side it lands on depends on the package name, so
    // appending only happened to look right for the names we generate.
    final allExports = <Import>[
      for (final path in paths) Import.path('package:$packageName/$path'),
      ...externalExports,
    ];
    final (:ordered, :sectionBreak) = orderDirectives(
      allExports,
      (e) => e.path,
    );
    final exportContexts = [
      for (final (index, e) in ordered.indexed)
        {
          'path': e.path,
          'hasShow': e.shown.isNotEmpty,
          'shownTypes': (e.shown.toList()..sort()).join(', '),
          // Blank line between the `dart:` and `package:` sections, the
          // conventional Dart grouping (and what `dart fix` inserts when
          // it reorders these itself).
          'separatorBefore': sectionBreak > 0 && index == sectionBreak,
        },
    ];
    _renderTemplate(
      template: 'public_api',
      outPath: 'lib/api.dart',
      context: {'imports': <String>[], 'exports': exportContexts},
    );
  }

  /// Non-local imports (not from the generated package itself) that
  /// the public API surface references and need re-exporting from
  /// `lib/api.dart`, grouped by URI. Each returned `Import` has a
  /// non-empty `shown` list (the union of shown types across all
  /// schema-level usages of that import).
  ///
  /// Includes both `package:` imports (e.g. `package:uri/uri.dart`
  /// for `UriTemplate`) and `dart:` SDK imports that expose a public
  /// type in field signatures (`dart:typed_data` for `Uint8List`
  /// from `contentEncoding: base64` fields). Dart's `export`
  /// directive doesn't chain through `import`, so consumers of the
  /// barrel — including the generated round-trip tests — need these
  /// names re-exposed explicitly.
  ///
  /// Only imports with an explicit `shown:` list are candidates — an
  /// unconstrained `Import.path('package:x/x.dart')` means "the schema
  /// needs the package internally" (e.g. `package:meta/meta.dart`
  /// for `@immutable` or `dart:convert` for the `base64` codec), not
  /// "expose every symbol in it to consumers of the barrel."
  @visibleForTesting
  List<Import> collectExternalBarrelExports(Iterable<RenderSchema> schemas) {
    final collector = _ImportCollector();
    for (final schema in schemas) {
      RenderTreeWalker(visitor: collector).walkSchema(schema);
    }
    final byPath = <String, Set<String>>{};
    for (final i in collector.imports) {
      final isPkg = i.path.startsWith('package:');
      final isDart = i.path.startsWith('dart:');
      if (!isPkg && !isDart) continue;
      if (i.path.startsWith('package:$packageName/')) continue;
      if (i.asName != null) continue;
      if (i.shown.isEmpty) continue;
      byPath.putIfAbsent(i.path, () => <String>{}).addAll(i.shown);
    }
    return [
      for (final entry in byPath.entries)
        Import.path(entry.key, shown: entry.value.toList()),
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
      schema.createsNewType &&
      schema is! RenderRecursiveRef &&
      // Smooshed variants are emitted inline in their sealed
      // parent's file (Dart's `sealed` modifier requires direct
      // subclasses to live in the same library) — no separate file.
      !schema.isSmooshed;

  /// Collapse imports that would render as the same directive.
  ///
  /// [Libraries] makes one library one value, so the set these are
  /// gathered in normally dedupes them itself. This is the backstop for
  /// the case it cannot catch: the same library legitimately described
  /// two ways, e.g. bare versus narrowed by a `show` clause for the
  /// barrel. `add_imports.mustache` emits only the path and the prefix,
  /// so those two decide identity here — prefix included, because
  /// `import 'x' as a` and `import 'x' as b` are different directives.
  static Iterable<Import> _dedupeRenderedImports(Iterable<Import> imports) {
    final seen = <(String, String?)>{};
    return imports.where((i) => seen.add((i.path, i.asName)));
  }

  /// The imports implied by the schemas a file names.
  ///
  /// Both file kinds need the same three things once [schemasNamedBy] /
  /// [schemasNamedByApi] has answered: a directive per newtype, the
  /// library imports contributed by the schemas rendered inline, and
  /// `date.dart` when a `format: date` field is among them. Only the
  /// question of *which* schemas differs between an api file and a
  /// model file, so only that is asked separately.
  ///
  /// [names] gates the library imports on what the body actually
  /// emitted — whether a `format: date` field survived into this file
  /// is a fact about the template, not about the tree.
  Iterable<Import> _importsForNamedSchemas(
    NamedSchemas named, {
    required bool Function(String) names,
  }) => {
    ...named.inline
        .expand((s) => s.additionalImports)
        .where((i) => i.library.isNeededBy(names)),
    ..._dateImportFor(named.inline, bodyNamesDate: names('Date')),
    ...named.imported.map((s) => Import.path(modelPackageImport(this, s))),
  };

  @visibleForTesting
  Iterable<Import> importsForApi(
    Api api,
    ApiUsage usage, {
    required String body,
  }) {
    // Import only what the rendered [body] actually names. Each fixed
    // import is gated on a sentinel identifier that must appear if the
    // import is used (e.g. `HttpStatus` for `dart:io`), and each model
    // newtype on its own class name. Keeping an import requires the
    // token to be present, so a used import is never dropped; the
    // effect is purely to stop emitting imports the api file never
    // references (which `dart fix` would otherwise strip).
    final referenced = referencedIdentifiers(body);
    bool names(String token) => referenced.contains(token);

    final imports = {
      // Each kept when the body names something its library provides.
      // Which identifiers those are lives in [Libraries], not here — the
      // api file and the model files ask the same question of the same
      // definitions.
      for (final library in const [
        Libraries.dartAsync,
        Libraries.dartConvert,
        Libraries.dartIo,
      ])
        if (library.isNeededBy(names)) Import(library),
      if (names('ApiClient'))
        Import.path('package:$packageName/api_client.dart'),
      if (names('ApiException'))
        Import.path('package:$packageName/api_exception.dart'),
      // `as http` is only ever used via the `http.` prefix, so it is
      // gated on that rather than on a bare identifier: a `http` token in
      // a URL doc-comment must not keep it.
      if (body.contains('http.')) const Import(Libraries.http, asName: 'http'),
      ...usage.importsFor(packageName),
    };

    // Which schemas the endpoint methods name — asked of the render
    // tree, not of the rendered text. Every newtype (including
    // RenderRecursiveRef, which points at one) lives in its own file
    // and needs an import at the use site; smooshed variants resolve
    // through their sealed parent, which is imported instead.
    return _dedupeRenderedImports(
      imports
        ..addAll(_importsForNamedSchemas(schemasNamedByApi(api), names: names)),
    );
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
      final imports = importsForApi(
        api,
        renderedApi.usage,
        body: renderedApi.body,
      );
      final importsContext = imports
          .sortedBy((i) => i.path)
          .map((i) => i.toTemplateContext())
          .toList();
      final outPath = apiFilePath(api);
      _renderSpecTemplate(
        template: 'add_imports',
        outPath: outPath,
        context: {'imports': importsContext, 'content': renderedApi.body},
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
  Iterable<Import> importsForModel(
    RenderSchema schema,
    SchemaUsage usage, {
    required String body,
  }) {
    final referenced = referencedIdentifiers(body);
    bool names(String token) => referenced.contains(token);

    // Which schemas this file's own declarations name — asked of the
    // render tree, not of the rendered text. Every newtype (including
    // RenderRecursiveRef) resolves through an import; smooshed variants
    // and inline structure are rendered here and resolve locally.
    final named = schemasNamedBy(schema);

    final imports = {
      ...usage.importsFor(packageName),
      // The root schema's own contributions; the rest come from what it
      // names. Gated on the body, like every library import — see
      // [_importsForNamedSchemas].
      ...schema.additionalImports.where((i) => i.library.isNeededBy(names)),
      ..._importsForNamedSchemas(named, names: names),
    };
    // A file never imports itself.
    final selfPath = modelPackageImport(this, schema);
    imports.removeWhere((i) => i.path == selfPath);
    return _dedupeRenderedImports(imports);
  }

  void renderModels(Iterable<RenderSchema> schemas) {
    for (final schema in schemas) {
      final rendered = schemaRenderer.renderSchema(schema);
      usedModelHelpers.addAll(rendered.usage.modelHelpers);
      final imports = importsForModel(
        schema,
        rendered.usage,
        body: rendered.body,
      );
      final importsContext = imports
          .sortedBy((i) => i.path)
          .map((i) => i.toTemplateContext())
          .toList();

      final outPath = modelFilePath(schema);
      _renderSpecTemplate(
        template: 'add_imports',
        outPath: outPath,
        context: {'imports': importsContext, 'content': rendered.body},
      );
    }
  }

  /// Render a round-trip test for each schema that has a testable
  /// example value. Skips schemas for which [testPath] returns null,
  /// or for which [RenderSchema.exampleValue] returns null (recursive
  /// types, no-JSON types).
  ///
  /// `RenderOneOf` parents take a separate path
  /// ([_renderOneOfTest]): they don't have a single example value
  /// (the sealed type isn't directly constructible), but each
  /// smooshed inline-object variant does. Those variants used to
  /// render to their own files (and got their own round-trip tests
  /// per file); since smoosh inlined them into the parent's file, the
  /// parent's test file now owns their coverage.
  void renderModelTests(Iterable<RenderSchema> schemas) {
    final schemaContext = schemaRenderer;
    for (final schema in schemas) {
      if (!schema.createsNewType) continue;
      final layoutContext = _contextFor(schema);
      final outPath = testPath(layoutContext);
      if (outPath == null) continue;
      if (schema is RenderOneOf) {
        _renderOneOfTest(schema, outPath: outPath, context: schemaContext);
        continue;
      }
      final example = schema.exampleValue(schemaContext);
      if (example == null) continue;
      final invalidJson = schema.invalidJsonExample(schemaContext);
      _renderSpecTemplate(
        template: 'schema_round_trip_test',
        outPath: outPath,
        context: {
          'imports': testImportsContext(),
          'typeName': schema.typeName,
          // The declaration carries the keyword when the example is
          // constant (`const instance = ...`), which makes the whole tree
          // a constant context; otherwise it is a `final` declaration and
          // any constant subtree writes its own.
          'exampleValue': _exampleSource(example),
          'exampleIsConst': example.canBeConst,
          'invalidJsonExample': invalidJson,
          'isEnum': schema is RenderEnum,
          'roundTripByJson': schema.roundTripByJson,
          // `toString()` returns a String for every enum, but `toJson()`
          // returns the wire type — String for a string enum, int for an int
          // enum. Compare `toString()` against the *stringified* wire value so
          // the assertion type-checks (and keeps exercising `toString()`) for
          // both. For string enums this is exactly `value.toJson()`, so their
          // output is unchanged.
          'toJsonAsString': schema is RenderStringEnum
              ? 'value.toJson()'
              : 'value.toJson().toString()',
        },
      );
    }
  }

  /// Emit a round-trip test for [schema]'s smooshed variants — one
  /// `test()` per variant — into the parent's test file. Each test
  /// builds the variant directly, then round-trips it through the
  /// variant's own `maybeFromJson` / `toJson`. We don't dispatch
  /// through the parent's `fromJson` here for two reasons: (a) the
  /// variant's example value is sometimes built from non-required
  /// properties only, and the parent's predicate dispatch keys off
  /// fields that may be absent from the example; (b) the variant's
  /// own conversion is the unit under test.
  ///
  /// Skipped (no file emitted) when the oneOf has no smooshed
  /// variants, or when no smooshed variant produces a usable
  /// `exampleValue`. Non-smooshed wrapper subclasses (string/int/list
  /// variants) aren't covered here — they live in the parent's file
  /// too, but they predate smoosh and never had their own tests, so
  /// adding coverage for them is out of scope for this pass.
  ///
  /// Variants whose object has `additionalProperties` are also
  /// skipped: their example value carries an `entries: <String, …>{}`
  /// map field, and Dart's `Map ==` is reference equality, so the
  /// round-trip's equality assertion would fail spuriously. The same
  /// pre-existing equality bug already affects the standard
  /// per-schema round-trip test for top-level objects with
  /// `additionalProperties`; this skip prevents the smoosh test pass
  /// from regressing the github regen's pass count by the same
  /// underlying issue.
  void _renderOneOfTest(
    RenderOneOf schema, {
    required String outPath,
    required SchemaRenderer context,
  }) {
    final variants = <Map<String, dynamic>>[];
    for (final variant in schema.smooshedVariants) {
      if (variant.additionalProperties != null) continue;
      final example = variant.exampleValue(context);
      if (example == null) continue;
      variants.add({
        'variantTypeName': variant.typeName,
        'exampleValue': _exampleSource(example),
        'exampleIsConst': example.canBeConst,
      });
    }
    if (variants.isEmpty) return;
    _renderSpecTemplate(
      template: 'schema_oneof_round_trip_test',
      outPath: outPath,
      context: {
        'imports': testImportsContext(),
        'typeName': schema.typeName,
        'variants': variants,
      },
    );
  }

  /// Directories, relative to the package root, that this renderer
  /// generates into and therefore owns. Emptied before each run when
  /// clearing is on, so a renamed or deleted schema leaves nothing
  /// behind.
  ///
  /// Declared rather than worked out from the files we write, so that
  /// the claim "this directory is ours" is something the renderer says
  /// out loud, in one place, instead of being inferred from output
  /// paths after the fact.
  ///
  /// A directory here is deleted **recursively**, so only name ones
  /// holding nothing but generated output. In particular not `lib/`,
  /// `test/`, or the package root: a package's own files live there by
  /// Dart convention, so ours sit beside the consumer's, and we write
  /// no README, LICENSE, CHANGELOG or `.github/` that would replace
  /// theirs. Our files directly inside those have fixed names and are
  /// overwritten when still needed.
  ///
  /// **Override this whenever you override [modelPath] or [testPath].**
  /// The two encode the same decision — where output goes — and a
  /// layout moved without moving this gets no cleanup at all. That is
  /// how `shorebird_code_push_protocol`, which puts models under
  /// `lib/src/models/`, went without stale-file removal entirely.
  ///
  /// Generating into a package that also holds hand-written code is
  /// exactly the case to be explicit about: give the generated output
  /// a directory of its own (`lib/gen/`, `lib/src/models/`) and name it
  /// here, rather than sharing a directory with files we must not
  /// delete.
  @protected
  @visibleForOverriding
  Set<String> get generatedDirs => {
    p.join('lib', 'api'),
    // Both model layouts: [Quirks.flatModelDir] writes a flat `model/`,
    // the default splits into `models/` and `messages/`. Naming both
    // means regenerating with the quirk flipped clears the layout it
    // moved off of.
    p.join('lib', 'model'),
    p.join('lib', 'models'),
    p.join('lib', 'messages'),
    // Generated tests, all of them, from [testPath]. One directory
    // rather than a `test/` mirror of the three above, because `test/`
    // is shared with the consumer — see [testPath].
    p.join('test', 'gen'),
  };

  /// Delete the contents of [generatedDirs].
  void _clearGeneratedDirs() {
    for (final dir in generatedDirs) {
      final directory = fileWriter.fs.directory(
        p.join(fileWriter.outDir.path, dir),
      );
      if (directory.existsSync()) directory.deleteSync(recursive: true);
    }
  }

  /// Render the entire spec.
  void render(RenderSpec spec, {bool clearDirectory = true}) {
    if (clearDirectory) {
      _clearGeneratedDirs();
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
    // `usedDate` is complete after renderModels/renderApis; emit lib/date.dart
    // before the barrel (which re-exports it) and the format pass.
    renderDate();
    // This is a bit of hack, but seems to work with the specs I've tested.
    // Probably ClientName should be a parameter to the render function.
    final specName = spec.title.split(' ').firstOrNull ?? '';
    renderClient(renderedApis, specName: specName);
    // Render the combined api.dart exporting all rendered schemas.
    renderPublicApi(spec.apis, schemas);
    formatter.formatAndFix(pkgDir: fileWriter.outDir.path);

    final misspellings = spellChecker.collectMisspellings(fileWriter.outDir);
    renderCspellConfig(misspellings);
  }
}

/// Source for a round-trip test's `instance` initializer. A constant
/// example is declared `const`, which makes its whole tree a constant
/// context; a non-constant one is declared `final`, so any constant
/// subtree inside it needs its own keyword.
String _exampleSource(DartExpression example) =>
    serializeExpression(example, isConstContext: example.canBeConst);
