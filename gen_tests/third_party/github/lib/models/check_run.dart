import 'package:github/model_helpers.dart';
import 'package:github/models/check_run_check_suite.dart';
import 'package:github/models/check_run_conclusion.dart';
import 'package:github/models/check_run_output.dart';
import 'package:github/models/check_run_status.dart';
import 'package:github/models/deployment_simple.dart';
import 'package:github/models/integration.dart';
import 'package:github/models/pull_request_minimal.dart';
import 'package:meta/meta.dart';

/// {@template check_run}
/// CheckRun
/// A check performed on the code of a given code change
/// {@endtemplate}
@immutable
class CheckRun {
  /// {@macro check_run}
  const CheckRun({
    required this.id,
    required this.headSha,
    required this.nodeId,
    required this.externalId,
    required this.url,
    required this.htmlUrl,
    required this.detailsUrl,
    required this.status,
    required this.conclusion,
    required this.startedAt,
    required this.completedAt,
    required this.output,
    required this.name,
    required this.checkSuite,
    required this.app,
    required this.pullRequests,
    this.deployment,
  });

  /// Converts a `Map<String, dynamic>` to a [CheckRun].
  factory CheckRun.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CheckRun',
      json,
      () => CheckRun(
        id: json['id'] as int,
        headSha: json['head_sha'] as String,
        nodeId: json['node_id'] as String,
        externalId: checkedKey(json, 'external_id') as String?,
        url: json['url'] as String,
        htmlUrl: checkedKey(json, 'html_url') as String?,
        detailsUrl: checkedKey(json, 'details_url') as String?,
        status: CheckRunStatus.fromJson(json['status'] as String),
        conclusion: CheckRunConclusion.maybeFromJson(
          checkedKey(json, 'conclusion') as String?,
        ),
        startedAt: maybeParseDateTime(
          checkedKey(json, 'started_at') as String?,
        ),
        completedAt: maybeParseDateTime(
          checkedKey(json, 'completed_at') as String?,
        ),
        output: CheckRunOutput.fromJson(json['output'] as Map<String, dynamic>),
        name: json['name'] as String,
        checkSuite: CheckRunCheckSuite.maybeFromJson(
          checkedKey(json, 'check_suite') as Map<String, dynamic>?,
        ),
        app: Integration.maybeFromJson(
          checkedKey(json, 'app') as Map<String, dynamic>?,
        ),
        pullRequests: (json['pull_requests'] as List)
            .map<PullRequestMinimal>(
              (e) => PullRequestMinimal.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        deployment: DeploymentSimple.maybeFromJson(
          json['deployment'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CheckRun? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CheckRun.fromJson(json);
  }

  /// The id of the check.
  /// Example: `21`
  final int id;

  /// The SHA of the commit that is being checked.
  /// Example: `'009b8a3a9ccbb128af87f9b1c0f4c62e8a304f6d'`
  final String headSha;

  /// Example: `'MDg6Q2hlY2tSdW40'`
  final String nodeId;

  /// Example: `'42'`
  final String? externalId;

  /// Example:
  /// `'https://api.github.com/repos/github/hello-world/check-runs/4'`
  final String url;

  /// Example: `'https://github.com/github/hello-world/runs/4'`
  final String? htmlUrl;

  /// Example: `'https://example.com'`
  final String? detailsUrl;

  /// The phase of the lifecycle that the check is currently in. Statuses of
  /// waiting, requested, and pending are reserved for GitHub Actions check
  /// runs.
  /// Example: `'queued'`
  final CheckRunStatus status;

  /// Example: `'neutral'`
  final CheckRunConclusion? conclusion;

  /// Example: `'2018-05-04T01:14:52Z'`
  final DateTime? startedAt;

  /// Example: `'2018-05-04T01:14:52Z'`
  final DateTime? completedAt;
  final CheckRunOutput output;

  /// The name of the check.
  /// Example: `'test-coverage'`
  final String name;
  final CheckRunCheckSuite? checkSuite;

  /// GitHub app
  /// GitHub apps are a new way to extend GitHub. They can be installed
  /// directly on organizations and user accounts and granted access to
  /// specific repositories. They come with granular permissions and built-in
  /// webhooks. GitHub apps are first class actors within GitHub.
  final Integration? app;

  /// Pull requests that are open with a `head_sha` or `head_branch` that
  /// matches the check. The returned pull requests do not necessarily
  /// indicate pull requests that triggered the check.
  final List<PullRequestMinimal> pullRequests;

  /// Deployment
  /// A deployment created as the result of an Actions check run from a
  /// workflow that references an environment
  final DeploymentSimple? deployment;

  /// Converts a [CheckRun] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'head_sha': headSha,
      'node_id': nodeId,
      'external_id': externalId,
      'url': url,
      'html_url': htmlUrl,
      'details_url': detailsUrl,
      'status': status.toJson(),
      'conclusion': conclusion?.toJson(),
      'started_at': startedAt?.toIso8601String(),
      'completed_at': completedAt?.toIso8601String(),
      'output': output.toJson(),
      'name': name,
      'check_suite': checkSuite?.toJson(),
      'app': app?.toJson(),
      'pull_requests': pullRequests.map((e) => e.toJson()).toList(),
      if (deployment != null) 'deployment': deployment?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    headSha,
    nodeId,
    externalId,
    url,
    htmlUrl,
    detailsUrl,
    status,
    conclusion,
    startedAt,
    completedAt,
    output,
    name,
    checkSuite,
    app,
    listHash(pullRequests),
    deployment,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CheckRun &&
        id == other.id &&
        headSha == other.headSha &&
        nodeId == other.nodeId &&
        externalId == other.externalId &&
        url == other.url &&
        htmlUrl == other.htmlUrl &&
        detailsUrl == other.detailsUrl &&
        status == other.status &&
        conclusion == other.conclusion &&
        startedAt == other.startedAt &&
        completedAt == other.completedAt &&
        output == other.output &&
        name == other.name &&
        checkSuite == other.checkSuite &&
        app == other.app &&
        listsEqual(pullRequests, other.pullRequests) &&
        deployment == other.deployment;
  }
}
