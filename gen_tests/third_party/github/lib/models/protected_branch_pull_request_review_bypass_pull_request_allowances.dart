// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/integration.dart';
import 'package:github/models/simple_user.dart';
import 'package:github/models/team.dart';
import 'package:meta/meta.dart';

/// {@template protected_branch_pull_request_review_bypass_pull_request_allowances}
/// Allow specific users, teams, or apps to bypass pull request requirements.
/// {@endtemplate}
@immutable
class ProtectedBranchPullRequestReviewBypassPullRequestAllowances {
  /// {@macro protected_branch_pull_request_review_bypass_pull_request_allowances}
  const ProtectedBranchPullRequestReviewBypassPullRequestAllowances({
    this.users,
    this.teams,
    this.apps,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [ProtectedBranchPullRequestReviewBypassPullRequestAllowances].
  factory ProtectedBranchPullRequestReviewBypassPullRequestAllowances.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ProtectedBranchPullRequestReviewBypassPullRequestAllowances',
      json,
      () => ProtectedBranchPullRequestReviewBypassPullRequestAllowances(
        users: (json['users'] as List?)
            ?.map<SimpleUser>(
              (e) => SimpleUser.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        teams: (json['teams'] as List?)
            ?.map<Team>((e) => Team.fromJson(e as Map<String, dynamic>))
            .toList(),
        apps: (json['apps'] as List?)
            ?.map<Integration>(
              (e) => Integration.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ProtectedBranchPullRequestReviewBypassPullRequestAllowances?
  maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ProtectedBranchPullRequestReviewBypassPullRequestAllowances.fromJson(
      json,
    );
  }

  /// The list of users allowed to bypass pull request requirements.
  final List<SimpleUser>? users;

  /// The list of teams allowed to bypass pull request requirements.
  final List<Team>? teams;

  /// The list of apps allowed to bypass pull request requirements.
  final List<Integration>? apps;

  /// Converts a [ProtectedBranchPullRequestReviewBypassPullRequestAllowances]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (users != null) 'users': users?.map((e) => e.toJson()).toList(),
      if (teams != null) 'teams': teams?.map((e) => e.toJson()).toList(),
      if (apps != null) 'apps': apps?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([listHash(users), listHash(teams), listHash(apps)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is ProtectedBranchPullRequestReviewBypassPullRequestAllowances &&
        listsEqual(users, other.users) &&
        listsEqual(teams, other.teams) &&
        listsEqual(apps, other.apps);
  }
}
