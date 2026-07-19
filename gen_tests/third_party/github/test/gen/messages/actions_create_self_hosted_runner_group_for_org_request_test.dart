// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ActionsCreateSelfHostedRunnerGroupForOrgRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ActionsCreateSelfHostedRunnerGroupForOrgRequest(
        name: 'example',
      );
      final parsed =
          ActionsCreateSelfHostedRunnerGroupForOrgRequest.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ActionsCreateSelfHostedRunnerGroupForOrgRequest.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ActionsCreateSelfHostedRunnerGroupForOrgRequest.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
