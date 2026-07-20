// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('OrgsCreateOrUpdateCustomPropertiesRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = OrgsCreateOrUpdateCustomPropertiesRequest(
        properties: <CustomProperty>[
          CustomProperty(
            propertyName: 'example',
            valueType: CustomPropertyValueType.string,
          ),
        ],
      );
      final parsed = OrgsCreateOrUpdateCustomPropertiesRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        OrgsCreateOrUpdateCustomPropertiesRequest.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => OrgsCreateOrUpdateCustomPropertiesRequest.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
