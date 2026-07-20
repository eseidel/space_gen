// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('ShipRegistration', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ShipRegistration(
        name: 'example',
        factionSymbol: 'example',
        role: ShipRole.fabricator,
      );
      final parsed = ShipRegistration.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ShipRegistration.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ShipRegistration.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
