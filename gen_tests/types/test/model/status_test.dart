// GENERATED — do not hand-edit.
import 'package:test/test.dart';
import 'package:types/api.dart';

void main() {
  group('Status', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = Status.values.first;
      final parsed = Status.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(Status.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => Status.maybeFromJson('__invalid_enum_value__'),
        throwsFormatException,
      );
    });
  });
}
