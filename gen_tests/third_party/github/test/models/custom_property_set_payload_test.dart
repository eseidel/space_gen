// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CustomPropertySetPayload', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CustomPropertySetPayload(
        valueType: CustomPropertySetPayloadValueType.string,
      );
      final parsed = CustomPropertySetPayload.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CustomPropertySetPayload.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CustomPropertySetPayload.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
