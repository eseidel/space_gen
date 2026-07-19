// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ActionsListJobsForWorkflowRunAttempt200Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ActionsListJobsForWorkflowRunAttempt200Response(
        totalCount: 0,
        jobs: <Job>[
          Job(
            id: 21,
            runId: 5,
            runUrl:
                'https://api.github.com/repos/github/hello-world/actions/runs/5',
            nodeId: 'MDg6Q2hlY2tSdW40',
            headSha: '009b8a3a9ccbb128af87f9b1c0f4c62e8a304f6d',
            url:
                'https://api.github.com/repos/github/hello-world/actions/jobs/21',
            htmlUrl: 'https://github.com/github/hello-world/runs/4',
            status: JobStatus.queued,
            conclusion: JobConclusion.success,
            createdAt: DateTime.utc(2024),
            startedAt: DateTime.utc(2024),
            completedAt: DateTime.utc(2024),
            name: 'test-coverage',
            checkRunUrl:
                'https://api.github.com/repos/github/hello-world/check-runs/4',
            labels: const <String>['example'],
            runnerId: 1,
            runnerName: 'my runner',
            runnerGroupId: 2,
            runnerGroupName: 'my runner group',
            workflowName: 'Build',
            headBranch: 'main',
          ),
        ],
      );
      final parsed =
          ActionsListJobsForWorkflowRunAttempt200Response.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ActionsListJobsForWorkflowRunAttempt200Response.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ActionsListJobsForWorkflowRunAttempt200Response.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
