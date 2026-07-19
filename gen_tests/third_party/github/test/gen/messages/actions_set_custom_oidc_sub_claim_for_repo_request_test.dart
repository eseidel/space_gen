// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ActionsSetCustomOidcSubClaimForRepoRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ActionsSetCustomOidcSubClaimForRepoRequest(
        useDefault: false,
      );
      final parsed = ActionsSetCustomOidcSubClaimForRepoRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ActionsSetCustomOidcSubClaimForRepoRequest.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ActionsSetCustomOidcSubClaimForRepoRequest.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
