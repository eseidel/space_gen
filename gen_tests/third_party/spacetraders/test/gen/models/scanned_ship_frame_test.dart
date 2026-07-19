// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('ScannedShipFrame', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ScannedShipFrame(symbol: 'example');
      final parsed = ScannedShipFrame.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ScannedShipFrame.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ScannedShipFrame.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
