// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('GuildTemplateRoleColorsResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = GuildTemplateRoleColorsResponse(
        primaryColor: 0,
        secondaryColor: 0,
        tertiaryColor: 0,
      );
      final parsed = GuildTemplateRoleColorsResponse.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GuildTemplateRoleColorsResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () =>
            GuildTemplateRoleColorsResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
