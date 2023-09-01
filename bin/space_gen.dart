import 'dart:io';

import 'package:mason_logger/mason_logger.dart';
import 'package:space_gen/space_gen.dart';

final logger = Logger();

void main(List<String> arguments) async {
  // These could eventually be passed in as arguments
  const specPath = '../api-docs/reference/SpaceTraders.json';
  const outDirPath = 'out';

  // We should eventualy support urls not just paths.
  final specUrl = Uri.parse(specPath);
  final spec = await Spec.load(specUrl);
  // Could make clearing of the directory optional.
  final outDir = Directory(outDirPath)..deleteSync(recursive: true);
  Context(spec, outDir).render();
}
