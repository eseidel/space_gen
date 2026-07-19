// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('GuildExplicitContentFilterTypes', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = GuildExplicitContentFilterTypes.disabled;
      final parsed = GuildExplicitContentFilterTypes.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GuildExplicitContentFilterTypes.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GuildExplicitContentFilterTypes.maybeFromJson(-1),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in GuildExplicitContentFilterTypes.values) {
        expect(value.toString(), equals(value.toJson().toString()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in GuildExplicitContentFilterTypes.values) {
        expect(
          GuildExplicitContentFilterTypes.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
