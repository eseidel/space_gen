import 'package:discord/api_exception.dart';
import 'package:discord/messages/github_check_pull_request.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/github_check_app.dart';
import 'package:meta/meta.dart';

@immutable
class GithubCheckSuite {
  GithubCheckSuite({
    required this.headSha,
    required this.app,
    this.conclusion,
    this.headBranch,
    this.pullRequests,
  }) {
    conclusion?.validate(maxLength: 152133);
    headBranch?.validate(maxLength: 152133);
    headSha.validate(maxLength: 152133);
    pullRequests?.validate(maxItems: 1521);
  }

  /// Converts a `Map<String, dynamic>` to a [GithubCheckSuite].
  factory GithubCheckSuite.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GithubCheckSuite',
      json,
      () => GithubCheckSuite(
        conclusion: json['conclusion'] as String?,
        headBranch: json['head_branch'] as String?,
        headSha: json['head_sha'] as String,
        pullRequests: (json['pull_requests'] as List?)
            ?.map<GithubCheckPullRequest>(
              (e) => GithubCheckPullRequest.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        app: GithubCheckApp.fromJson(json['app'] as Map<String, dynamic>),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GithubCheckSuite? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GithubCheckSuite.fromJson(json);
  }

  final String? conclusion;
  final String? headBranch;
  final String headSha;
  final List<GithubCheckPullRequest>? pullRequests;
  final GithubCheckApp app;

  /// Converts a [GithubCheckSuite] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'conclusion': conclusion,
      'head_branch': headBranch,
      'head_sha': headSha,
      'pull_requests': pullRequests?.map((e) => e.toJson()).toList(),
      'app': app.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    conclusion,
    headBranch,
    headSha,
    listHash(pullRequests),
    app,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GithubCheckSuite &&
        conclusion == other.conclusion &&
        headBranch == other.headBranch &&
        headSha == other.headSha &&
        listsEqual(pullRequests, other.pullRequests) &&
        app == other.app;
  }
}
