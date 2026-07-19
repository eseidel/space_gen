// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('ShipConditionEventSymbol', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ShipConditionEventSymbol.reactorOverload;
      final parsed = ShipConditionEventSymbol.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ShipConditionEventSymbol.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ShipConditionEventSymbol.maybeFromJson('__invalid_enum_value__'),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in ShipConditionEventSymbol.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in ShipConditionEventSymbol.values) {
        expect(
          ShipConditionEventSymbol.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
