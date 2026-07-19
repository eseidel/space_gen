// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ChecksCreateRequestOneOf1Status', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ChecksCreateRequestOneOf1Status.queued;
      final parsed = ChecksCreateRequestOneOf1Status.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ChecksCreateRequestOneOf1Status.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ChecksCreateRequestOneOf1Status.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in ChecksCreateRequestOneOf1Status.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in ChecksCreateRequestOneOf1Status.values) {
        expect(
          ChecksCreateRequestOneOf1Status.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
