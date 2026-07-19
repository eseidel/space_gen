// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('ShipComponentQuality', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ShipComponentQuality(0);
      final parsed = ShipComponentQuality.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ShipComponentQuality.maybeFromJson(null), isNull);
    });
  });
}
