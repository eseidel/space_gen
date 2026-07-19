// GENERATED — do not hand-edit.
import 'package:petstore/api.dart';
import 'package:test/test.dart';

void main() {
  group('Category', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = Category();
      final parsed = Category.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(Category.maybeFromJson(null), isNull);
    });
  });
}
