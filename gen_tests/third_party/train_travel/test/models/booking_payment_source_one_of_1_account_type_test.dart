// GENERATED — do not hand-edit.
import 'package:test/test.dart';
import 'package:train_travel/api.dart';

void main() {
  group('BookingPaymentSourceOneOf1AccountType', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = BookingPaymentSourceOneOf1AccountType.individual;
      final parsed = BookingPaymentSourceOneOf1AccountType.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(BookingPaymentSourceOneOf1AccountType.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => BookingPaymentSourceOneOf1AccountType.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in BookingPaymentSourceOneOf1AccountType.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in BookingPaymentSourceOneOf1AccountType.values) {
        expect(
          BookingPaymentSourceOneOf1AccountType.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
