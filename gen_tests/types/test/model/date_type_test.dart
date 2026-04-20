// GENERATED — do not hand-edit.
import 'package:test/test.dart';
import 'package:types/api.dart';

void main() {
  group('DateType', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = DateType(DateTime(2024));
      final parsed = DateType.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(DateType.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => DateType.maybeFromJson('not a date'),
        throwsFormatException,
      );
    });
  });
}
