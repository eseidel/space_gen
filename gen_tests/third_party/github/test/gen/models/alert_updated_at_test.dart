// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('AlertUpdatedAt', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = AlertUpdatedAt(DateTime.utc(2024));
      final parsed = AlertUpdatedAt.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(AlertUpdatedAt.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => AlertUpdatedAt.maybeFromJson('not a date'),
        throwsFormatException,
      );
    });
  });
}
