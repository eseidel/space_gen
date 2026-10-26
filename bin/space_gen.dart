import 'dart:io';

import 'package:space_gen/space_gen.dart';

Future<void> main(List<String> arguments) async {
  exitCode = await runCli(arguments);
}
