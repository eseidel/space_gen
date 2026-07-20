// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('Shipyard', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = Shipyard(
        symbol: 'example',
        shipTypes: const <ShipyardShipTypesInner>[
          ShipyardShipTypesInner(type: ShipType.shipProbe),
        ],
        modificationsFee: 0,
      );
      final parsed = Shipyard.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(Shipyard.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => Shipyard.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
