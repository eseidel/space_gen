// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('GetMounts200Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = GetMounts200Response(
        data: <ShipMount>[
          ShipMount(
            symbol: ShipMountSymbol.mountGasSiphonI,
            name: 'example',
            description: 'example',
            requirements: const ShipRequirements(),
          ),
        ],
      );
      final parsed = GetMounts200Response.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GetMounts200Response.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GetMounts200Response.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
