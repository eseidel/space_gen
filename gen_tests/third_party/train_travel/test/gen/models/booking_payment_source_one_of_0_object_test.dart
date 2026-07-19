// GENERATED — do not hand-edit.
import 'package:test/test.dart';
import 'package:train_travel/api.dart';

void main() {
  group('BookingPaymentSourceOneOf0Object', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = BookingPaymentSourceOneOf0Object.card;
      final parsed = BookingPaymentSourceOneOf0Object.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(BookingPaymentSourceOneOf0Object.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => BookingPaymentSourceOneOf0Object.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in BookingPaymentSourceOneOf0Object.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in BookingPaymentSourceOneOf0Object.values) {
        expect(
          BookingPaymentSourceOneOf0Object.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
