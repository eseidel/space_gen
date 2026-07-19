// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ChecksCreateRequestOneOf0Status', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ChecksCreateRequestOneOf0Status.completed;
      final parsed = ChecksCreateRequestOneOf0Status.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ChecksCreateRequestOneOf0Status.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ChecksCreateRequestOneOf0Status.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in ChecksCreateRequestOneOf0Status.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in ChecksCreateRequestOneOf0Status.values) {
        expect(
          ChecksCreateRequestOneOf0Status.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
