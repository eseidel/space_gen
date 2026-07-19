import 'package:github/model_helpers.dart';
import 'package:github/models/job_conclusion.dart';
import 'package:github/models/job_status.dart';
import 'package:github/models/job_steps_inner.dart';
import 'package:meta/meta.dart';

/// {@template job}
/// Job
/// Information of a job execution in a workflow run
/// {@endtemplate}
@immutable
class Job {
  /// {@macro job}
  const Job({
    required this.id,
    required this.runId,
    required this.runUrl,
    required this.nodeId,
    required this.headSha,
    required this.url,
    required this.htmlUrl,
    required this.status,
    required this.conclusion,
    required this.createdAt,
    required this.startedAt,
    required this.completedAt,
    required this.name,
    required this.checkRunUrl,
    required this.labels,
    required this.runnerId,
    required this.runnerName,
    required this.runnerGroupId,
    required this.runnerGroupName,
    required this.workflowName,
    required this.headBranch,
    this.runAttempt,
    this.steps,
  });

  /// Converts a `Map<String, dynamic>` to a [Job].
  factory Job.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'Job',
      json,
      () => Job(
        id: json['id'] as int,
        runId: json['run_id'] as int,
        runUrl: json['run_url'] as String,
        runAttempt: json['run_attempt'] as int?,
        nodeId: json['node_id'] as String,
        headSha: json['head_sha'] as String,
        url: json['url'] as String,
        htmlUrl: checkedKey(json, 'html_url') as String?,
        status: JobStatus.fromJson(json['status'] as String),
        conclusion: JobConclusion.maybeFromJson(
          checkedKey(json, 'conclusion') as String?,
        ),
        createdAt: DateTime.parse(json['created_at'] as String),
        startedAt: DateTime.parse(json['started_at'] as String),
        completedAt: maybeParseDateTime(
          checkedKey(json, 'completed_at') as String?,
        ),
        name: json['name'] as String,
        steps: (json['steps'] as List?)
            ?.map<JobStepsInner>(
              (e) => JobStepsInner.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        checkRunUrl: json['check_run_url'] as String,
        labels: (json['labels'] as List).cast<String>(),
        runnerId: checkedKey(json, 'runner_id') as int?,
        runnerName: checkedKey(json, 'runner_name') as String?,
        runnerGroupId: checkedKey(json, 'runner_group_id') as int?,
        runnerGroupName: checkedKey(json, 'runner_group_name') as String?,
        workflowName: checkedKey(json, 'workflow_name') as String?,
        headBranch: checkedKey(json, 'head_branch') as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static Job? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return Job.fromJson(json);
  }

  /// The id of the job.
  /// Example: `21`
  final int id;

  /// The id of the associated workflow run.
  /// Example: `5`
  final int runId;

  /// Example:
  /// `'https://api.github.com/repos/github/hello-world/actions/runs/5'`
  final String runUrl;

  /// Attempt number of the associated workflow run, 1 for first attempt and
  /// higher if the workflow was re-run.
  /// Example: `1`
  final int? runAttempt;

  /// Example: `'MDg6Q2hlY2tSdW40'`
  final String nodeId;

  /// The SHA of the commit that is being run.
  /// Example: `'009b8a3a9ccbb128af87f9b1c0f4c62e8a304f6d'`
  final String headSha;

  /// Example:
  /// `'https://api.github.com/repos/github/hello-world/actions/jobs/21'`
  final String url;

  /// Example: `'https://github.com/github/hello-world/runs/4'`
  final String? htmlUrl;

  /// The phase of the lifecycle that the job is currently in.
  /// Example: `'queued'`
  final JobStatus status;

  /// The outcome of the job.
  /// Example: `'success'`
  final JobConclusion? conclusion;

  /// The time that the job created, in ISO 8601 format.
  /// Example: `'2019-08-08T08:00:00-07:00'`
  final DateTime createdAt;

  /// The time that the job started, in ISO 8601 format.
  /// Example: `'2019-08-08T08:00:00-07:00'`
  final DateTime startedAt;

  /// The time that the job finished, in ISO 8601 format.
  /// Example: `'2019-08-08T08:00:00-07:00'`
  final DateTime? completedAt;

  /// The name of the job.
  /// Example: `'test-coverage'`
  final String name;

  /// Steps in this job.
  final List<JobStepsInner>? steps;

  /// Example:
  /// `'https://api.github.com/repos/github/hello-world/check-runs/4'`
  final String checkRunUrl;

  /// Labels for the workflow job. Specified by the "runs_on" attribute in the
  /// action's workflow file.
  /// Example: `'self-hosted'`
  /// Example: `'foo'`
  /// Example: `'bar'`
  final List<String> labels;

  /// The ID of the runner to which this job has been assigned. (If a runner
  /// hasn't yet been assigned, this will be null.)
  /// Example: `1`
  final int? runnerId;

  /// The name of the runner to which this job has been assigned. (If a runner
  /// hasn't yet been assigned, this will be null.)
  /// Example: `'my runner'`
  final String? runnerName;

  /// The ID of the runner group to which this job has been assigned. (If a
  /// runner hasn't yet been assigned, this will be null.)
  /// Example: `2`
  final int? runnerGroupId;

  /// The name of the runner group to which this job has been assigned. (If a
  /// runner hasn't yet been assigned, this will be null.)
  /// Example: `'my runner group'`
  final String? runnerGroupName;

  /// The name of the workflow.
  /// Example: `'Build'`
  final String? workflowName;

  /// The name of the current branch.
  /// Example: `'main'`
  final String? headBranch;

  /// Converts a [Job] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'run_id': runId,
      'run_url': runUrl,
      'run_attempt': runAttempt,
      'node_id': nodeId,
      'head_sha': headSha,
      'url': url,
      'html_url': htmlUrl,
      'status': status.toJson(),
      'conclusion': conclusion?.toJson(),
      'created_at': createdAt.toIso8601String(),
      'started_at': startedAt.toIso8601String(),
      'completed_at': completedAt?.toIso8601String(),
      'name': name,
      'steps': steps?.map((e) => e.toJson()).toList(),
      'check_run_url': checkRunUrl,
      'labels': labels,
      'runner_id': runnerId,
      'runner_name': runnerName,
      'runner_group_id': runnerGroupId,
      'runner_group_name': runnerGroupName,
      'workflow_name': workflowName,
      'head_branch': headBranch,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    runId,
    runUrl,
    runAttempt,
    nodeId,
    headSha,
    url,
    htmlUrl,
    status,
    conclusion,
    createdAt,
    startedAt,
    completedAt,
    name,
    listHash(steps),
    checkRunUrl,
    listHash(labels),
    runnerId,
    runnerName,
    runnerGroupId,
    runnerGroupName,
    workflowName,
    headBranch,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Job &&
        id == other.id &&
        runId == other.runId &&
        runUrl == other.runUrl &&
        runAttempt == other.runAttempt &&
        nodeId == other.nodeId &&
        headSha == other.headSha &&
        url == other.url &&
        htmlUrl == other.htmlUrl &&
        status == other.status &&
        conclusion == other.conclusion &&
        createdAt == other.createdAt &&
        startedAt == other.startedAt &&
        completedAt == other.completedAt &&
        name == other.name &&
        listsEqual(steps, other.steps) &&
        checkRunUrl == other.checkRunUrl &&
        listsEqual(labels, other.labels) &&
        runnerId == other.runnerId &&
        runnerName == other.runnerName &&
        runnerGroupId == other.runnerGroupId &&
        runnerGroupName == other.runnerGroupName &&
        workflowName == other.workflowName &&
        headBranch == other.headBranch;
  }
}
