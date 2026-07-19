// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('ShipEngineSymbol', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ShipEngineSymbol.engineImpulseDriveI;
      final parsed = ShipEngineSymbol.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ShipEngineSymbol.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ShipEngineSymbol.maybeFromJson('__invalid_enum_value__'),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in ShipEngineSymbol.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in ShipEngineSymbol.values) {
        expect(ShipEngineSymbol.fromJson(value.toJson()), equals(value));
      }
    });
  });
}
