// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('ScannedShipEngine', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ScannedShipEngine(symbol: 'example');
      final parsed = ScannedShipEngine.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ScannedShipEngine.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ScannedShipEngine.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
