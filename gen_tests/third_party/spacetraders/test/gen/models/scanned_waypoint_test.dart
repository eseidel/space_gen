// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('ScannedWaypoint', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ScannedWaypoint(
        symbol: WaypointSymbol('example'),
        type: WaypointType.planet,
        systemSymbol: SystemSymbol('example'),
        x: 0,
        y: 0,
        orbitals: <WaypointOrbital>[WaypointOrbital(symbol: 'example')],
        traits: const <WaypointTrait>[
          WaypointTrait(
            symbol: WaypointTraitSymbol.uncharted,
            name: 'example',
            description: 'example',
          ),
        ],
      );
      final parsed = ScannedWaypoint.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ScannedWaypoint.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ScannedWaypoint.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
