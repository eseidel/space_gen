// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('ScannedSystem', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ScannedSystem(
        symbol: 'example',
        sectorSymbol: 'example',
        type: SystemType.neutronStar,
        x: 0,
        y: 0,
        distance: 0,
      );
      final parsed = ScannedSystem.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ScannedSystem.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ScannedSystem.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
