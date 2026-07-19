// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('ShipNav', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ShipNav(
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
      );
      final parsed = ShipNav.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ShipNav.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ShipNav.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
