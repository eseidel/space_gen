// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('GuildScheduledEventStatuses', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = GuildScheduledEventStatuses.scheduled;
      final parsed = GuildScheduledEventStatuses.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GuildScheduledEventStatuses.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GuildScheduledEventStatuses.maybeFromJson(-1),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in GuildScheduledEventStatuses.values) {
        expect(value.toString(), equals(value.toJson().toString()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in GuildScheduledEventStatuses.values) {
        expect(
          GuildScheduledEventStatuses.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
