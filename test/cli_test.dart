import 'package:mason_logger/mason_logger.dart';
import 'package:space_gen/src/cli.dart';
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
  });
}
