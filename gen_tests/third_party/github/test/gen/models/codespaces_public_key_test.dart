// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CodespacesPublicKey', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CodespacesPublicKey(
        keyId: '1234567',
        key: 'hBT5WZEj8ZoOv6TYJsfWq7MxTEQopZO5/IT3ZCVQPzs=',
      );
      final parsed = CodespacesPublicKey.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CodespacesPublicKey.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CodespacesPublicKey.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
