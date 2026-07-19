// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('ShipCargoItem', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ShipCargoItem(
        symbol: TradeSymbol.preciousStones,
        name: 'example',
        description: 'example',
        units: 1,
      );
      final parsed = ShipCargoItem.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ShipCargoItem.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ShipCargoItem.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
