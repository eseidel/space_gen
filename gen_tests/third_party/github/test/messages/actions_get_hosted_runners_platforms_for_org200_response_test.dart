// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ActionsGetHostedRunnersPlatformsForOrg200Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ActionsGetHostedRunnersPlatformsForOrg200Response(
        totalCount: 0,
        platforms: <String>['example'],
      );
      final parsed =
          ActionsGetHostedRunnersPlatformsForOrg200Response.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ActionsGetHostedRunnersPlatformsForOrg200Response.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ActionsGetHostedRunnersPlatformsForOrg200Response.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
