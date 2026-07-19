// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('ApplicationCommandOptionType', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ApplicationCommandOptionType.subCommand;
      final parsed = ApplicationCommandOptionType.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ApplicationCommandOptionType.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ApplicationCommandOptionType.maybeFromJson(-1),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in ApplicationCommandOptionType.values) {
        expect(value.toString(), equals(value.toJson().toString()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in ApplicationCommandOptionType.values) {
        expect(
          ApplicationCommandOptionType.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
