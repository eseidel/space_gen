// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('ShipCargo', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ShipCargo(
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
      );
      final parsed = ShipCargo.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ShipCargo.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ShipCargo.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
