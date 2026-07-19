// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CheckSuiteStatus', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CheckSuiteStatus.queued;
      final parsed = CheckSuiteStatus.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CheckSuiteStatus.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CheckSuiteStatus.maybeFromJson('__invalid_enum_value__'),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in CheckSuiteStatus.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in CheckSuiteStatus.values) {
        expect(CheckSuiteStatus.fromJson(value.toJson()), equals(value));
      }
    });
  });
}
