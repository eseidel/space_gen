// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('PurchaseCargoRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = PurchaseCargoRequest(
        symbol: TradeSymbol.preciousStones,
        units: 1,
      );
      final parsed = PurchaseCargoRequest.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(PurchaseCargoRequest.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => PurchaseCargoRequest.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
