// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('AvailableLocalesEnum', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = AvailableLocalesEnum.ar;
      final parsed = AvailableLocalesEnum.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(AvailableLocalesEnum.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => AvailableLocalesEnum.maybeFromJson('__invalid_enum_value__'),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in AvailableLocalesEnum.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in AvailableLocalesEnum.values) {
        expect(AvailableLocalesEnum.fromJson(value.toJson()), equals(value));
      }
    });
  });
}
