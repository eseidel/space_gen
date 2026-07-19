// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ActionsListGithubHostedRunnersInGroupForOrg200Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ActionsListGithubHostedRunnersInGroupForOrg200Response(
        totalCount: 0,
        runners: <ActionsHostedRunner>[
          ActionsHostedRunner(
            id: 5,
            name: 'my-github-hosted-runner',
            imageDetails: ActionsHostedRunnerPoolImage(
              id: 'ubuntu-20.04',
              sizeGb: 86,
              displayName: 'example',
              source: ActionsHostedRunnerPoolImageSource.github,
            ),
            machineSizeDetails: ActionsHostedRunnerMachineSpec(
              id: '8-core',
              cpuCores: 8,
              memoryGb: 32,
              storageGb: 300,
            ),
            status: ActionsHostedRunnerStatus.ready,
            platform: 'linux-x64',
            publicIpEnabled: false,
          ),
        ],
      );
      final parsed =
          ActionsListGithubHostedRunnersInGroupForOrg200Response.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ActionsListGithubHostedRunnersInGroupForOrg200Response.maybeFromJson(
          null,
        ),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () =>
            ActionsListGithubHostedRunnersInGroupForOrg200Response.maybeFromJson(
              <String, dynamic>{},
            ),
        throwsFormatException,
      );
    });
  });
}
