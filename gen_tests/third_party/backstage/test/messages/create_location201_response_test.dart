// GENERATED — do not hand-edit.
import 'package:backstage/api.dart';
import 'package:test/test.dart';

void main() {
  group('CreateLocation201Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CreateLocation201Response(
        entities: <Entity>[
          Entity(
            metadata: EntityMeta(name: 'example', entries: <String, dynamic>{}),
            kind: 'example',
            apiVersion: 'example',
          ),
        ],
        location: Location(
          target: 'example',
          type: 'example',
          id: 'example',
          entityRef: 'example',
        ),
      );
      final parsed = CreateLocation201Response.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CreateLocation201Response.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CreateLocation201Response.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
