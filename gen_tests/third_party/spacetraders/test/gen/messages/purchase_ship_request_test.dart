// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('PurchaseShipRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = PurchaseShipRequest(
        shipType: ShipType.shipProbe,
        waypointSymbol: 'example',
      );
      final parsed = PurchaseShipRequest.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(PurchaseShipRequest.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => PurchaseShipRequest.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
