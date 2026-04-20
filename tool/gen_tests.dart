import 'dart:io' as io;

import 'package:args/args.dart';
import 'package:file/file.dart';
import 'package:file/local.dart';
import 'package:path/path.dart' as p;
import 'package:space_gen/space_gen.dart';

class TestCase {
  TestCase({
    required this.spec,
    required this.outDir,
  });
  final File spec;
  final Directory outDir;

  String get packageName => outDir.basename;
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
    final specFiles = testDir
        .listSync()
        .whereType<File>()
        .where((file) => file.path.endsWith('.json'))
        .toList();
    for (final specFile in specFiles) {
      final specName = p.basenameWithoutExtension(specFile.path);
      final packageName = specName.replaceAll('.', '_').replaceAll('-', '_');
      if (!shouldInclude(specFile: specFile, packageName: packageName)) {
        continue;
      }
      final outDir = testDir.childDirectory(packageName);
      tests.add(TestCase(spec: specFile, outDir: outDir));
    }
  }
  return tests;
}

Future<void> runTest({
  required TestCase testCase,
  required Directory templatesDir,
  required Quirks quirks,
}) async {
  final specFile = testCase.spec;
  final outDir = testCase.outDir;
  await loadAndRenderSpec(
    GeneratorConfig(
      specUrl: specFile.uri,
      outDir: outDir,
      packageName: testCase.packageName,
      quirks: quirks,
      templatesDir: templatesDir,
    ),
  );
}

Future<void> run({
  bool verbose = false,
  List<String> skipList = const [],
  List<String> globList = const [],
}) async {
  if (verbose) {
    setVerboseLogging();
  }
  const fs = LocalFileSystem();
  final packageRoot = fs.currentDirectory;
  final potentialTestDirs = [
    packageRoot.childDirectory('gen_tests'),
    packageRoot.childDirectory('../gen_tests'),
    packageRoot.childDirectory('../private_gen_tests'),
  ];
  final testDirs = potentialTestDirs.where((dir) => dir.existsSync()).toList();
  final tests = collectTests(
    testDirs: testDirs,
    globList: globList,
    skipList: skipList,
  );
  final templatesDir = fs.directory('lib/templates');
  const quirks = Quirks.openapi();
  for (final test in tests) {
    await runTest(
      testCase: test,
      templatesDir: templatesDir,
      quirks: quirks,
    );
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
    ..addMultiOption(
      'ignore',
      abbr: 'i',
      help: 'Comma separated list of specs to skip',
      // TODO(eseidel): remove these once they don't crash.
      defaultsTo: ['petstore', 'spacetraders'],
    );
  final results = parser.parse(args);
  final verbose = results['verbose'] as bool;
  final ignoreList = results['ignore'] as List<String>? ?? <String>[];
  final globList = results.rest;
  await runWithLogger(
    Logger(),
    () => run(
      verbose: verbose,
      skipList: ignoreList,
      globList: globList,
    ),
  );
}
