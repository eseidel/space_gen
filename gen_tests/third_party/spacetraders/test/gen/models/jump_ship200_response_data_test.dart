// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('JumpShip200ResponseData', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = JumpShip200ResponseData(
        nav: ShipNav(
          systemSymbol: SystemSymbol('example'),
          waypointSymbol: WaypointSymbol('example'),
          route: ShipNavRoute(
            destination: ShipNavRouteWaypoint(
              symbol: 'example',
              type: WaypointType.planet,
              systemSymbol: SystemSymbol('example'),
              x: 0,
              y: 0,
            ),
            origin: ShipNavRouteWaypoint(
              symbol: 'example',
              type: WaypointType.planet,
              systemSymbol: SystemSymbol('example'),
              x: 0,
              y: 0,
            ),
            departureTime: DateTime.utc(2024),
            arrival: DateTime.utc(2024),
          ),
          status: ShipNavStatus.inTransit,
          flightMode: ShipNavFlightMode.drift,
        ),
        cooldown: const Cooldown(
          shipSymbol: 'example',
          totalSeconds: 0,
          remainingSeconds: 0,
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
      final parsed = JumpShip200ResponseData.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(JumpShip200ResponseData.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => JumpShip200ResponseData.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
