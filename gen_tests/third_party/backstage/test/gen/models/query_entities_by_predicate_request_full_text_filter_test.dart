// GENERATED — do not hand-edit.
import 'package:backstage/api.dart';
import 'package:test/test.dart';

void main() {
  group('QueryEntitiesByPredicateRequestFullTextFilter', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = QueryEntitiesByPredicateRequestFullTextFilter();
      final parsed =
          QueryEntitiesByPredicateRequestFullTextFilter.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        QueryEntitiesByPredicateRequestFullTextFilter.maybeFromJson(null),
        isNull,
      );
    });
  });
}
