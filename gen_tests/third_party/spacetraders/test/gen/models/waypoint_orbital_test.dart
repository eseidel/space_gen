// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('WaypointOrbital', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = WaypointOrbital(symbol: 'example');
      final parsed = WaypointOrbital.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(WaypointOrbital.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => WaypointOrbital.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
