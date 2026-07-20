// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('ShipFuel', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ShipFuel(current: 0, capacity: 0);
      final parsed = ShipFuel.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ShipFuel.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ShipFuel.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
