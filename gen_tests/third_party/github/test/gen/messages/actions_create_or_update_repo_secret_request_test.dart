// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ActionsCreateOrUpdateRepoSecretRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ActionsCreateOrUpdateRepoSecretRequest(
        encryptedValue: 'aaaa',
        keyId: 'example',
      );
      final parsed = ActionsCreateOrUpdateRepoSecretRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ActionsCreateOrUpdateRepoSecretRequest.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ActionsCreateOrUpdateRepoSecretRequest.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
