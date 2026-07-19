// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('FactionTrait', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = FactionTrait(
        symbol: FactionTraitSymbol.bureaucratic,
        name: 'example',
        description: 'example',
      );
      final parsed = FactionTrait.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(FactionTrait.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => FactionTrait.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
