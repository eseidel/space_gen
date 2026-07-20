// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('GetSystemWaypoints200Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = GetSystemWaypoints200Response(
        data: <Waypoint>[
          Waypoint(
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
            isUnderConstruction: false,
          ),
        ],
        meta: Meta(total: 0, limit: 1),
      );
      final parsed = GetSystemWaypoints200Response.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GetSystemWaypoints200Response.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GetSystemWaypoints200Response.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
