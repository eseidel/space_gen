// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('DockShip200Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = DockShip200Response(
        data: DockShip200ResponseData(
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
        ),
      );
      final parsed = DockShip200Response.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(DockShip200Response.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => DockShip200Response.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
