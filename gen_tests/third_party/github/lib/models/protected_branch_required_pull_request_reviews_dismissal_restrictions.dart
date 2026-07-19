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
class ProtectedBranchRequiredPullRequestReviewsDismissalRestrictions {
  const ProtectedBranchRequiredPullRequestReviewsDismissalRestrictions({
    required this.url,
    required this.usersUrl,
    required this.teamsUrl,
    required this.users,
    required this.teams,
    this.apps,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [ProtectedBranchRequiredPullRequestReviewsDismissalRestrictions].
  factory ProtectedBranchRequiredPullRequestReviewsDismissalRestrictions.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ProtectedBranchRequiredPullRequestReviewsDismissalRestrictions',
      json,
      () => ProtectedBranchRequiredPullRequestReviewsDismissalRestrictions(
        url: Uri.parse(json['url'] as String),
        usersUrl: Uri.parse(json['users_url'] as String),
        teamsUrl: Uri.parse(json['teams_url'] as String),
        users: (json['users'] as List)
            .map<SimpleUser>(
              (e) => SimpleUser.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        teams: (json['teams'] as List)
            .map<Team>((e) => Team.fromJson(e as Map<String, dynamic>))
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
  static ProtectedBranchRequiredPullRequestReviewsDismissalRestrictions?
  maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ProtectedBranchRequiredPullRequestReviewsDismissalRestrictions.fromJson(
      json,
    );
  }

  final Uri url;
  final Uri usersUrl;
  final Uri teamsUrl;
  final List<SimpleUser> users;
  final List<Team> teams;
  final List<Integration>? apps;

  /// Converts a [ProtectedBranchRequiredPullRequestReviewsDismissalRestrictions]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'url': url.toString(),
      'users_url': usersUrl.toString(),
      'teams_url': teamsUrl.toString(),
      'users': users.map((e) => e.toJson()).toList(),
      'teams': teams.map((e) => e.toJson()).toList(),
      if (apps != null) 'apps': apps?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    url,
    usersUrl,
    teamsUrl,
    listHash(users),
    listHash(teams),
    listHash(apps),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is ProtectedBranchRequiredPullRequestReviewsDismissalRestrictions &&
        url == other.url &&
        usersUrl == other.usersUrl &&
        teamsUrl == other.teamsUrl &&
        listsEqual(users, other.users) &&
        listsEqual(teams, other.teams) &&
        listsEqual(apps, other.apps);
  }
}
