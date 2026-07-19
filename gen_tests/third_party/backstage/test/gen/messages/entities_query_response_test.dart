// GENERATED — do not hand-edit.
import 'package:backstage/api.dart';
import 'package:test/test.dart';

void main() {
  group('EntitiesQueryResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = EntitiesQueryResponse(
        items: <Entity>[
          Entity(
            metadata: EntityMeta(name: 'example', entries: <String, dynamic>{}),
            kind: 'example',
            apiVersion: 'example',
          ),
        ],
        totalItems: 0,
        pageInfo: EntitiesQueryResponsePageInfo(),
      );
      final parsed = EntitiesQueryResponse.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(EntitiesQueryResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => EntitiesQueryResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
