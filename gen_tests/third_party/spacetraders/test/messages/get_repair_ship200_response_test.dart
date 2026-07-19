// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('GetRepairShip200Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = GetRepairShip200Response(
        data: GetRepairShip200ResponseData(
          transaction: RepairTransaction(
            waypointSymbol: WaypointSymbol('example'),
            shipSymbol: 'example',
            totalPrice: 0,
            timestamp: DateTime.utc(2024),
          ),
        ),
      );
      final parsed = GetRepairShip200Response.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GetRepairShip200Response.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GetRepairShip200Response.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
