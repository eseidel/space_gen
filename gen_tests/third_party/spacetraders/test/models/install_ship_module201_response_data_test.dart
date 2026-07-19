// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('InstallShipModule201ResponseData', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = InstallShipModule201ResponseData(
        agent: const Agent(
          accountId: 'example',
          symbol: 'example',
          headquarters: 'example',
          credits: 0,
          startingFaction: 'example',
          shipCount: 0,
        ),
        modules: const <ShipModule>[
          ShipModule(
            symbol: ShipModuleSymbol.moduleMineralProcessorI,
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
        transaction: ShipModificationTransaction(
          waypointSymbol: 'example',
          shipSymbol: 'example',
          tradeSymbol: 'example',
          totalPrice: 0,
          timestamp: DateTime.utc(2024),
        ),
      );
      final parsed = InstallShipModule201ResponseData.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(InstallShipModule201ResponseData.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () =>
            InstallShipModule201ResponseData.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
