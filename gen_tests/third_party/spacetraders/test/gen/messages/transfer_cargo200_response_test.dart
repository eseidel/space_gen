// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('TransferCargo200Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = TransferCargo200Response(
        data: TransferCargo200ResponseData(
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
          targetCargo: ShipCargo(
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
        ),
      );
      final parsed = TransferCargo200Response.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(TransferCargo200Response.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => TransferCargo200Response.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
