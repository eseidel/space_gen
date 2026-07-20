// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('ScrapShip200Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ScrapShip200Response(
        data: ScrapShip200ResponseData(
          agent: Agent(
            accountId: 'example',
            symbol: 'example',
            headquarters: 'example',
            credits: 0,
            startingFaction: 'example',
            shipCount: 0,
          ),
          transaction: ScrapTransaction(
            waypointSymbol: WaypointSymbol('example'),
            shipSymbol: 'example',
            totalPrice: 0,
            timestamp: DateTime.utc(2024),
          ),
        ),
      );
      final parsed = ScrapShip200Response.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ScrapShip200Response.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ScrapShip200Response.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
