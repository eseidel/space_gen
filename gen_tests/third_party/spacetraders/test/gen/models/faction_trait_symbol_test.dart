// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('FactionTraitSymbol', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = FactionTraitSymbol.bureaucratic;
      final parsed = FactionTraitSymbol.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(FactionTraitSymbol.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => FactionTraitSymbol.maybeFromJson('__invalid_enum_value__'),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in FactionTraitSymbol.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in FactionTraitSymbol.values) {
        expect(FactionTraitSymbol.fromJson(value.toJson()), equals(value));
      }
    });
  });
}
