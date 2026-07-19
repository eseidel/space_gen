// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CustomProperty', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CustomProperty(
        propertyName: 'example',
        valueType: CustomPropertyValueType.string,
      );
      final parsed = CustomProperty.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CustomProperty.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CustomProperty.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
