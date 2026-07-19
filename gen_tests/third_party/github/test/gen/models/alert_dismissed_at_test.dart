// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('AlertDismissedAt', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = AlertDismissedAt(DateTime.utc(2024));
      final parsed = AlertDismissedAt.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(AlertDismissedAt.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => AlertDismissedAt.maybeFromJson('not a date'),
        throwsFormatException,
      );
    });
  });
}
