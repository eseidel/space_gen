// GENERATED — do not hand-edit.
import 'package:backstage/api.dart';
import 'package:test/test.dart';

void main() {
  group('EntityFacetsResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = EntityFacetsResponse(
        facets: {
          'key': <EntityFacet>[EntityFacet(value: 'example', count: 0)],
        },
      );
      final parsed = EntityFacetsResponse.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(EntityFacetsResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => EntityFacetsResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
