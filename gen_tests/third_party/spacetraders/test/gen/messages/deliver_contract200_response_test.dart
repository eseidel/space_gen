// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('DeliverContract200Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = DeliverContract200Response(
        data: DeliverContract200ResponseData(
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
          cargo: const ShipCargo(
            capacity: 0,
            units: 0,
            inventory: <ShipCargoItem>[
              ShipCargoItem(
                symbol: TradeSymbol.preciousStones,
                name: 'example',
                description: 'example',
                units: 1,
              ),
            ],
          ),
        ),
      );
      final parsed = DeliverContract200Response.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(DeliverContract200Response.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => DeliverContract200Response.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
