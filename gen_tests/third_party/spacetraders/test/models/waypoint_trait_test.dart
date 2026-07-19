// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('WaypointTrait', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = WaypointTrait(
        symbol: WaypointTraitSymbol.uncharted,
        name: 'example',
        description: 'example',
      );
      final parsed = WaypointTrait.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(WaypointTrait.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => WaypointTrait.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
