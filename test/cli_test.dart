import 'dart:convert';
import 'dart:io';

import 'package:mason_logger/mason_logger.dart';
import 'package:space_gen/space_gen.dart';
import 'package:test/test.dart';

void main() {
  group('runCli', () {
    test('--help prints usage and succeeds', () async {
      expect(await runCli(['--help']), ExitCode.success.code);
      expect(await runCli(['-h']), ExitCode.success.code);
    });

    test('unknown option is a usage error', () async {
      expect(await runCli(['--bogus']), ExitCode.usage.code);
    });

    test('missing mandatory option is a usage error', () async {
      expect(await runCli(['-o', 'out']), ExitCode.usage.code);
      expect(await runCli(['-i', 'spec.yaml']), ExitCode.usage.code);
    });

    test('unexpected positional arguments are a usage error', () async {
      expect(
        await runCli(['-i', 'spec.yaml', '-o', 'out', 'extra']),
        ExitCode.usage.code,
      );
    });

    test('generates a package from a spec', () async {
      final tmp = Directory.systemTemp.createTempSync('space_gen_cli_test');
      addTearDown(() => tmp.deleteSync(recursive: true));
      final spec = File('${tmp.path}/spec.json')
        ..writeAsStringSync(
          jsonEncode({
            'openapi': '3.0.0',
            'info': {'title': 'Test', 'version': '1.0.0'},
            'paths': <String, dynamic>{},
          }),
        );
      final out = '${tmp.path}/demo_api';
      expect(await runCli(['-i', spec.path, '-o', out]), ExitCode.success.code);
      expect(File('$out/pubspec.yaml').existsSync(), isTrue);
    });
  });
}
