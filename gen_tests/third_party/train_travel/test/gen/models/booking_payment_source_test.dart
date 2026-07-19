// GENERATED — do not hand-edit.
import 'package:test/test.dart';
import 'package:train_travel/api.dart';

void main() {
  group('BookingPaymentSource', () {
    test('Card round-trips via maybeFromJson/toJson', () {
      const instance = Card(
        name: 'Francis Bourgeois',
        number: '4242424242424242',
        cvc: '123',
        expMonth: 12,
        expYear: 2025,
        addressCountry: 'example',
      );
      final parsed = Card.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('BankAccount round-trips via maybeFromJson/toJson', () {
      const instance = BankAccount(
        name: 'example',
        number: 'example',
        accountType: BookingPaymentSourceOneOf1AccountType.individual,
        bankName: 'Starling Bank',
        country: 'example',
      );
      final parsed = BankAccount.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(BookingPaymentSource.maybeFromJson(null), isNull);
    });
  });
}
