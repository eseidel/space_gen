// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('ShipEngine', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ShipEngine(
        symbol: ShipEngineSymbol.engineImpulseDriveI,
        name: 'example',
        condition: ShipComponentCondition(0),
        integrity: ShipComponentIntegrity(0),
        description: 'example',
        speed: 1,
        requirements: const ShipRequirements(),
        quality: const ShipComponentQuality(0),
      );
      final parsed = ShipEngine.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ShipEngine.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ShipEngine.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
