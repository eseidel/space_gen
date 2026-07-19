// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ActionsSetGithubActionsPermissionsOrganizationRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ActionsSetGithubActionsPermissionsOrganizationRequest(
        enabledRepositories: EnabledRepositories.all,
      );
      final parsed =
          ActionsSetGithubActionsPermissionsOrganizationRequest.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ActionsSetGithubActionsPermissionsOrganizationRequest.maybeFromJson(
          null,
        ),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () =>
            ActionsSetGithubActionsPermissionsOrganizationRequest.maybeFromJson(
              <String, dynamic>{},
            ),
        throwsFormatException,
      );
    });
  });
}
