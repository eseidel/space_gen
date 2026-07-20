// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ActionsSetCustomLabelsForSelfHostedRunnerForRepoRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ActionsSetCustomLabelsForSelfHostedRunnerForRepoRequest(
        labels: const <String>['example'],
      );
      final parsed =
          ActionsSetCustomLabelsForSelfHostedRunnerForRepoRequest.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ActionsSetCustomLabelsForSelfHostedRunnerForRepoRequest.maybeFromJson(
          null,
        ),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () =>
            ActionsSetCustomLabelsForSelfHostedRunnerForRepoRequest.maybeFromJson(
              <String, dynamic>{},
            ),
        throwsFormatException,
      );
    });
  });
}
