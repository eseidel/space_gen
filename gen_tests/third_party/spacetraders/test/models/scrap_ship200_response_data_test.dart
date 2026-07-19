// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('ScrapShip200ResponseData', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ScrapShip200ResponseData(
        agent: const Agent(
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
      );
      final parsed = ScrapShip200ResponseData.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ScrapShip200ResponseData.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ScrapShip200ResponseData.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
