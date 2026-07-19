// GENERATED — do not hand-edit.
import 'package:backstage/api.dart';
import 'package:test/test.dart';

void main() {
  group('QueryEntityFacetsByPredicateRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = QueryEntityFacetsByPredicateRequest(
        facets: <String>['example'],
      );
      final parsed = QueryEntityFacetsByPredicateRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(QueryEntityFacetsByPredicateRequest.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => QueryEntityFacetsByPredicateRequest.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
