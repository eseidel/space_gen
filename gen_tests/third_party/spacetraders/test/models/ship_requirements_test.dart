// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('ShipRequirements', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ShipRequirements();
      final parsed = ShipRequirements.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ShipRequirements.maybeFromJson(null), isNull);
    });
  });
}
