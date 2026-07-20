// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('TransferCargoRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = TransferCargoRequest(
        tradeSymbol: TradeSymbol.preciousStones,
        units: 1,
        shipSymbol: 'example',
      );
      final parsed = TransferCargoRequest.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(TransferCargoRequest.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => TransferCargoRequest.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
