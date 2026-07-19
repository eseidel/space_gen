// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('ShipConditionEventComponent', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ShipConditionEventComponent.frame;
      final parsed = ShipConditionEventComponent.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ShipConditionEventComponent.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () =>
            ShipConditionEventComponent.maybeFromJson('__invalid_enum_value__'),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in ShipConditionEventComponent.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in ShipConditionEventComponent.values) {
        expect(
          ShipConditionEventComponent.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
