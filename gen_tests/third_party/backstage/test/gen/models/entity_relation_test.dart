// GENERATED — do not hand-edit.
import 'package:backstage/api.dart';
import 'package:test/test.dart';

void main() {
  group('EntityRelation', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = EntityRelation(targetRef: 'example', type: 'example');
      final parsed = EntityRelation.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(EntityRelation.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => EntityRelation.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
