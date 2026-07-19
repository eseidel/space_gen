// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('ContractTerms', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ContractTerms(
        deadline: DateTime.utc(2024),
        payment: const ContractPayment(onAccepted: 0, onFulfilled: 0),
      );
      final parsed = ContractTerms.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ContractTerms.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ContractTerms.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
