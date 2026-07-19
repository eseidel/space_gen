// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('PurchaseCargo201ResponseData', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = PurchaseCargo201ResponseData(
        cargo: const ShipCargo(
          capacity: 0,
          units: 0,
          inventory: <ShipCargoItem>[
            ShipCargoItem(
              symbol: TradeSymbol.preciousStones,
              name: 'example',
              description: 'example',
              units: 1,
            ),
          ],
        ),
        transaction: MarketTransaction(
          waypointSymbol: WaypointSymbol('example'),
          shipSymbol: 'example',
          tradeSymbol: 'example',
          type: MarketTransactionType.purchase,
          units: 0,
          pricePerUnit: 0,
          totalPrice: 0,
          timestamp: DateTime.utc(2024),
        ),
        agent: const Agent(
          accountId: 'example',
          symbol: 'example',
          headquarters: 'example',
          credits: 0,
          startingFaction: 'example',
          shipCount: 0,
        ),
      );
      final parsed = PurchaseCargo201ResponseData.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(PurchaseCargo201ResponseData.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => PurchaseCargo201ResponseData.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
