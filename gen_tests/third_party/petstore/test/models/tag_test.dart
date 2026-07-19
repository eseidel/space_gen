// GENERATED — do not hand-edit.
import 'package:petstore/api.dart';
import 'package:test/test.dart';

void main() {
  group('Tag', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = Tag();
      final parsed = Tag.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(Tag.maybeFromJson(null), isNull);
    });
  });
}
