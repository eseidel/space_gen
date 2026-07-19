// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CodespacesCreateForAuthenticatedUserRequest', () {
    test(
      'CodespacesCreateForAuthenticatedUserRequestOneOf0 round-trips via maybeFromJson/toJson',
      () {
        const instance = CodespacesCreateForAuthenticatedUserRequestOneOf0(
          repositoryId: 0,
        );
        final parsed =
            CodespacesCreateForAuthenticatedUserRequestOneOf0.maybeFromJson(
              instance.toJson(),
            )!;
        expect(parsed, equals(instance));
        expect(parsed.hashCode, equals(instance.hashCode));
      },
    );

    test(
      'CodespacesCreateForAuthenticatedUserRequestOneOf1 round-trips via maybeFromJson/toJson',
      () {
        const instance = CodespacesCreateForAuthenticatedUserRequestOneOf1(
          pullRequest:
              CodespacesCreateForAuthenticatedUserRequestOneOf1PullRequest(
                pullRequestNumber: 0,
                repositoryId: 0,
              ),
        );
        final parsed =
            CodespacesCreateForAuthenticatedUserRequestOneOf1.maybeFromJson(
              instance.toJson(),
            )!;
        expect(parsed, equals(instance));
        expect(parsed.hashCode, equals(instance.hashCode));
      },
    );

    test('maybeFromJson returns null on null input', () {
      expect(
        CodespacesCreateForAuthenticatedUserRequest.maybeFromJson(null),
        isNull,
      );
    });
  });
}
