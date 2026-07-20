// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('GetShipModules200Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = GetShipModules200Response(
        data: <ShipModule>[
          ShipModule(
            symbol: ShipModuleSymbol.moduleMineralProcessorI,
            name: 'example',
            description: 'example',
            requirements: const ShipRequirements(),
          ),
        ],
      );
      final parsed = GetShipModules200Response.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GetShipModules200Response.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GetShipModules200Response.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
