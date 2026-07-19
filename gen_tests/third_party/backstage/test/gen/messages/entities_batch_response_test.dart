// GENERATED — do not hand-edit.
import 'package:backstage/api.dart';
import 'package:test/test.dart';

void main() {
  group('EntitiesBatchResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = EntitiesBatchResponse(
        items: <NullableEntityAnyOf0>[
          NullableEntityAnyOf0(
            metadata: EntityMeta(name: 'example', entries: <String, dynamic>{}),
            kind: 'example',
            apiVersion: 'example',
          ),
        ],
      );
      final parsed = EntitiesBatchResponse.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(EntitiesBatchResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => EntitiesBatchResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
