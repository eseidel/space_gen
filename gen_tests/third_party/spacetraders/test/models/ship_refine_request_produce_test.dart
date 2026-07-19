// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('ShipRefineRequestProduce', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ShipRefineRequestProduce.iron;
      final parsed = ShipRefineRequestProduce.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ShipRefineRequestProduce.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ShipRefineRequestProduce.maybeFromJson('__invalid_enum_value__'),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in ShipRefineRequestProduce.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in ShipRefineRequestProduce.values) {
        expect(
          ShipRefineRequestProduce.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
