// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('UserCommunicationDisabledAction', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = UserCommunicationDisabledAction(
        metadata: UserCommunicationDisabledActionMetadata(),
      );
      final parsed = UserCommunicationDisabledAction.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(UserCommunicationDisabledAction.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () =>
            UserCommunicationDisabledAction.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
