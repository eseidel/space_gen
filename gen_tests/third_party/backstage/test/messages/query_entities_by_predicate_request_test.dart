// GENERATED — do not hand-edit.
import 'package:backstage/api.dart';
import 'package:test/test.dart';

void main() {
  group('QueryEntitiesByPredicateRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = QueryEntitiesByPredicateRequest();
      final parsed = QueryEntitiesByPredicateRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(QueryEntitiesByPredicateRequest.maybeFromJson(null), isNull);
    });
  });
}
