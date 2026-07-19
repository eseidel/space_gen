// GENERATED — do not hand-edit.
import 'package:backstage/api.dart';
import 'package:test/test.dart';

void main() {
  group('QueryEntitiesByPredicateRequestOrderByInnerOrder', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = QueryEntitiesByPredicateRequestOrderByInnerOrder.asc;
      final parsed =
          QueryEntitiesByPredicateRequestOrderByInnerOrder.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        QueryEntitiesByPredicateRequestOrderByInnerOrder.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => QueryEntitiesByPredicateRequestOrderByInnerOrder.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value
          in QueryEntitiesByPredicateRequestOrderByInnerOrder.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value
          in QueryEntitiesByPredicateRequestOrderByInnerOrder.values) {
        expect(
          QueryEntitiesByPredicateRequestOrderByInnerOrder.fromJson(
            value.toJson(),
          ),
          equals(value),
        );
      }
    });
  });
}
