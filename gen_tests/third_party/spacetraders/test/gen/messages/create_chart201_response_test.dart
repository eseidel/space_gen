// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('CreateChart201Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = CreateChart201Response(
        data: CreateChart201ResponseData(
          chart: Chart(
            waypointSymbol: WaypointSymbol('example'),
            submittedBy: 'example',
            submittedOn: DateTime.utc(2024),
          ),
          waypoint: Waypoint(
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
          transaction: ChartTransaction(
            waypointSymbol: WaypointSymbol('example'),
            shipSymbol: 'example',
            totalPrice: 0,
            timestamp: DateTime.utc(2024),
          ),
          agent: Agent(
            accountId: 'example',
            symbol: 'example',
            headquarters: 'example',
            credits: 0,
            startingFaction: 'example',
            shipCount: 0,
          ),
        ),
      );
      final parsed = CreateChart201Response.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CreateChart201Response.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CreateChart201Response.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
