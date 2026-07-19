// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('NegotiateContract201ResponseData', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = NegotiateContract201ResponseData(
        contract: Contract(
          id: 'example',
          factionSymbol: 'example',
          type: ContractType.procurement,
          terms: ContractTerms(
            deadline: DateTime.utc(2024),
            payment: const ContractPayment(onAccepted: 0, onFulfilled: 0),
          ),
          expiration: DateTime.utc(2024),
        ),
      );
      final parsed = NegotiateContract201ResponseData.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(NegotiateContract201ResponseData.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () =>
            NegotiateContract201ResponseData.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
