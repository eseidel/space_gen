// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ActionsGenerateRunnerJitconfigForOrgRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ActionsGenerateRunnerJitconfigForOrgRequest(
        name: 'example',
        runnerGroupId: 0,
        labels: const <String>['example'],
      );
      final parsed = ActionsGenerateRunnerJitconfigForOrgRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ActionsGenerateRunnerJitconfigForOrgRequest.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ActionsGenerateRunnerJitconfigForOrgRequest.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
