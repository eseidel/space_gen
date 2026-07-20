// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('GetContracts200Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = GetContracts200Response(
        data: <Contract>[
          Contract(
            id: 'example',
            factionSymbol: 'example',
            type: ContractType.procurement,
            terms: ContractTerms(
              deadline: DateTime.utc(2024),
              payment: const ContractPayment(onAccepted: 0, onFulfilled: 0),
            ),
            expiration: DateTime.utc(2024),
          ),
        ],
        meta: Meta(total: 0, limit: 1),
      );
      final parsed = GetContracts200Response.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GetContracts200Response.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GetContracts200Response.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
