// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('GuildMfaLevel', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = GuildMfaLevel.none;
      final parsed = GuildMfaLevel.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GuildMfaLevel.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(() => GuildMfaLevel.maybeFromJson(-1), throwsFormatException);
    });

    test('toString matches toJson for every value', () {
      for (final value in GuildMfaLevel.values) {
        expect(value.toString(), equals(value.toJson().toString()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in GuildMfaLevel.values) {
        expect(GuildMfaLevel.fromJson(value.toJson()), equals(value));
      }
    });
  });
}
