// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('ShipComponentIntegrity', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ShipComponentIntegrity(0);
      final parsed = ShipComponentIntegrity.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ShipComponentIntegrity.maybeFromJson(null), isNull);
    });
  });
}
