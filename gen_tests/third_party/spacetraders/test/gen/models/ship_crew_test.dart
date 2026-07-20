// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('ShipCrew', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ShipCrew(
        current: 0,
        required_: 0,
        capacity: 0,
        morale: 0,
        wages: 0,
      );
      final parsed = ShipCrew.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ShipCrew.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ShipCrew.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
