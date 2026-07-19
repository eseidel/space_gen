// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('GlobalAdvisoryType', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = GlobalAdvisoryType.reviewed;
      final parsed = GlobalAdvisoryType.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GlobalAdvisoryType.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GlobalAdvisoryType.maybeFromJson('__invalid_enum_value__'),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in GlobalAdvisoryType.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in GlobalAdvisoryType.values) {
        expect(GlobalAdvisoryType.fromJson(value.toJson()), equals(value));
      }
    });
  });
}
