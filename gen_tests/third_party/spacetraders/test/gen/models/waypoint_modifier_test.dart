// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('WaypointModifier', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = WaypointModifier(
        symbol: WaypointModifierSymbol.stripped,
        name: 'example',
        description: 'example',
      );
      final parsed = WaypointModifier.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(WaypointModifier.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => WaypointModifier.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
