// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ChecksListForSuiteParameter5', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ChecksListForSuiteParameter5.latest;
      final parsed = ChecksListForSuiteParameter5.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ChecksListForSuiteParameter5.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ChecksListForSuiteParameter5.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in ChecksListForSuiteParameter5.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in ChecksListForSuiteParameter5.values) {
        expect(
          ChecksListForSuiteParameter5.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
