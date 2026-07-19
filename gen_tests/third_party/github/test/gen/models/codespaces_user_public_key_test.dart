// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CodespacesUserPublicKey', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CodespacesUserPublicKey(
        keyId: '1234567',
        key: 'hBT5WZEj8ZoOv6TYJsfWq7MxTEQopZO5/IT3ZCVQPzs=',
      );
      final parsed = CodespacesUserPublicKey.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CodespacesUserPublicKey.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CodespacesUserPublicKey.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
