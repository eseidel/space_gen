// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('MarketTransaction', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = MarketTransaction(
        waypointSymbol: WaypointSymbol('example'),
        shipSymbol: 'example',
        tradeSymbol: 'example',
        type: MarketTransactionType.purchase,
        units: 0,
        pricePerUnit: 0,
        totalPrice: 0,
        timestamp: DateTime.utc(2024),
      );
      final parsed = MarketTransaction.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(MarketTransaction.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => MarketTransaction.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
