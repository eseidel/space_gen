// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('RepairTransaction', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = RepairTransaction(
        waypointSymbol: WaypointSymbol('example'),
        shipSymbol: 'example',
        totalPrice: 0,
        timestamp: DateTime.utc(2024),
      );
      final parsed = RepairTransaction.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(RepairTransaction.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => RepairTransaction.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
