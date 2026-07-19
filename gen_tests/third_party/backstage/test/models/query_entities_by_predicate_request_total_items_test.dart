// GENERATED — do not hand-edit.
import 'package:backstage/api.dart';
import 'package:test/test.dart';

void main() {
  group('QueryEntitiesByPredicateRequestTotalItems', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = QueryEntitiesByPredicateRequestTotalItems.include;
      final parsed = QueryEntitiesByPredicateRequestTotalItems.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        QueryEntitiesByPredicateRequestTotalItems.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => QueryEntitiesByPredicateRequestTotalItems.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in QueryEntitiesByPredicateRequestTotalItems.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in QueryEntitiesByPredicateRequestTotalItems.values) {
        expect(
          QueryEntitiesByPredicateRequestTotalItems.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
