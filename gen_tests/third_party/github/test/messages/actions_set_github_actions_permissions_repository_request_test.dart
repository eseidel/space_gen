// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ActionsSetGithubActionsPermissionsRepositoryRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ActionsSetGithubActionsPermissionsRepositoryRequest(
        enabled: ActionsEnabled(false),
      );
      final parsed =
          ActionsSetGithubActionsPermissionsRepositoryRequest.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ActionsSetGithubActionsPermissionsRepositoryRequest.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ActionsSetGithubActionsPermissionsRepositoryRequest.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
