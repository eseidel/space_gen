// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('GuildRoleColorsResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = GuildRoleColorsResponse(
        primaryColor: 0,
        secondaryColor: 0,
        tertiaryColor: 0,
      );
      final parsed = GuildRoleColorsResponse.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GuildRoleColorsResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GuildRoleColorsResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
