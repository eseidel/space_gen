// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ActionsListSelfHostedRunnersInGroupForOrg200Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ActionsListSelfHostedRunnersInGroupForOrg200Response(
        totalCount: 0,
        runners: <Runner>[
          Runner(
            id: 5,
            name: 'iMac',
            os: 'macos',
            status: 'online',
            busy: false,
            labels: <RunnerLabel>[RunnerLabel(name: 'example')],
          ),
        ],
      );
      final parsed =
          ActionsListSelfHostedRunnersInGroupForOrg200Response.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ActionsListSelfHostedRunnersInGroupForOrg200Response.maybeFromJson(
          null,
        ),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () =>
            ActionsListSelfHostedRunnersInGroupForOrg200Response.maybeFromJson(
              <String, dynamic>{},
            ),
        throwsFormatException,
      );
    });
  });
}
