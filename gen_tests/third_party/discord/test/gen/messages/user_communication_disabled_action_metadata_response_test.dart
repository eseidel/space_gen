// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('UserCommunicationDisabledActionMetadataResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = UserCommunicationDisabledActionMetadataResponse(
        durationSeconds: 0,
      );
      final parsed =
          UserCommunicationDisabledActionMetadataResponse.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        UserCommunicationDisabledActionMetadataResponse.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => UserCommunicationDisabledActionMetadataResponse.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
