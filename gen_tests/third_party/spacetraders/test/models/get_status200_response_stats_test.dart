// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('GetStatus200ResponseStats', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = GetStatus200ResponseStats(
        agents: 0,
        ships: 0,
        systems: 0,
        waypoints: 0,
      );
      final parsed = GetStatus200ResponseStats.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GetStatus200ResponseStats.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GetStatus200ResponseStats.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
