// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('Traffic', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = Traffic(
        timestamp: DateTime.utc(2024),
        uniques: 0,
        count: 0,
      );
      final parsed = Traffic.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(Traffic.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => Traffic.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
