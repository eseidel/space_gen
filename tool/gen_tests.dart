import 'dart:io' as io;

import 'package:args/args.dart';
import 'package:file/file.dart';
import 'package:file/local.dart';
import 'package:path/path.dart' as p;
import 'package:space_gen/space_gen.dart';
import 'package:yaml/yaml.dart';

class TestCase {
  TestCase({
    required this.spec,
    required this.outDir,
    required this.quirks,
  });
  final File spec;
  final Directory outDir;

  /// Generation settings for this spec.
  ///
  /// Not a constant across all test dirs: `Quirks.openapi()` flips six
  /// flags that change emitted *semantics* (`dynamicJson`,
  /// `mutableModels`, `nonNullableDefaultValues`, …), not just the
  /// `lib/model/` vs `lib/models/` layout. This repo's fixtures are
  /// generated with it; the parallel spec repo is generated without.
  /// Hardcoding either one silently rewrites the other's output.
  final Quirks quirks;

  String get packageName => outDir.basename;
}

/// Spec file extensions [collectTests] will pick up when a directory
/// has no manifest.
///
/// A directory holding YAML that is *not* a spec (`cspell.config.yaml`,
/// `analysis_options.yaml`) must use a manifest, which replaces the
/// scan; otherwise that file is treated as a spec.
const _specExtensions = ['.json', '.yaml', '.yml'];

/// Name of the optional per-directory manifest, e.g.
///
/// ```yaml
/// specs:
///   - spec: api.github.com.json
///     package: github          # optional; defaults to the derived name
///   - spec: train-travel.yaml
///     package: train_travel
/// ```
///
/// A directory carrying one is described entirely by it — the spec list
/// is explicit rather than scanned, and each entry may override the
/// package name. Without a manifest the directory is scanned as before,
/// which is why `gen_tests/` in this repo needs no config.
///
/// The override exists because the package name is otherwise forced to
/// be a mangling of the spec's filename: `api.github.com.json` would
/// have to live in `api_github_com/`. The parallel spec repo prefers
/// `github/`, and renaming the *input* files to control the output
/// directory is the wrong lever.
const _manifestName = 'gen_tests.yaml';

/// The package name [spec]'s filename implies: extension dropped, and
/// `.`/`-` (illegal in a Dart package name) folded to `_`.
String _derivePackageName(File spec) => p
    .basenameWithoutExtension(spec.path)
    .replaceAll('.', '_')
    .replaceAll('-', '_');

/// Reads [_manifestName] from [testDir], or returns null if absent.
///
/// Throws on a malformed manifest or a listed spec that does not exist
/// — a typo'd entry silently generating nothing is exactly the failure
/// this file is meant to remove.
List<TestCase>? _testsFromManifest(Directory testDir) {
  final manifest = testDir.childFile(_manifestName);
  if (!manifest.existsSync()) return null;
  final doc = loadYaml(manifest.readAsStringSync());
  if (doc is! Map || doc['specs'] is! List) {
    throw Exception('${manifest.path}: expected a top-level `specs:` list');
  }
  // Directory-wide default, overridable per spec. `true` matches what
  // a directory without a manifest gets below, so adding a manifest to
  // an existing directory changes nothing until you say otherwise.
  final dirOpenapi = doc['openapi'] as bool? ?? true;
  final tests = <TestCase>[];
  for (final entry in doc['specs'] as List) {
    if (entry is! Map || entry['spec'] is! String) {
      throw Exception('${manifest.path}: each entry needs a `spec:` path');
    }
    final specFile = testDir.childFile(entry['spec'] as String);
    if (!specFile.existsSync()) {
      throw Exception('${manifest.path}: no such spec ${specFile.path}');
    }
    final packageName =
        (entry['package'] as String?) ?? _derivePackageName(specFile);
    final openapi = entry['openapi'] as bool? ?? dirOpenapi;
    tests.add(
      TestCase(
        spec: specFile,
        outDir: testDir.childDirectory(packageName),
        quirks: openapi ? const Quirks.openapi() : const Quirks(),
      ),
    );
  }
  return tests;
}

