// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('Waypoint', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = Waypoint(
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
      );
      final parsed = Waypoint.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(Waypoint.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => Waypoint.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
