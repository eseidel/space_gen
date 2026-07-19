// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ActionsListSelfHostedRunnerGroupsForOrg200Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ActionsListSelfHostedRunnerGroupsForOrg200Response(
        totalCount: 0,
        runnerGroups: <RunnerGroupsOrg>[
          RunnerGroupsOrg(
            id: 0,
            name: 'example',
            visibility: 'example',
            default_: false,
            runnersUrl: 'example',
            inherited: false,
            allowsPublicRepositories: false,
          ),
        ],
      );
      final parsed =
          ActionsListSelfHostedRunnerGroupsForOrg200Response.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ActionsListSelfHostedRunnerGroupsForOrg200Response.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ActionsListSelfHostedRunnerGroupsForOrg200Response.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
