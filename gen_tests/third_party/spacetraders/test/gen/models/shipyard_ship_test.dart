// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('ShipyardShip', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ShipyardShip(
        type: ShipType.shipProbe,
        name: 'example',
        description: 'example',
        supply: SupplyLevel.scarce,
        purchasePrice: 0,
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
        modules: <ShipModule>[
          ShipModule(
            symbol: ShipModuleSymbol.moduleMineralProcessorI,
            name: 'example',
            description: 'example',
            requirements: const ShipRequirements(),
          ),
        ],
        mounts: <ShipMount>[
          ShipMount(
            symbol: ShipMountSymbol.mountGasSiphonI,
            name: 'example',
            description: 'example',
            requirements: const ShipRequirements(),
          ),
        ],
        crew: const ShipyardShipCrew(required_: 0, capacity: 0),
      );
      final parsed = ShipyardShip.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ShipyardShip.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ShipyardShip.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
