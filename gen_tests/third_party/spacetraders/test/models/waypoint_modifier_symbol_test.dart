// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('WaypointModifierSymbol', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = WaypointModifierSymbol.stripped;
      final parsed = WaypointModifierSymbol.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(WaypointModifierSymbol.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => WaypointModifierSymbol.maybeFromJson('__invalid_enum_value__'),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in WaypointModifierSymbol.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in WaypointModifierSymbol.values) {
        expect(WaypointModifierSymbol.fromJson(value.toJson()), equals(value));
      }
    });
  });
}
