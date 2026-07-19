// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('ShipFuelConsumed', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ShipFuelConsumed(
        amount: 0,
        timestamp: DateTime.utc(2024),
      );
      final parsed = ShipFuelConsumed.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ShipFuelConsumed.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ShipFuelConsumed.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
