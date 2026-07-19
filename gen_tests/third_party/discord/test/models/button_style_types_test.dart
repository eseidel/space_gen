// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('ButtonStyleTypes', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ButtonStyleTypes.primary;
      final parsed = ButtonStyleTypes.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ButtonStyleTypes.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(() => ButtonStyleTypes.maybeFromJson(-1), throwsFormatException);
    });

    test('toString matches toJson for every value', () {
      for (final value in ButtonStyleTypes.values) {
        expect(value.toString(), equals(value.toJson().toString()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in ButtonStyleTypes.values) {
        expect(ButtonStyleTypes.fromJson(value.toJson()), equals(value));
      }
    });
  });
}
