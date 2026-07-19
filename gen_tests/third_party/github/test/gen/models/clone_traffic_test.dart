// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CloneTraffic', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = CloneTraffic(
        count: 173,
        uniques: 128,
        clones: <Traffic>[
          Traffic(timestamp: DateTime.utc(2024), uniques: 0, count: 0),
        ],
      );
      final parsed = CloneTraffic.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CloneTraffic.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CloneTraffic.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
