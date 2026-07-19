// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/minimal_repository.dart';
import 'package:github/models/pull_request_minimal.dart';
import 'package:github/models/referenced_workflow.dart';
import 'package:github/models/simple_commit.dart';
import 'package:github/models/simple_user.dart';
import 'package:meta/meta.dart';

/// {@template workflow_run}
/// Workflow Run
/// An invocation of a workflow
/// {@endtemplate}
@immutable
class WorkflowRun {
  /// {@macro workflow_run}
  const WorkflowRun({
    required this.id,
    required this.nodeId,
    required this.headBranch,
    required this.headSha,
    required this.path,
    required this.runNumber,
    required this.event,
    required this.status,
    required this.conclusion,
    required this.workflowId,
    required this.url,
    required this.htmlUrl,
    required this.pullRequests,
    required this.createdAt,
    required this.updatedAt,
    required this.jobsUrl,
    required this.logsUrl,
    required this.checkSuiteUrl,
    required this.artifactsUrl,
    required this.cancelUrl,
    required this.rerunUrl,
    required this.workflowUrl,
    required this.headCommit,
    required this.repository,
    required this.headRepository,
    required this.displayTitle,
    this.name,
    this.checkSuiteId,
    this.checkSuiteNodeId,
    this.runAttempt,
    this.referencedWorkflows,
    this.actor,
    this.triggeringActor,
    this.runStartedAt,
    this.previousAttemptUrl,
    this.headRepositoryId,
  });

