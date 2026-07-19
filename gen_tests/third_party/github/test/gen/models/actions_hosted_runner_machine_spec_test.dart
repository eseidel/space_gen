// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ActionsHostedRunnerMachineSpec', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ActionsHostedRunnerMachineSpec(
        id: '8-core',
        cpuCores: 8,
        memoryGb: 32,
        storageGb: 300,
      );
      final parsed = ActionsHostedRunnerMachineSpec.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ActionsHostedRunnerMachineSpec.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ActionsHostedRunnerMachineSpec.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
