// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('ShipNavRoute', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ShipNavRoute(
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
      );
      final parsed = ShipNavRoute.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ShipNavRoute.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ShipNavRoute.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
