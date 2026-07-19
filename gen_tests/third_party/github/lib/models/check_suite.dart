import 'package:github/model_helpers.dart';
import 'package:github/models/check_suite_conclusion.dart';
import 'package:github/models/check_suite_status.dart';
import 'package:github/models/integration.dart';
import 'package:github/models/minimal_repository.dart';
import 'package:github/models/pull_request_minimal.dart';
import 'package:github/models/simple_commit.dart';
import 'package:meta/meta.dart';

/// {@template check_suite}
/// CheckSuite
/// A suite of checks performed on the code of a given code change
/// {@endtemplate}
@immutable
class CheckSuite {
  /// {@macro check_suite}
  const CheckSuite({
    required this.id,
    required this.nodeId,
    required this.headBranch,
    required this.headSha,
    required this.status,
    required this.conclusion,
    required this.url,
    required this.before,
    required this.after,
    required this.pullRequests,
    required this.app,
    required this.repository,
    required this.createdAt,
    required this.updatedAt,
    required this.headCommit,
    required this.latestCheckRunsCount,
    required this.checkRunsUrl,
    this.rerequestable,
    this.runsRerequestable,
  });

  /// Converts a `Map<String, dynamic>` to a [CheckSuite].
  factory CheckSuite.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CheckSuite',
      json,
      () => CheckSuite(
        id: json['id'] as int,
        nodeId: json['node_id'] as String,
        headBranch: checkedKey(json, 'head_branch') as String?,
        headSha: json['head_sha'] as String,
        status: CheckSuiteStatus.maybeFromJson(
          checkedKey(json, 'status') as String?,
        ),
        conclusion: CheckSuiteConclusion.maybeFromJson(
          checkedKey(json, 'conclusion') as String?,
        ),
        url: checkedKey(json, 'url') as String?,
        before: checkedKey(json, 'before') as String?,
        after: checkedKey(json, 'after') as String?,
        pullRequests: (checkedKey(json, 'pull_requests') as List?)
            ?.map<PullRequestMinimal>(
              (e) => PullRequestMinimal.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        app: Integration.maybeFromJson(
          checkedKey(json, 'app') as Map<String, dynamic>?,
        ),
        repository: MinimalRepository.fromJson(
          json['repository'] as Map<String, dynamic>,
        ),
        createdAt: maybeParseDateTime(
          checkedKey(json, 'created_at') as String?,
        ),
        updatedAt: maybeParseDateTime(
          checkedKey(json, 'updated_at') as String?,
        ),
        headCommit: SimpleCommit.fromJson(
          json['head_commit'] as Map<String, dynamic>,
        ),
        latestCheckRunsCount: json['latest_check_runs_count'] as int,
        checkRunsUrl: json['check_runs_url'] as String,
        rerequestable: json['rerequestable'] as bool?,
        runsRerequestable: json['runs_rerequestable'] as bool?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CheckSuite? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CheckSuite.fromJson(json);
  }

  /// Example: `5`
  final int id;

  /// Example: `'MDEwOkNoZWNrU3VpdGU1'`
  final String nodeId;

  /// Example: `'master'`
  final String? headBranch;

  /// The SHA of the head commit that is being checked.
  /// Example: `'009b8a3a9ccbb128af87f9b1c0f4c62e8a304f6d'`
  final String headSha;

  /// The phase of the lifecycle that the check suite is currently in.
  /// Statuses of waiting, requested, and pending are reserved for GitHub
  /// Actions check suites.
  /// Example: `'completed'`
  final CheckSuiteStatus? status;

  /// Example: `'neutral'`
  final CheckSuiteConclusion? conclusion;

  /// Example:
  /// `'https://api.github.com/repos/github/hello-world/check-suites/5'`
  final String? url;

  /// Example: `'146e867f55c26428e5f9fade55a9bbf5e95a7912'`
  final String? before;

  /// Example: `'d6fde92930d4715a2b49857d24b940956b26d2d3'`
  final String? after;
  final List<PullRequestMinimal>? pullRequests;

  /// GitHub app
  /// GitHub apps are a new way to extend GitHub. They can be installed
  /// directly on organizations and user accounts and granted access to
  /// specific repositories. They come with granular permissions and built-in
  /// webhooks. GitHub apps are first class actors within GitHub.
  final Integration? app;

  /// Minimal Repository
  /// Minimal Repository
  final MinimalRepository repository;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  /// Simple Commit
  /// A commit.
  final SimpleCommit headCommit;
  final int latestCheckRunsCount;
  final String checkRunsUrl;
  final bool? rerequestable;
  final bool? runsRerequestable;

  /// Converts a [CheckSuite] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'node_id': nodeId,
      'head_branch': headBranch,
      'head_sha': headSha,
      'status': status?.toJson(),
      'conclusion': conclusion?.toJson(),
      'url': url,
      'before': before,
      'after': after,
      'pull_requests': pullRequests?.map((e) => e.toJson()).toList(),
      'app': app?.toJson(),
      'repository': repository.toJson(),
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'head_commit': headCommit.toJson(),
      'latest_check_runs_count': latestCheckRunsCount,
      'check_runs_url': checkRunsUrl,
      'rerequestable': rerequestable,
      'runs_rerequestable': runsRerequestable,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    nodeId,
    headBranch,
    headSha,
    status,
    conclusion,
    url,
    before,
    after,
    listHash(pullRequests),
    app,
    repository,
    createdAt,
    updatedAt,
    headCommit,
    latestCheckRunsCount,
    checkRunsUrl,
    rerequestable,
    runsRerequestable,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CheckSuite &&
        id == other.id &&
        nodeId == other.nodeId &&
        headBranch == other.headBranch &&
        headSha == other.headSha &&
        status == other.status &&
        conclusion == other.conclusion &&
        url == other.url &&
        before == other.before &&
        after == other.after &&
        listsEqual(pullRequests, other.pullRequests) &&
        app == other.app &&
        repository == other.repository &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        headCommit == other.headCommit &&
        latestCheckRunsCount == other.latestCheckRunsCount &&
        checkRunsUrl == other.checkRunsUrl &&
        rerequestable == other.rerequestable &&
        runsRerequestable == other.runsRerequestable;
  }
}
