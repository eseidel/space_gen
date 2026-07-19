// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('GetRepairShip200ResponseData', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = GetRepairShip200ResponseData(
        transaction: RepairTransaction(
          waypointSymbol: WaypointSymbol('example'),
          shipSymbol: 'example',
          totalPrice: 0,
          timestamp: DateTime.utc(2024),
        ),
      );
      final parsed = GetRepairShip200ResponseData.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GetRepairShip200ResponseData.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GetRepairShip200ResponseData.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
