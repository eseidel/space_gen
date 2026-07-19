// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('GetFactions200Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = GetFactions200Response(
        data: <Faction>[
          Faction(
            symbol: FactionSymbol.cosmic,
            name: 'example',
            description: 'example',
            traits: <FactionTrait>[
              FactionTrait(
                symbol: FactionTraitSymbol.bureaucratic,
                name: 'example',
                description: 'example',
              ),
            ],
            isRecruiting: false,
          ),
        ],
        meta: Meta(total: 0, limit: 1),
      );
      final parsed = GetFactions200Response.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GetFactions200Response.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GetFactions200Response.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
