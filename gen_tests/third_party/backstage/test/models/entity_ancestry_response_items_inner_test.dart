// GENERATED — do not hand-edit.
import 'package:backstage/api.dart';
import 'package:test/test.dart';

void main() {
  group('EntityAncestryResponseItemsInner', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = EntityAncestryResponseItemsInner(
        parentEntityRefs: <String>['example'],
        entity: Entity(
          metadata: EntityMeta(name: 'example', entries: <String, dynamic>{}),
          kind: 'example',
          apiVersion: 'example',
        ),
      );
      final parsed = EntityAncestryResponseItemsInner.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(EntityAncestryResponseItemsInner.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () =>
            EntityAncestryResponseItemsInner.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
