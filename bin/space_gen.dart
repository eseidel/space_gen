import 'dart:io';

import 'package:mason_logger/mason_logger.dart';
import 'package:space_gen/space_gen.dart';

final logger = Logger();

void main(List<String> arguments) async {
  final specUrl = Uri.parse('../api-docs/reference/SpaceTraders.json');
  final spec = await Spec.load(specUrl);
  // for (final endpoint in spec.endpoints) {
  //   logger.info('${endpoint.tag} ${endpoint.method} ${endpoint.path}');
  // }

  final outDir = Directory('out')..deleteSync(recursive: true);
  Context(spec, outDir).render();
}
