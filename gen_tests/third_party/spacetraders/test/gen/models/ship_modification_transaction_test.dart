// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('ShipModificationTransaction', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ShipModificationTransaction(
        waypointSymbol: 'example',
        shipSymbol: 'example',
        tradeSymbol: 'example',
        totalPrice: 0,
        timestamp: DateTime.utc(2024),
      );
      final parsed = ShipModificationTransaction.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ShipModificationTransaction.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ShipModificationTransaction.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
