// GENERATED — do not hand-edit.
import 'package:test/test.dart';
import 'package:types/api.dart';

void main() {
  group('Priority', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = Priority(1);
      final parsed = Priority.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(Priority.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(() => Priority.maybeFromJson(-1), throwsFormatException);
    });
  });
}
