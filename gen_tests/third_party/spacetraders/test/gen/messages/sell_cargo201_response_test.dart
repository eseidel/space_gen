// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('SellCargo201Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = SellCargo201Response(
        data: SellCargo201ResponseData(
          cargo: ShipCargo(
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
          agent: Agent(
            accountId: 'example',
            symbol: 'example',
            headquarters: 'example',
            credits: 0,
            startingFaction: 'example',
            shipCount: 0,
          ),
        ),
      );
      final parsed = SellCargo201Response.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(SellCargo201Response.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => SellCargo201Response.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
