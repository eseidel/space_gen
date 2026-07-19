// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('GetSystems200Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = GetSystems200Response(
        data: <System>[
          System(
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
                orbitals: const <WaypointOrbital>[
                  WaypointOrbital(symbol: 'example'),
                ],
              ),
            ],
            factions: const <SystemFaction>[
              SystemFaction(symbol: FactionSymbol.cosmic),
            ],
          ),
        ],
        meta: const Meta(total: 0, limit: 1),
      );
      final parsed = GetSystems200Response.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GetSystems200Response.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GetSystems200Response.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
