// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ActionsCreateOrUpdateEnvironmentSecretRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ActionsCreateOrUpdateEnvironmentSecretRequest(
        encryptedValue: 'aaaa',
        keyId: 'example',
      );
      final parsed =
          ActionsCreateOrUpdateEnvironmentSecretRequest.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ActionsCreateOrUpdateEnvironmentSecretRequest.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ActionsCreateOrUpdateEnvironmentSecretRequest.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
