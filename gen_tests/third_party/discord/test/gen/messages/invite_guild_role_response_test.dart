// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('InviteGuildRoleResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = InviteGuildRoleResponse(
        id: SnowflakeType('0'),
        name: 'example',
        position: 0,
        color: 0,
        colors: const GuildRoleColorsResponse(
          primaryColor: 0,
          secondaryColor: 0,
          tertiaryColor: 0,
        ),
        icon: 'example',
        unicodeEmoji: 'example',
      );
      final parsed = InviteGuildRoleResponse.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(InviteGuildRoleResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => InviteGuildRoleResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
