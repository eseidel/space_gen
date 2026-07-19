// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('SupplyConstructionRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = SupplyConstructionRequest(
        shipSymbol: 'DODO-1',
        tradeSymbol: TradeSymbol.preciousStones,
        units: 10,
      );
      final parsed = SupplyConstructionRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(SupplyConstructionRequest.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => SupplyConstructionRequest.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
