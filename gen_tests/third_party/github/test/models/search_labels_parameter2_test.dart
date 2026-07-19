// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('SearchLabelsParameter2', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = SearchLabelsParameter2.created;
      final parsed = SearchLabelsParameter2.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(SearchLabelsParameter2.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => SearchLabelsParameter2.maybeFromJson('__invalid_enum_value__'),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in SearchLabelsParameter2.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in SearchLabelsParameter2.values) {
        expect(SearchLabelsParameter2.fromJson(value.toJson()), equals(value));
      }
    });
  });
}
