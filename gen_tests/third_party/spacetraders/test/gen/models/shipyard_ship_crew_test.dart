// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('ShipyardShipCrew', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ShipyardShipCrew(required_: 0, capacity: 0);
      final parsed = ShipyardShipCrew.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ShipyardShipCrew.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ShipyardShipCrew.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
