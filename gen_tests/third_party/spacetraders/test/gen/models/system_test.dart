// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('System', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = System(
        symbol: 'example',
        sectorSymbol: 'example',
        type: SystemType.neutronStar,
        x: 0,
        y: 0,
        waypoints: <SystemWaypoint>[
          SystemWaypoint(
            symbol: WaypointSymbol('example'),
            type: WaypointType.planet,
            x: 0,
            y: 0,
            orbitals: <WaypointOrbital>[WaypointOrbital(symbol: 'example')],
          ),
        ],
        factions: const <SystemFaction>[
          SystemFaction(symbol: FactionSymbol.cosmic),
        ],
      );
      final parsed = System.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(System.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => System.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
