// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('SupplyConstruction201ResponseData', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = SupplyConstruction201ResponseData(
        construction: Construction(
          symbol: 'example',
          materials: <ConstructionMaterial>[
            ConstructionMaterial(
              tradeSymbol: TradeSymbol.preciousStones,
              required_: 0,
              fulfilled: 0,
            ),
          ],
          isComplete: false,
        ),
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
      );
      final parsed = SupplyConstruction201ResponseData.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(SupplyConstruction201ResponseData.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => SupplyConstruction201ResponseData.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
