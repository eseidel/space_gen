// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('ShipNavRouteWaypoint', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ShipNavRouteWaypoint(
        symbol: 'example',
        type: WaypointType.planet,
        systemSymbol: SystemSymbol('example'),
        x: 0,
        y: 0,
      );
      final parsed = ShipNavRouteWaypoint.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ShipNavRouteWaypoint.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ShipNavRouteWaypoint.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
