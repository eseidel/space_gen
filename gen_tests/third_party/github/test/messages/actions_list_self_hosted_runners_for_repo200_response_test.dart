// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ActionsListSelfHostedRunnersForRepo200Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ActionsListSelfHostedRunnersForRepo200Response(
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
          ActionsListSelfHostedRunnersForRepo200Response.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ActionsListSelfHostedRunnersForRepo200Response.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ActionsListSelfHostedRunnersForRepo200Response.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
