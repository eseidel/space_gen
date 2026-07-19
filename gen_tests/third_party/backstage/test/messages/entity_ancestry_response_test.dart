// GENERATED — do not hand-edit.
import 'package:backstage/api.dart';
import 'package:test/test.dart';

void main() {
  group('EntityAncestryResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = EntityAncestryResponse(
        items: <EntityAncestryResponseItemsInner>[
          EntityAncestryResponseItemsInner(
            parentEntityRefs: <String>['example'],
            entity: Entity(
              metadata: EntityMeta(
                name: 'example',
                entries: <String, dynamic>{},
              ),
              kind: 'example',
              apiVersion: 'example',
            ),
          ),
        ],
        rootEntityRef: 'example',
      );
      final parsed = EntityAncestryResponse.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(EntityAncestryResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => EntityAncestryResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
