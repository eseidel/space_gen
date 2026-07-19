// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('PrivateGroupChannelResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = PrivateGroupChannelResponse(
        id: SnowflakeType('0'),
        flags: 0,
        recipients: <UserResponse>[
          UserResponse(
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
          ),
        ],
        name: 'example',
        icon: 'example',
        ownerId: SnowflakeType('0'),
      );
      final parsed = PrivateGroupChannelResponse.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(PrivateGroupChannelResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => PrivateGroupChannelResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
