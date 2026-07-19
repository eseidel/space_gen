// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ActionsGetHostedRunnersGithubOwnedImagesForOrg200Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance =
          ActionsGetHostedRunnersGithubOwnedImagesForOrg200Response(
            totalCount: 0,
            images: <ActionsHostedRunnerImage>[
              ActionsHostedRunnerImage(
                id: 'ubuntu-20.04',
                platform: 'linux-x64',
                sizeGb: 86,
                displayName: 'example',
                source: ActionsHostedRunnerImageSource.github,
              ),
            ],
          );
      final parsed =
          ActionsGetHostedRunnersGithubOwnedImagesForOrg200Response.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ActionsGetHostedRunnersGithubOwnedImagesForOrg200Response.maybeFromJson(
          null,
        ),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () =>
            ActionsGetHostedRunnersGithubOwnedImagesForOrg200Response.maybeFromJson(
              <String, dynamic>{},
            ),
        throwsFormatException,
      );
    });
  });
}
