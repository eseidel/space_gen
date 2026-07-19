// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ActionsSetSelfHostedRunnersInGroupForOrgRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ActionsSetSelfHostedRunnersInGroupForOrgRequest(
        runners: <int>[0],
      );
      final parsed =
          ActionsSetSelfHostedRunnersInGroupForOrgRequest.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ActionsSetSelfHostedRunnersInGroupForOrgRequest.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ActionsSetSelfHostedRunnersInGroupForOrgRequest.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
