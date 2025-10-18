import 'package:file/file.dart';
import 'package:file/local.dart';
import 'package:path/path.dart' as p;
import 'package:space_gen/space_gen.dart';

Future<void> genTests(
  Directory testDir, {
  List<String> skipList = const [],
}) async {
  const quirks = Quirks.openapi();
  final templatesDir = const LocalFileSystem().directory('lib/templates');
  // Collect all the spec.json files in the directory.
  final specFiles = testDir
      .listSync()
      .where((file) => file.path.endsWith('.json'))
      .toList();
  for (final specFile in specFiles) {
    // Grab the name of the spec from the file name.
    final specName = p.basenameWithoutExtension(specFile.path);
    if (skipList.contains(specName)) {
      logger.info('Skipping $specName');
      continue;
    }
    logger.info('Generating from $specFile to ${testDir.path}');
    final packageName = specName.replaceAll('.', '_').replaceAll('-', '_');
    final outDir = testDir.childDirectory(packageName);
    await loadAndRenderSpec(
      specUrl: specFile.uri,
      outDir: outDir,
      packageName: packageName,
      quirks: quirks,
      templatesDir: templatesDir,
    );
  }
}

Future<void> run() async {
  const fs = LocalFileSystem();
  final packageRoot = fs.currentDirectory;
  final publicDir = packageRoot.childDirectory('../gen_tests');
  // final privateDir = packageRoot.childDirectory('../private_gen_tests');
  final skipList = ['petstore'];

  if (publicDir.existsSync()) {
    await genTests(publicDir, skipList: skipList);
  } else {
    logger.err('gen_tests directory does not exist: ${publicDir.path}');
    return;
  }
  // if (privateDir.existsSync()) {
  //   await genTests(privateDir);
  // } else {
  //   logger.info(
  //     'private_gen_tests directory does not exist: ${privateDir.path}',
  //   );
  // }
}

void main() async {
  await runWithLogger(Logger(), run);
}
