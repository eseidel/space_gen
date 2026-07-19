// GENERATED — do not hand-edit.
import 'package:test/test.dart';
import 'package:train_travel/api.dart';

void main() {
  group('BookingPaymentCurrency', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = BookingPaymentCurrency.bam;
      final parsed = BookingPaymentCurrency.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(BookingPaymentCurrency.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => BookingPaymentCurrency.maybeFromJson('__invalid_enum_value__'),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in BookingPaymentCurrency.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in BookingPaymentCurrency.values) {
        expect(BookingPaymentCurrency.fromJson(value.toJson()), equals(value));
      }
    });
  });
}
