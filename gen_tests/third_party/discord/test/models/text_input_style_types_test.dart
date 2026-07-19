// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('TextInputStyleTypes', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = TextInputStyleTypes.short;
      final parsed = TextInputStyleTypes.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(TextInputStyleTypes.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => TextInputStyleTypes.maybeFromJson(-1),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in TextInputStyleTypes.values) {
        expect(value.toString(), equals(value.toJson().toString()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in TextInputStyleTypes.values) {
        expect(TextInputStyleTypes.fromJson(value.toJson()), equals(value));
      }
    });
  });
}
