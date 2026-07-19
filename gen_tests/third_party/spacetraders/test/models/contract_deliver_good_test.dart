// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('ContractDeliverGood', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ContractDeliverGood(
        tradeSymbol: 'example',
        destinationSymbol: 'example',
        unitsRequired: 0,
        unitsFulfilled: 0,
      );
      final parsed = ContractDeliverGood.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ContractDeliverGood.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ContractDeliverGood.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
