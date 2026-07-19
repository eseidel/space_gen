// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('ShipRefine201Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ShipRefine201Response(
        data: ShipRefine201ResponseData(
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
          cooldown: Cooldown(
            shipSymbol: 'example',
            totalSeconds: 0,
            remainingSeconds: 0,
          ),
          produced: <ShipRefine201ResponseDataProducedInner>[
            ShipRefine201ResponseDataProducedInner(
              tradeSymbol: TradeSymbol.preciousStones,
              units: 0,
            ),
          ],
          consumed: <ShipRefine201ResponseDataConsumedInner>[
            ShipRefine201ResponseDataConsumedInner(
              tradeSymbol: TradeSymbol.preciousStones,
              units: 0,
            ),
          ],
        ),
      );
      final parsed = ShipRefine201Response.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ShipRefine201Response.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ShipRefine201Response.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
