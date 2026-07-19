// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('ExtractResourcesWithSurvey201Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ExtractResourcesWithSurvey201Response(
        data: ExtractResourcesWithSurvey201ResponseData(
          extraction: Extraction(
            shipSymbol: 'example',
            yield_: ExtractionYield(
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
          events: <ShipConditionEvent>[
            ShipConditionEvent(
              symbol: ShipConditionEventSymbol.reactorOverload,
              component: ShipConditionEventComponent.frame,
              name: 'example',
              description: 'example',
            ),
          ],
        ),
      );
      final parsed = ExtractResourcesWithSurvey201Response.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ExtractResourcesWithSurvey201Response.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ExtractResourcesWithSurvey201Response.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
