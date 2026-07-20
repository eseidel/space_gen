// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('ExtractResources201ResponseData', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ExtractResources201ResponseData(
        extraction: Extraction(
          shipSymbol: 'example',
          yield_: const ExtractionYield(
            symbol: TradeSymbol.preciousStones,
            units: 0,
          ),
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
        events: const <ShipConditionEvent>[
          ShipConditionEvent(
            symbol: ShipConditionEventSymbol.reactorOverload,
            component: ShipConditionEventComponent.frame,
            name: 'example',
            description: 'example',
          ),
        ],
      );
      final parsed = ExtractResources201ResponseData.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ExtractResources201ResponseData.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () =>
            ExtractResources201ResponseData.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
