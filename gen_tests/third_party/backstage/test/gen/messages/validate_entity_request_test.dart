// GENERATED — do not hand-edit.
import 'package:backstage/api.dart';
import 'package:test/test.dart';

void main() {
  group('ValidateEntityRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ValidateEntityRequest(
        location: 'example',
        entity: {'key': <String, dynamic>{}},
      );
      final parsed = ValidateEntityRequest.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ValidateEntityRequest.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ValidateEntityRequest.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
