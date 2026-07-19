// GENERATED — do not hand-edit.
import 'package:test/test.dart';
import 'package:train_travel/api.dart';

void main() {
  group('BookingPaymentSourceOneOf1Object', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = BookingPaymentSourceOneOf1Object.bankAccount;
      final parsed = BookingPaymentSourceOneOf1Object.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(BookingPaymentSourceOneOf1Object.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => BookingPaymentSourceOneOf1Object.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in BookingPaymentSourceOneOf1Object.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in BookingPaymentSourceOneOf1Object.values) {
        expect(
          BookingPaymentSourceOneOf1Object.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
