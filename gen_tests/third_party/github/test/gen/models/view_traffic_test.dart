// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ViewTraffic', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ViewTraffic(
        count: 14850,
        uniques: 3782,
        views: <Traffic>[
          Traffic(timestamp: DateTime.utc(2024), uniques: 0, count: 0),
        ],
      );
      final parsed = ViewTraffic.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ViewTraffic.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ViewTraffic.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
