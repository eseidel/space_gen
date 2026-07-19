// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('ScannedShipReactor', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ScannedShipReactor(symbol: 'example');
      final parsed = ScannedShipReactor.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ScannedShipReactor.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ScannedShipReactor.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
