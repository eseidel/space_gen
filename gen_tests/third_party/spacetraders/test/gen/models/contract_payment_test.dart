// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('ContractPayment', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ContractPayment(onAccepted: 0, onFulfilled: 0);
      final parsed = ContractPayment.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ContractPayment.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ContractPayment.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
