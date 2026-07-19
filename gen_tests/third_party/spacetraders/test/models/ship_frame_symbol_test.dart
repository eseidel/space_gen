// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('ShipFrameSymbol', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ShipFrameSymbol.frameProbe;
      final parsed = ShipFrameSymbol.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ShipFrameSymbol.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ShipFrameSymbol.maybeFromJson('__invalid_enum_value__'),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in ShipFrameSymbol.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in ShipFrameSymbol.values) {
        expect(ShipFrameSymbol.fromJson(value.toJson()), equals(value));
      }
    });
  });
}
