import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:space_gen/space_gen.dart';
import 'package:space_gen/src/logger.dart';

void main(List<String> arguments) async {
  // These could eventually be passed in as arguments
  const specPath = 'examples/specs/spacetraders/reference/SpaceTraders.json';
  const outDirPath = 'examples/spacetraders';

  logger.info('Generating $specPath to $outDirPath');
  final absolutePath = p.absolute(specPath);
  final specUrl = Uri.parse(absolutePath);
  // Could make clearing of the directory optional.
  final outDir = Directory(outDirPath);
  if (outDir.existsSync()) {
    outDir.deleteSync(recursive: true);
  }
  final context = Context(specUrl, outDir);
  await context.load();
  context.render();
}
