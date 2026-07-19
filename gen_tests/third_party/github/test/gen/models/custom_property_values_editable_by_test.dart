// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CustomPropertyValuesEditableBy', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CustomPropertyValuesEditableBy.orgActors;
      final parsed = CustomPropertyValuesEditableBy.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CustomPropertyValuesEditableBy.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CustomPropertyValuesEditableBy.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in CustomPropertyValuesEditableBy.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in CustomPropertyValuesEditableBy.values) {
        expect(
          CustomPropertyValuesEditableBy.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
