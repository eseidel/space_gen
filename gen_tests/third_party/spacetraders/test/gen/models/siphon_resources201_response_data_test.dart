// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('SiphonResources201ResponseData', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = SiphonResources201ResponseData(
        siphon: Siphon(
          shipSymbol: 'example',
          yield_: SiphonYield(symbol: TradeSymbol.preciousStones, units: 0),
        ),
        cooldown: Cooldown(
          shipSymbol: 'example',
          totalSeconds: 0,
          remainingSeconds: 0,
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
        events: <ShipConditionEvent>[
          ShipConditionEvent(
            symbol: ShipConditionEventSymbol.reactorOverload,
            component: ShipConditionEventComponent.frame,
            name: 'example',
            description: 'example',
          ),
        ],
      );
      final parsed = SiphonResources201ResponseData.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(SiphonResources201ResponseData.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => SiphonResources201ResponseData.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
