// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('Faction', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = Faction(
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
      );
      final parsed = Faction.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(Faction.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => Faction.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
