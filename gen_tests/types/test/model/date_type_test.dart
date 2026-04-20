// GENERATED — do not hand-edit.
import 'package:test/test.dart';
import 'package:types/api.dart';

void main() {
  group('DateType', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = DateType('example');
      final parsed = DateType.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(DateType.maybeFromJson(null), isNull);
    });
  });
}
