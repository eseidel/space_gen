// GENERATED — do not hand-edit.
import 'package:backstage/api.dart';
import 'package:test/test.dart';

void main() {
  group('QueryEntitiesByPredicateRequestOrderByInner', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = QueryEntitiesByPredicateRequestOrderByInner(
        field: 'example',
        order: QueryEntitiesByPredicateRequestOrderByInnerOrder.asc,
      );
      final parsed = QueryEntitiesByPredicateRequestOrderByInner.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        QueryEntitiesByPredicateRequestOrderByInner.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => QueryEntitiesByPredicateRequestOrderByInner.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
