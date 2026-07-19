// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('UserResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = UserResponse(
        id: SnowflakeType('0'),
        username: 'example',
        avatar: 'example',
        discriminator: 'example',
        publicFlags: 0,
        flags: Int53Type(-9007199254740991),
        globalName: 'example',
        primaryGuild: UserPrimaryGuildResponse(
          identityGuildId: SnowflakeType('0'),
          identityEnabled: false,
          tag: 'example',
          badge: 'example',
        ),
      );
      final parsed = UserResponse.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(UserResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => UserResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
