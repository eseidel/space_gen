// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('RefuelShip200ResponseData', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = RefuelShip200ResponseData(
        agent: const Agent(
          accountId: 'example',
          symbol: 'example',
          headquarters: 'example',
          credits: 0,
          startingFaction: 'example',
          shipCount: 0,
        ),
        fuel: const ShipFuel(current: 0, capacity: 0),
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
      );
      final parsed = RefuelShip200ResponseData.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(RefuelShip200ResponseData.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => RefuelShip200ResponseData.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