  /// Converts a `Map<String, dynamic>` to a [WorkflowRun].
  factory WorkflowRun.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'WorkflowRun',
      json,
      () => WorkflowRun(
        id: json['id'] as int,
        name: json['name'] as String?,
        nodeId: json['node_id'] as String,
        checkSuiteId: json['check_suite_id'] as int?,
        checkSuiteNodeId: json['check_suite_node_id'] as String?,
        headBranch: checkedKey(json, 'head_branch') as String?,
        headSha: json['head_sha'] as String,
        path: json['path'] as String,
        runNumber: json['run_number'] as int,
        runAttempt: json['run_attempt'] as int?,
        referencedWorkflows: (json['referenced_workflows'] as List?)
            ?.map<ReferencedWorkflow>(
              (e) => ReferencedWorkflow.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        event: json['event'] as String,
        status: checkedKey(json, 'status') as String?,
        conclusion: checkedKey(json, 'conclusion') as String?,
        workflowId: json['workflow_id'] as int,
        url: json['url'] as String,
        htmlUrl: json['html_url'] as String,
        pullRequests: (checkedKey(json, 'pull_requests') as List?)
            ?.map<PullRequestMinimal>(
              (e) => PullRequestMinimal.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        createdAt: DateTime.parse(json['created_at'] as String),
        updatedAt: DateTime.parse(json['updated_at'] as String),
        actor: SimpleUser.maybeFromJson(json['actor'] as Map<String, dynamic>?),
        triggeringActor: SimpleUser.maybeFromJson(
          json['triggering_actor'] as Map<String, dynamic>?,
        ),
        runStartedAt: maybeParseDateTime(json['run_started_at'] as String?),
        jobsUrl: json['jobs_url'] as String,
        logsUrl: json['logs_url'] as String,
        checkSuiteUrl: json['check_suite_url'] as String,
        artifactsUrl: json['artifacts_url'] as String,
        cancelUrl: json['cancel_url'] as String,
        rerunUrl: json['rerun_url'] as String,
        previousAttemptUrl: json['previous_attempt_url'] as String?,
        workflowUrl: json['workflow_url'] as String,
        headCommit: SimpleCommit.maybeFromJson(
          checkedKey(json, 'head_commit') as Map<String, dynamic>?,
        ),
        repository: MinimalRepository.fromJson(
          json['repository'] as Map<String, dynamic>,
        ),
        headRepository: MinimalRepository.fromJson(
          json['head_repository'] as Map<String, dynamic>,
        ),
        headRepositoryId: json['head_repository_id'] as int?,
        displayTitle: json['display_title'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static WorkflowRun? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return WorkflowRun.fromJson(json);
  }

  /// The ID of the workflow run.
  /// Example: `5`
  final int id;

  /// The name of the workflow run.
  /// Example: `'Build'`
  final String? name;

  /// Example: `'MDEwOkNoZWNrU3VpdGU1'`
  final String nodeId;

  /// The ID of the associated check suite.
  /// Example: `42`
  final int? checkSuiteId;

  /// The node ID of the associated check suite.
  /// Example: `'MDEwOkNoZWNrU3VpdGU0Mg=='`
  final String? checkSuiteNodeId;

  /// Example: `'master'`
  final String? headBranch;

  /// The SHA of the head commit that points to the version of the workflow
  /// being run.
  /// Example: `'009b8a3a9ccbb128af87f9b1c0f4c62e8a304f6d'`
  final String headSha;

  /// The full path of the workflow
  /// Example: `'octocat/octo-repo/.github/workflows/ci.yml@main'`
  final String path;

  /// The auto incrementing run number for the workflow run.
  /// Example: `106`
  final int runNumber;

  /// Attempt number of the run, 1 for first attempt and higher if the
  /// workflow was re-run.
  /// Example: `1`
  final int? runAttempt;
  final List<ReferencedWorkflow>? referencedWorkflows;

  /// Example: `'push'`
  final String event;

  /// Example: `'completed'`
  final String? status;

  /// Example: `'neutral'`
  final String? conclusion;

  /// The ID of the parent workflow.
  /// Example: `5`
  final int workflowId;

  /// The URL to the workflow run.
  /// Example:
  /// `'https://api.github.com/repos/github/hello-world/actions/runs/5'`
  final String url;

  /// Example: `'https://github.com/github/hello-world/suites/4'`
  final String htmlUrl;

  /// Pull requests that are open with a `head_sha` or `head_branch` that
  /// matches the workflow run. The returned pull requests do not necessarily
  /// indicate pull requests that triggered the run.
  final List<PullRequestMinimal>? pullRequests;
  final DateTime createdAt;
  final DateTime updatedAt;

  /// Simple User
  /// A GitHub user.
  final SimpleUser? actor;

  /// Simple User
  /// A GitHub user.
  final SimpleUser? triggeringActor;

  /// The start time of the latest run. Resets on re-run.
  final DateTime? runStartedAt;

  /// The URL to the jobs for the workflow run.
  /// Example:
  /// `'https://api.github.com/repos/github/hello-world/actions/runs/5/jobs'`
  final String jobsUrl;

  /// The URL to download the logs for the workflow run.
  /// Example:
  /// `'https://api.github.com/repos/github/hello-world/actions/runs/5/logs'`
  final String logsUrl;

  /// The URL to the associated check suite.
  /// Example:
  /// `'https://api.github.com/repos/github/hello-world/check-suites/12'`
  final String checkSuiteUrl;

  /// The URL to the artifacts for the workflow run.
  /// Example:
  /// `'https://api.github.com/repos/github/hello-world/actions/runs/5/rerun/artifacts'`
  final String artifactsUrl;

  /// The URL to cancel the workflow run.
  /// Example:
  /// `'https://api.github.com/repos/github/hello-world/actions/runs/5/cancel'`
  final String cancelUrl;

  /// The URL to rerun the workflow run.
  /// Example:
  /// `'https://api.github.com/repos/github/hello-world/actions/runs/5/rerun'`
  final String rerunUrl;

  /// The URL to the previous attempted run of this workflow, if one exists.
  /// Example:
  /// `'https://api.github.com/repos/github/hello-world/actions/runs/5/attempts/3'`
  final String? previousAttemptUrl;

  /// The URL to the workflow.
  /// Example:
  /// `'https://api.github.com/repos/github/hello-world/actions/workflows/main.yaml'`
  final String workflowUrl;

  /// Simple Commit
  /// A commit.
  final SimpleCommit? headCommit;

  /// Minimal Repository
  /// Minimal Repository
  final MinimalRepository repository;

  /// Minimal Repository
  /// Minimal Repository
  final MinimalRepository headRepository;

  /// Example: `5`
  final int? headRepositoryId;

  /// The event-specific title associated with the run or the run-name if set,
  /// or the value of `run-name` if it is set in the workflow.
  /// Example: `'Simple Workflow'`
  final String displayTitle;

  /// Converts a [WorkflowRun] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'node_id': nodeId,
      'check_suite_id': ?checkSuiteId,
      'check_suite_node_id': ?checkSuiteNodeId,
      'head_branch': headBranch,
      'head_sha': headSha,
      'path': path,
      'run_number': runNumber,
      'run_attempt': ?runAttempt,
      'referenced_workflows': referencedWorkflows
          ?.map((e) => e.toJson())
          .toList(),
      'event': event,
      'status': status,
      'conclusion': conclusion,
      'workflow_id': workflowId,
      'url': url,
      'html_url': htmlUrl,
      'pull_requests': pullRequests?.map((e) => e.toJson()).toList(),
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'actor': ?actor?.toJson(),
      'triggering_actor': ?triggeringActor?.toJson(),
      'run_started_at': ?runStartedAt?.toIso8601String(),
      'jobs_url': jobsUrl,
      'logs_url': logsUrl,
      'check_suite_url': checkSuiteUrl,
      'artifacts_url': artifactsUrl,
      'cancel_url': cancelUrl,
      'rerun_url': rerunUrl,
      'previous_attempt_url': previousAttemptUrl,
      'workflow_url': workflowUrl,
      'head_commit': headCommit?.toJson(),
      'repository': repository.toJson(),
      'head_repository': headRepository.toJson(),
      'head_repository_id': ?headRepositoryId,
      'display_title': displayTitle,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    name,
    nodeId,
    checkSuiteId,
    checkSuiteNodeId,
    headBranch,
    headSha,
    path,
    runNumber,
    runAttempt,
    listHash(referencedWorkflows),
    event,
    status,
    conclusion,
    workflowId,
    url,
    htmlUrl,
    listHash(pullRequests),
    createdAt,
    updatedAt,
    actor,
    triggeringActor,
    runStartedAt,
    jobsUrl,
    logsUrl,
    checkSuiteUrl,
    artifactsUrl,
    cancelUrl,
    rerunUrl,
    previousAttemptUrl,
    workflowUrl,
    headCommit,
    repository,
    headRepository,
    headRepositoryId,
    displayTitle,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is WorkflowRun &&
        id == other.id &&
        name == other.name &&
        nodeId == other.nodeId &&
        checkSuiteId == other.checkSuiteId &&
        checkSuiteNodeId == other.checkSuiteNodeId &&
        headBranch == other.headBranch &&
        headSha == other.headSha &&
        path == other.path &&
        runNumber == other.runNumber &&
        runAttempt == other.runAttempt &&
        listsEqual(referencedWorkflows, other.referencedWorkflows) &&
        event == other.event &&
        status == other.status &&
        conclusion == other.conclusion &&
        workflowId == other.workflowId &&
        url == other.url &&
        htmlUrl == other.htmlUrl &&
        listsEqual(pullRequests, other.pullRequests) &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        actor == other.actor &&
        triggeringActor == other.triggeringActor &&
        runStartedAt == other.runStartedAt &&
        jobsUrl == other.jobsUrl &&
        logsUrl == other.logsUrl &&
        checkSuiteUrl == other.checkSuiteUrl &&
        artifactsUrl == other.artifactsUrl &&
        cancelUrl == other.cancelUrl &&
        rerunUrl == other.rerunUrl &&
        previousAttemptUrl == other.previousAttemptUrl &&
        workflowUrl == other.workflowUrl &&
        headCommit == other.headCommit &&
        repository == other.repository &&
        headRepository == other.headRepository &&
        headRepositoryId == other.headRepositoryId &&
        displayTitle == other.displayTitle;
  }
}
