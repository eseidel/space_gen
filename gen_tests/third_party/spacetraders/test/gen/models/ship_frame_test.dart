// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('ShipFrame', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ShipFrame(
        symbol: ShipFrameSymbol.frameProbe,
        name: 'example',
        condition: ShipComponentCondition(0),
        integrity: ShipComponentIntegrity(0),
        description: 'example',
        moduleSlots: 0,
        mountingPoints: 0,
        fuelCapacity: 0,
        requirements: const ShipRequirements(),
        quality: const ShipComponentQuality(0),
      );
      final parsed = ShipFrame.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ShipFrame.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ShipFrame.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
