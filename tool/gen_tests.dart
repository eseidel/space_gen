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

/// Name of the per-directory manifest that describes a spec directory:
///
/// ```yaml
/// openapi: false             # directory-wide default, per-entry overridable
/// specs:
///   - spec: api.github.com.json
///     package: github        # optional; defaults to the derived name
///   - spec: train-travel.yaml
/// ```
///
/// A spec directory is described entirely by its manifest — point the
/// tool at a directory and it generates what the manifest says. There
/// is deliberately no fallback that infers the list from the
/// filesystem: inference cannot express the two things that actually
/// vary. `api.github.com.json` needs to generate `github/` rather than
/// `api_github_com/`, and a directory's quirks are not guessable at all
/// (this repo's fixtures use `Quirks.openapi()`; the parallel spec repo
/// does not, and generating it with them rewrites every package).
///
/// It also removes a trap: a scan would treat any stray
/// `cspell.config.yaml` or `analysis_options.yaml` sitting beside the
/// specs as a spec.
const _manifestName = 'gen_tests.yaml';

/// The package name [spec]'s filename implies: extension dropped, and
/// `.`/`-` (illegal in a Dart package name) folded to `_`.
String _derivePackageName(File spec) => p
    .basenameWithoutExtension(spec.path)
    .replaceAll('.', '_')
    .replaceAll('-', '_');

/// Reads [_manifestName] from [testDir].
///
/// Throws if it is missing or malformed, or if a listed spec does not
/// exist — a typo'd entry silently generating nothing is exactly the
/// failure this file is meant to remove.
List<TestCase> _testsFromManifest(Directory testDir) {
  final manifest = testDir.childFile(_manifestName);
  if (!manifest.existsSync()) {
    throw Exception('${testDir.path}: no $_manifestName');
  }
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
    // The manifest is the list. Skip/glob still narrow it, so
    // `gen_tests.dart types` keeps working.
    for (final test in _testsFromManifest(testDir)) {
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
  // Both implicit directories are repo-relative, so they resolve the
  // same from the primary clone and from any git worktree. The
  // real-world specs used to live in a sibling checkout reached via
  // `../gen_tests`, which resolved only from the primary clone — from a
  // worktree the directory simply was not there, and a missing directory
  // was silently skipped, so a regen would report success having
  // generated nothing. They are in `gen_tests/third_party/` now, which
  // also scopes the licensing note and the cspell ignore to one path.
  // `--dir` remains for pointing the tool outside the repo.
  //
  // Each directory carries its own manifest rather than being discovered
  // by recursion: `third_party/` differs from its parent in quirks, and
  // that is not inferable from the filesystem.
  final genTests = packageRoot.childDirectory('gen_tests');
  final testDirs = [
    genTests,
    genTests.childDirectory('third_party'),
    ...extraDirs.map(fs.directory),
  ];
  for (final dir in testDirs) {
    if (!dir.existsSync()) {
      throw Exception('Test directory does not exist: ${dir.path}');
    }
  }
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
