// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('GpgKey', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = GpgKey(
        id: 3,
        primaryKeyId: 0,
        keyId: '3262EFF25BA0D270',
        publicKey: 'xsBNBFayYZ...',
        emails: const <GpgKeyEmailsInner>[GpgKeyEmailsInner()],
        subkeys: const <GpgKeySubkeysInner>[GpgKeySubkeysInner()],
        canSign: false,
        canEncryptComms: false,
        canEncryptStorage: false,
        canCertify: false,
        createdAt: DateTime.utc(2024),
        expiresAt: DateTime.utc(2024),
        revoked: false,
        rawKey: 'example',
      );
      final parsed = GpgKey.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GpgKey.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GpgKey.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
