// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ActionsHostedRunner', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ActionsHostedRunner(
        id: 5,
        name: 'my-github-hosted-runner',
        imageDetails: ActionsHostedRunnerPoolImage(
          id: 'ubuntu-20.04',
          sizeGb: 86,
          displayName: 'example',
          source: ActionsHostedRunnerPoolImageSource.github,
        ),
        machineSizeDetails: ActionsHostedRunnerMachineSpec(
          id: '8-core',
          cpuCores: 8,
          memoryGb: 32,
          storageGb: 300,
        ),
        status: ActionsHostedRunnerStatus.ready,
        platform: 'linux-x64',
        publicIpEnabled: false,
      );
      final parsed = ActionsHostedRunner.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ActionsHostedRunner.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ActionsHostedRunner.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
