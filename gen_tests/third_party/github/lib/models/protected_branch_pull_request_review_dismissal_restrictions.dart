// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/integration.dart';
import 'package:github/models/simple_user.dart';
import 'package:github/models/team.dart';
import 'package:meta/meta.dart';

@immutable
class ProtectedBranchPullRequestReviewDismissalRestrictions {
  const ProtectedBranchPullRequestReviewDismissalRestrictions({
    this.users,
    this.teams,
    this.apps,
    this.url,
    this.usersUrl,
    this.teamsUrl,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [ProtectedBranchPullRequestReviewDismissalRestrictions].
  factory ProtectedBranchPullRequestReviewDismissalRestrictions.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ProtectedBranchPullRequestReviewDismissalRestrictions',
      json,
      () => ProtectedBranchPullRequestReviewDismissalRestrictions(
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
        url: json['url'] as String?,
        usersUrl: json['users_url'] as String?,
        teamsUrl: json['teams_url'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ProtectedBranchPullRequestReviewDismissalRestrictions? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ProtectedBranchPullRequestReviewDismissalRestrictions.fromJson(json);
  }

  /// The list of users with review dismissal access.
  final List<SimpleUser>? users;

  /// The list of teams with review dismissal access.
  final List<Team>? teams;

  /// The list of apps with review dismissal access.
  final List<Integration>? apps;

  /// Example:
  /// `'"https://api.github.com/repos/the-org/an-org-repo/branches/master/protection/dismissal_restrictions"'`
  final String? url;

  /// Example:
  /// `'"https://api.github.com/repos/the-org/an-org-repo/branches/master/protection/dismissal_restrictions/users"'`
  final String? usersUrl;

  /// Example:
  /// `'"https://api.github.com/repos/the-org/an-org-repo/branches/master/protection/dismissal_restrictions/teams"'`
  final String? teamsUrl;

  /// Converts a [ProtectedBranchPullRequestReviewDismissalRestrictions]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'users': ?users?.map((e) => e.toJson()).toList(),
      'teams': ?teams?.map((e) => e.toJson()).toList(),
      'apps': ?apps?.map((e) => e.toJson()).toList(),
      'url': ?url,
      'users_url': ?usersUrl,
      'teams_url': ?teamsUrl,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    listHash(users),
    listHash(teams),
    listHash(apps),
    url,
    usersUrl,
    teamsUrl,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ProtectedBranchPullRequestReviewDismissalRestrictions &&
        listsEqual(users, other.users) &&
        listsEqual(teams, other.teams) &&
        listsEqual(apps, other.apps) &&
        url == other.url &&
        usersUrl == other.usersUrl &&
        teamsUrl == other.teamsUrl;
  }
}
