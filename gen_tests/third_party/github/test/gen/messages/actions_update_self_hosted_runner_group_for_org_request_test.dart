// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ActionsUpdateSelfHostedRunnerGroupForOrgRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ActionsUpdateSelfHostedRunnerGroupForOrgRequest(
        name: 'example',
      );
      final parsed =
          ActionsUpdateSelfHostedRunnerGroupForOrgRequest.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ActionsUpdateSelfHostedRunnerGroupForOrgRequest.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ActionsUpdateSelfHostedRunnerGroupForOrgRequest.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
