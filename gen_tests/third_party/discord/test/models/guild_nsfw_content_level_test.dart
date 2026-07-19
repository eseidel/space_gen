// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('GuildNsfwContentLevel', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = GuildNsfwContentLevel.default_;
      final parsed = GuildNsfwContentLevel.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GuildNsfwContentLevel.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GuildNsfwContentLevel.maybeFromJson(-1),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in GuildNsfwContentLevel.values) {
        expect(value.toString(), equals(value.toJson().toString()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in GuildNsfwContentLevel.values) {
        expect(GuildNsfwContentLevel.fromJson(value.toJson()), equals(value));
      }
    });
  });
}
