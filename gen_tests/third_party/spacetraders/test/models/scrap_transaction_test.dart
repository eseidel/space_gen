// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('ScrapTransaction', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ScrapTransaction(
        waypointSymbol: WaypointSymbol('example'),
        shipSymbol: 'example',
        totalPrice: 0,
        timestamp: DateTime.utc(2024),
      );
      final parsed = ScrapTransaction.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ScrapTransaction.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ScrapTransaction.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
