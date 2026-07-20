// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('CreateShipWaypointScan201Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = CreateShipWaypointScan201Response(
        data: CreateShipWaypointScan201ResponseData(
          cooldown: Cooldown(
            shipSymbol: 'example',
            totalSeconds: 0,
            remainingSeconds: 0,
          ),
          waypoints: <ScannedWaypoint>[
            ScannedWaypoint(
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
            ),
          ],
        ),
      );
      final parsed = CreateShipWaypointScan201Response.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CreateShipWaypointScan201Response.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CreateShipWaypointScan201Response.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
