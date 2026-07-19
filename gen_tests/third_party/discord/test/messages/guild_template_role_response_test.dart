// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('GuildTemplateRoleResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = GuildTemplateRoleResponse(
        id: 0,
        name: 'example',
        permissions: 'example',
        color: 0,
        colors: GuildTemplateRoleColorsResponse(
          primaryColor: 0,
          secondaryColor: 0,
          tertiaryColor: 0,
        ),
        hoist: false,
        mentionable: false,
        icon: 'example',
        unicodeEmoji: 'example',
      );
      final parsed = GuildTemplateRoleResponse.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GuildTemplateRoleResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GuildTemplateRoleResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