List<TestCase> collectTests({
  required List<Directory> testDirs,
  List<String> globList = const [],
  List<String> skipList = const [],
}) {
  bool shouldInclude({required File specFile, required String packageName}) {
    if (skipList.contains(packageName)) {
      logger.info('Skipping $packageName');
      return false;
    }
    // Could use a fancier glob matcher, right now using contains.
    if (globList.isNotEmpty) {
      if (!globList.any((glob) => specFile.path.contains(glob))) {
        logger.info(
          'Skipping $packageName because it does not match $globList',
        );
        return false;
      }
    }
    return true;
  }

  final tests = <TestCase>[];
  for (final testDir in testDirs) {
    // A manifest, when present, replaces the directory scan — it is the
    // list, including any package-name overrides. Skip/glob still apply
    // on top so `gen_tests.dart github` keeps working either way.
    final candidates =
        _testsFromManifest(testDir) ??
        testDir
            .listSync()
            .whereType<File>()
            .where((f) => _specExtensions.contains(p.extension(f.path)))
            .map(
              (f) => TestCase(
                spec: f,
                outDir: testDir.childDirectory(_derivePackageName(f)),
                quirks: const Quirks.openapi(),
              ),
            )
            .toList();
    for (final test in candidates) {
      if (!shouldInclude(
        specFile: test.spec,
        packageName: test.packageName,
      )) {
        continue;
      }
      tests.add(test);
    }
  }
  return tests;
}

Future<void> runTest({
  required TestCase testCase,
  required Directory templatesDir,
}) async {
  final specFile = testCase.spec;
  final outDir = testCase.outDir;
  await loadAndRenderSpec(
    GeneratorConfig(
      specUrl: specFile.uri,
      outDir: outDir,
      packageName: testCase.packageName,
      quirks: testCase.quirks,
      templatesDir: templatesDir,
    ),
  );
}

Future<void> run({
  bool verbose = false,
  bool dryRun = false,
  List<String> skipList = const [],
  List<String> globList = const [],
  List<String> extraDirs = const [],
}) async {
  if (verbose) {
    setVerboseLogging();
  }
  const fs = LocalFileSystem();
  final packageRoot = fs.currentDirectory;
  final potentialTestDirs = [
    packageRoot.childDirectory('gen_tests'),
    // The spec repo currently sits beside the space_gen checkout. That
    // only resolves from the primary clone — from a git worktree it
    // does not — so `--dir` exists to name it explicitly.
    packageRoot.childDirectory('../gen_tests'),
    ...extraDirs.map(fs.directory),
  ];
  final testDirs = potentialTestDirs.where((dir) => dir.existsSync()).toList();
  final tests = collectTests(
    testDirs: testDirs,
    globList: globList,
    skipList: skipList,
  );
  if (dryRun) {
    for (final test in tests) {
      logger.info(
        '${test.spec.path} -> ${test.outDir.path} '
        '(package: ${test.packageName})',
      );
    }
    return;
  }
  final templatesDir = fs.directory('lib/templates');
  for (final test in tests) {
    await runTest(testCase: test, templatesDir: templatesDir);
  }

  // Run the unit tests.
  final result = await io.Process.run(
    'dart',
    ['test', '.'],
    workingDirectory: packageRoot
        .childDirectory('gen_tests')
        .childDirectory('tests')
        .path,
  );
  logger
    ..info(result.stdout as String)
    ..info(result.stderr as String);
  if (result.exitCode != 0) {
    throw Exception('Unit tests failed');
  }
}

void main(List<String> args) async {
  final parser = ArgParser()
    ..addFlag('verbose', abbr: 'v', help: 'Verbose output')
    ..addFlag(
      'dry-run',
      help: 'Print each spec -> output directory mapping and exit',
    )
    ..addMultiOption(
      'ignore',
      abbr: 'i',
      help: 'Comma separated list of specs to skip',
    )
    ..addMultiOption(
      'dir',
      abbr: 'd',
      help: 'Additional directory of specs to generate (repeatable)',
    );
  final results = parser.parse(args);
  final verbose = results['verbose'] as bool;
  final ignoreList = results['ignore'] as List<String>? ?? <String>[];
  final extraDirs = results['dir'] as List<String>? ?? <String>[];
  final globList = results.rest;
  await runWithLogger(
    Logger(),
    () => run(
      verbose: verbose,
      dryRun: results['dry-run'] as bool,
      skipList: ignoreList,
      globList: globList,
      extraDirs: extraDirs,
    ),
  );
}
