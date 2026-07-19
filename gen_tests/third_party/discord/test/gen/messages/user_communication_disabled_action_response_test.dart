// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('UserCommunicationDisabledActionResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = UserCommunicationDisabledActionResponse(
        metadata: UserCommunicationDisabledActionMetadataResponse(
          durationSeconds: 0,
        ),
      );
      final parsed = UserCommunicationDisabledActionResponse.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        UserCommunicationDisabledActionResponse.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => UserCommunicationDisabledActionResponse.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
