// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('GetContract200Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = GetContract200Response(
        data: Contract(
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
      final parsed = GetContract200Response.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GetContract200Response.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GetContract200Response.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
