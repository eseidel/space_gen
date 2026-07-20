// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('GetFaction200Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = GetFaction200Response(
        data: Faction(
          symbol: FactionSymbol.cosmic,
          name: 'example',
          description: 'example',
          traits: const <FactionTrait>[
            FactionTrait(
              symbol: FactionTraitSymbol.bureaucratic,
              name: 'example',
              description: 'example',
            ),
          ],
          isRecruiting: false,
        ),
      );
      final parsed = GetFaction200Response.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GetFaction200Response.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GetFaction200Response.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
