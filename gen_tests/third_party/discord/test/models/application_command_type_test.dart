// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('ApplicationCommandType', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ApplicationCommandType.chat;
      final parsed = ApplicationCommandType.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ApplicationCommandType.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ApplicationCommandType.maybeFromJson(-1),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in ApplicationCommandType.values) {
        expect(value.toString(), equals(value.toJson().toString()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in ApplicationCommandType.values) {
        expect(ApplicationCommandType.fromJson(value.toJson()), equals(value));
      }
    });
  });
}
