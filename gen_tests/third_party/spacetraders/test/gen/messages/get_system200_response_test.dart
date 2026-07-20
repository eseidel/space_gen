// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('GetSystem200Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = GetSystem200Response(
        data: System(
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
        ),
      );
      final parsed = GetSystem200Response.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GetSystem200Response.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GetSystem200Response.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
