// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('SystemWaypoint', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = SystemWaypoint(
        symbol: WaypointSymbol('example'),
        type: WaypointType.planet,
        x: 0,
        y: 0,
        orbitals: const <WaypointOrbital>[WaypointOrbital(symbol: 'example')],
      );
      final parsed = SystemWaypoint.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(SystemWaypoint.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => SystemWaypoint.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
