// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('GetScrapShip200Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = GetScrapShip200Response(
        data: GetScrapShip200ResponseData(
          transaction: ScrapTransaction(
            waypointSymbol: WaypointSymbol('example'),
            shipSymbol: 'example',
            totalPrice: 0,
            timestamp: DateTime.utc(2024),
          ),
        ),
      );
      final parsed = GetScrapShip200Response.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GetScrapShip200Response.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GetScrapShip200Response.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
