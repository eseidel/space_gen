// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('ShipMount', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ShipMount(
        symbol: ShipMountSymbol.mountGasSiphonI,
        name: 'example',
        description: 'example',
        requirements: ShipRequirements(),
      );
      final parsed = ShipMount.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ShipMount.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ShipMount.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
