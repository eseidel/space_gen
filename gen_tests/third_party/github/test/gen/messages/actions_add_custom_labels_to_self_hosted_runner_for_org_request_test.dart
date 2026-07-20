// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ActionsAddCustomLabelsToSelfHostedRunnerForOrgRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ActionsAddCustomLabelsToSelfHostedRunnerForOrgRequest(
        labels: const <String>['example'],
      );
      final parsed =
          ActionsAddCustomLabelsToSelfHostedRunnerForOrgRequest.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ActionsAddCustomLabelsToSelfHostedRunnerForOrgRequest.maybeFromJson(
          null,
        ),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () =>
            ActionsAddCustomLabelsToSelfHostedRunnerForOrgRequest.maybeFromJson(
              <String, dynamic>{},
            ),
        throwsFormatException,
      );
    });
  });
}
