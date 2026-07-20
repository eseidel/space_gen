// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('InstallMount201ResponseData', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = InstallMount201ResponseData(
        agent: Agent(
          accountId: 'example',
          symbol: 'example',
          headquarters: 'example',
          credits: 0,
          startingFaction: 'example',
          shipCount: 0,
        ),
        mounts: <ShipMount>[
          ShipMount(
            symbol: ShipMountSymbol.mountGasSiphonI,
            name: 'example',
            description: 'example',
            requirements: const ShipRequirements(),
          ),
        ],
        cargo: ShipCargo(
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
      final parsed = InstallMount201ResponseData.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(InstallMount201ResponseData.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => InstallMount201ResponseData.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
