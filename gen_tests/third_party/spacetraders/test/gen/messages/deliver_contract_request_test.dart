// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('DeliverContractRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = DeliverContractRequest(
        shipSymbol: 'example',
        tradeSymbol: 'IRON_ORE',
        units: 10,
      );
      final parsed = DeliverContractRequest.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(DeliverContractRequest.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => DeliverContractRequest.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
