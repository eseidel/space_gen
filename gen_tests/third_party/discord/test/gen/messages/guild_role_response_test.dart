// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('GuildRoleResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = GuildRoleResponse(
        id: SnowflakeType('0'),
        name: 'example',
        description: 'example',
        permissions: 'example',
        position: 0,
        color: 0,
        colors: const GuildRoleColorsResponse(
          primaryColor: 0,
          secondaryColor: 0,
          tertiaryColor: 0,
        ),
        hoist: false,
        managed: false,
        mentionable: false,
        icon: 'example',
        unicodeEmoji: 'example',
        flags: 0,
      );
      final parsed = GuildRoleResponse.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GuildRoleResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GuildRoleResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
