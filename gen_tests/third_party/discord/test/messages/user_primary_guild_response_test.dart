// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('UserPrimaryGuildResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = UserPrimaryGuildResponse(
        identityGuildId: SnowflakeType('0'),
        identityEnabled: false,
        tag: 'example',
        badge: 'example',
      );
      final parsed = UserPrimaryGuildResponse.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(UserPrimaryGuildResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => UserPrimaryGuildResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
