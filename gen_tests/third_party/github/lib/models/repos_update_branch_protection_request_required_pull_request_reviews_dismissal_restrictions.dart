// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template repos_update_branch_protection_request_required_pull_request_reviews_dismissal_restrictions}
/// Specify which users, teams, and apps can dismiss pull request reviews. Pass
/// an empty `dismissal_restrictions` object to disable. User and team
/// `dismissal_restrictions` are only available for organization-owned
/// repositories. Omit this parameter for personal repositories.
/// {@endtemplate}
@immutable
class ReposUpdateBranchProtectionRequestRequiredPullRequestReviewsDismissalRestrictions {
  /// {@macro repos_update_branch_protection_request_required_pull_request_reviews_dismissal_restrictions}
  const ReposUpdateBranchProtectionRequestRequiredPullRequestReviewsDismissalRestrictions({
    this.users,
    this.teams,
    this.apps,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [ReposUpdateBranchProtectionRequestRequiredPullRequestReviewsDismissalRestrictions].
  factory ReposUpdateBranchProtectionRequestRequiredPullRequestReviewsDismissalRestrictions.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ReposUpdateBranchProtectionRequestRequiredPullRequestReviewsDismissalRestrictions',
      json,
      () =>
          ReposUpdateBranchProtectionRequestRequiredPullRequestReviewsDismissalRestrictions(
            users: (json['users'] as List?)?.cast<String>(),
            teams: (json['teams'] as List?)?.cast<String>(),
            apps: (json['apps'] as List?)?.cast<String>(),
          ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReposUpdateBranchProtectionRequestRequiredPullRequestReviewsDismissalRestrictions?
  maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ReposUpdateBranchProtectionRequestRequiredPullRequestReviewsDismissalRestrictions.fromJson(
      json,
    );
  }

  /// The list of user `login`s with dismissal access
  final List<String>? users;

  /// The list of team `slug`s with dismissal access
  final List<String>? teams;

  /// The list of app `slug`s with dismissal access
  final List<String>? apps;

  /// Converts a [ReposUpdateBranchProtectionRequestRequiredPullRequestReviewsDismissalRestrictions]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (users != null) 'users': users,
      if (teams != null) 'teams': teams,
      if (apps != null) 'apps': apps,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([listHash(users), listHash(teams), listHash(apps)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is ReposUpdateBranchProtectionRequestRequiredPullRequestReviewsDismissalRestrictions &&
        listsEqual(users, other.users) &&
        listsEqual(teams, other.teams) &&
        listsEqual(apps, other.apps);
  }
}
