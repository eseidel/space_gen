// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('AlertAutoDismissedAt', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = AlertAutoDismissedAt(DateTime.utc(2024));
      final parsed = AlertAutoDismissedAt.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(AlertAutoDismissedAt.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => AlertAutoDismissedAt.maybeFromJson('not a date'),
        throwsFormatException,
      );
    });
  });
}
