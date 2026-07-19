// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ActionsGenerateRunnerJitconfigForRepoRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ActionsGenerateRunnerJitconfigForRepoRequest(
        name: 'example',
        runnerGroupId: 0,
        labels: <String>['example'],
      );
      final parsed = ActionsGenerateRunnerJitconfigForRepoRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ActionsGenerateRunnerJitconfigForRepoRequest.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ActionsGenerateRunnerJitconfigForRepoRequest.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
