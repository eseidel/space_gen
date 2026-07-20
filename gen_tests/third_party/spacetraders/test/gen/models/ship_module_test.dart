// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('ShipModule', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ShipModule(
        symbol: ShipModuleSymbol.moduleMineralProcessorI,
        name: 'example',
        description: 'example',
        requirements: const ShipRequirements(),
      );
      final parsed = ShipModule.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ShipModule.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ShipModule.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
