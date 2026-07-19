// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('ShipyardShipTypesInner', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ShipyardShipTypesInner(type: ShipType.shipProbe);
      final parsed = ShipyardShipTypesInner.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ShipyardShipTypesInner.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ShipyardShipTypesInner.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
