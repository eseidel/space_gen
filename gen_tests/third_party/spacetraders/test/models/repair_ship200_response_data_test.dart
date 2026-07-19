// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('RepairShip200ResponseData', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = RepairShip200ResponseData(
        agent: const Agent(
          accountId: 'example',
          symbol: 'example',
          headquarters: 'example',
          credits: 0,
          startingFaction: 'example',
          shipCount: 0,
        ),
        ship: Ship(
          symbol: 'example',
          registration: const ShipRegistration(
            name: 'example',
            factionSymbol: 'example',
            role: ShipRole.fabricator,
          ),
          nav: ShipNav(
            systemSymbol: SystemSymbol('example'),
            waypointSymbol: WaypointSymbol('example'),
            route: ShipNavRoute(
              destination: ShipNavRouteWaypoint(
                symbol: 'example',
                type: WaypointType.planet,
                systemSymbol: SystemSymbol('example'),
                x: 0,
                y: 0,
              ),
              origin: ShipNavRouteWaypoint(
                symbol: 'example',
                type: WaypointType.planet,
                systemSymbol: SystemSymbol('example'),
                x: 0,
                y: 0,
              ),
              departureTime: DateTime.utc(2024),
              arrival: DateTime.utc(2024),
            ),
            status: ShipNavStatus.inTransit,
            flightMode: ShipNavFlightMode.drift,
          ),
          crew: const ShipCrew(
            current: 0,
            required_: 0,
            capacity: 0,
            morale: 0,
            wages: 0,
          ),
          frame: ShipFrame(
            symbol: ShipFrameSymbol.frameProbe,
            name: 'example',
            condition: ShipComponentCondition(0),
            integrity: ShipComponentIntegrity(0),
            description: 'example',
            moduleSlots: 0,
            mountingPoints: 0,
            fuelCapacity: 0,
            requirements: const ShipRequirements(),
            quality: const ShipComponentQuality(0),
          ),
          reactor: ShipReactor(
            symbol: ShipReactorSymbol.reactorSolarI,
            name: 'example',
            condition: ShipComponentCondition(0),
            integrity: ShipComponentIntegrity(0),
            description: 'example',
            powerOutput: 1,
            requirements: const ShipRequirements(),
            quality: const ShipComponentQuality(0),
          ),
          engine: ShipEngine(
            symbol: ShipEngineSymbol.engineImpulseDriveI,
            name: 'example',
            condition: ShipComponentCondition(0),
            integrity: ShipComponentIntegrity(0),
            description: 'example',
            speed: 1,
            requirements: const ShipRequirements(),
            quality: const ShipComponentQuality(0),
          ),
          modules: const <ShipModule>[
            ShipModule(
              symbol: ShipModuleSymbol.moduleMineralProcessorI,
              name: 'example',
              description: 'example',
              requirements: ShipRequirements(),
            ),
          ],
          mounts: const <ShipMount>[
            ShipMount(
              symbol: ShipMountSymbol.mountGasSiphonI,
              name: 'example',
              description: 'example',
              requirements: ShipRequirements(),
            ),
          ],
          cargo: const ShipCargo(
            capacity: 0,
            units: 0,
            inventory: <ShipCargoItem>[
              ShipCargoItem(
                symbol: TradeSymbol.preciousStones,
                name: 'example',
                description: 'example',
                units: 1,
              ),
            ],
          ),
          fuel: const ShipFuel(current: 0, capacity: 0),
          cooldown: const Cooldown(
            shipSymbol: 'example',
            totalSeconds: 0,
            remainingSeconds: 0,
          ),
        ),
        transaction: RepairTransaction(
          waypointSymbol: WaypointSymbol('example'),
          shipSymbol: 'example',
          totalPrice: 0,
          timestamp: DateTime.utc(2024),
        ),
      );
      final parsed = RepairShip200ResponseData.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(RepairShip200ResponseData.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => RepairShip200ResponseData.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
