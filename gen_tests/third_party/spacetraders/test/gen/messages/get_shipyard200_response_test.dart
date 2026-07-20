// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('GetShipyard200Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = GetShipyard200Response(
        data: Shipyard(
          symbol: 'example',
          shipTypes: const <ShipyardShipTypesInner>[
            ShipyardShipTypesInner(type: ShipType.shipProbe),
          ],
          modificationsFee: 0,
        ),
      );
      final parsed = GetShipyard200Response.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GetShipyard200Response.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GetShipyard200Response.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
