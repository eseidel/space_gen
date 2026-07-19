// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('ShipMountDepositsInner', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ShipMountDepositsInner.quartzSand;
      final parsed = ShipMountDepositsInner.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ShipMountDepositsInner.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ShipMountDepositsInner.maybeFromJson('__invalid_enum_value__'),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in ShipMountDepositsInner.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in ShipMountDepositsInner.values) {
        expect(ShipMountDepositsInner.fromJson(value.toJson()), equals(value));
      }
    });
  });
}
