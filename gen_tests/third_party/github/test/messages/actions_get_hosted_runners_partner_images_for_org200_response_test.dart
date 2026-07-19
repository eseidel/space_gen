// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ActionsGetHostedRunnersPartnerImagesForOrg200Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ActionsGetHostedRunnersPartnerImagesForOrg200Response(
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
          ActionsGetHostedRunnersPartnerImagesForOrg200Response.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ActionsGetHostedRunnersPartnerImagesForOrg200Response.maybeFromJson(
          null,
        ),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () =>
            ActionsGetHostedRunnersPartnerImagesForOrg200Response.maybeFromJson(
              <String, dynamic>{},
            ),
        throwsFormatException,
      );
    });
  });
}
