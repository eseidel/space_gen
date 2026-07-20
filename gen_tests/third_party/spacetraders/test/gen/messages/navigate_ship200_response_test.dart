// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('NavigateShip200Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = NavigateShip200Response(
        data: NavigateShip200ResponseData(
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
          fuel: ShipFuel(current: 0, capacity: 0),
          events: const <ShipConditionEvent>[
            ShipConditionEvent(
              symbol: ShipConditionEventSymbol.reactorOverload,
              component: ShipConditionEventComponent.frame,
              name: 'example',
              description: 'example',
            ),
          ],
        ),
      );
      final parsed = NavigateShip200Response.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(NavigateShip200Response.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => NavigateShip200Response.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
