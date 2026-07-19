// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('ShipReactor', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ShipReactor(
        symbol: ShipReactorSymbol.reactorSolarI,
        name: 'example',
        condition: ShipComponentCondition(0),
        integrity: ShipComponentIntegrity(0),
        description: 'example',
        powerOutput: 1,
        requirements: const ShipRequirements(),
        quality: const ShipComponentQuality(0),
      );
      final parsed = ShipReactor.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ShipReactor.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ShipReactor.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
