// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CustomPropertySetPayloadValuesEditableBy', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CustomPropertySetPayloadValuesEditableBy.orgActors;
      final parsed = CustomPropertySetPayloadValuesEditableBy.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        CustomPropertySetPayloadValuesEditableBy.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CustomPropertySetPayloadValuesEditableBy.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in CustomPropertySetPayloadValuesEditableBy.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in CustomPropertySetPayloadValuesEditableBy.values) {
        expect(
          CustomPropertySetPayloadValuesEditableBy.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
