// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ChecksListForRefFilter', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ChecksListForRefFilter.latest;
      final parsed = ChecksListForRefFilter.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ChecksListForRefFilter.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ChecksListForRefFilter.maybeFromJson('__invalid_enum_value__'),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in ChecksListForRefFilter.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in ChecksListForRefFilter.values) {
        expect(ChecksListForRefFilter.fromJson(value.toJson()), equals(value));
      }
    });
  });
}
