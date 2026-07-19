// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('ShipReactorSymbol', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ShipReactorSymbol.reactorSolarI;
      final parsed = ShipReactorSymbol.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ShipReactorSymbol.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ShipReactorSymbol.maybeFromJson('__invalid_enum_value__'),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in ShipReactorSymbol.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in ShipReactorSymbol.values) {
        expect(ShipReactorSymbol.fromJson(value.toJson()), equals(value));
      }
    });
  });
}
