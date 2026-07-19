// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('ChartTransaction', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ChartTransaction(
        waypointSymbol: WaypointSymbol('example'),
        shipSymbol: 'example',
        totalPrice: 0,
        timestamp: DateTime.utc(2024),
      );
      final parsed = ChartTransaction.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ChartTransaction.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ChartTransaction.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
