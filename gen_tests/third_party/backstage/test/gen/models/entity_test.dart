// GENERATED — do not hand-edit.
import 'package:backstage/api.dart';
import 'package:test/test.dart';

void main() {
  group('Entity', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = Entity(
        metadata: EntityMeta(name: 'example', entries: <String, dynamic>{}),
        kind: 'example',
        apiVersion: 'example',
      );
      final parsed = Entity.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(Entity.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => Entity.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
