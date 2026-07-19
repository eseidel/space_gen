// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('GuildScheduledEventEntityTypes', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = GuildScheduledEventEntityTypes.none;
      final parsed = GuildScheduledEventEntityTypes.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GuildScheduledEventEntityTypes.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GuildScheduledEventEntityTypes.maybeFromJson(-1),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in GuildScheduledEventEntityTypes.values) {
        expect(value.toString(), equals(value.toJson().toString()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in GuildScheduledEventEntityTypes.values) {
        expect(
          GuildScheduledEventEntityTypes.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
