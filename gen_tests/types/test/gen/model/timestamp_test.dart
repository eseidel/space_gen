// GENERATED — do not hand-edit.
import 'package:test/test.dart';
import 'package:types/api.dart';

void main() {
  group('Timestamp', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = Timestamp(DateTime.utc(2024));
      final parsed = Timestamp.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(Timestamp.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => Timestamp.maybeFromJson('not a date'),
        throwsFormatException,
      );
    });
  });
}
