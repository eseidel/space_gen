// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ActionsCreateOrUpdateOrgSecretRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ActionsCreateOrUpdateOrgSecretRequest(
        encryptedValue: 'aaaa',
        keyId: 'example',
        visibility: ActionsCreateOrUpdateOrgSecretRequestVisibility.all,
      );
      final parsed = ActionsCreateOrUpdateOrgSecretRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ActionsCreateOrUpdateOrgSecretRequest.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ActionsCreateOrUpdateOrgSecretRequest.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
