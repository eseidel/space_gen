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
class ProtectedBranchRequiredPullRequestReviewsBypassPullRequestAllowances {
  const ProtectedBranchRequiredPullRequestReviewsBypassPullRequestAllowances({
    required this.users,
    required this.teams,
    this.apps,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [ProtectedBranchRequiredPullRequestReviewsBypassPullRequestAllowances].
  factory ProtectedBranchRequiredPullRequestReviewsBypassPullRequestAllowances.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ProtectedBranchRequiredPullRequestReviewsBypassPullRequestAllowances',
      json,
      () =>
          ProtectedBranchRequiredPullRequestReviewsBypassPullRequestAllowances(
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
  static ProtectedBranchRequiredPullRequestReviewsBypassPullRequestAllowances?
  maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ProtectedBranchRequiredPullRequestReviewsBypassPullRequestAllowances.fromJson(
      json,
    );
  }

  final List<SimpleUser> users;
  final List<Team> teams;
  final List<Integration>? apps;

  /// Converts a [ProtectedBranchRequiredPullRequestReviewsBypassPullRequestAllowances]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'users': users.map((e) => e.toJson()).toList(),
      'teams': teams.map((e) => e.toJson()).toList(),
      'apps': ?apps?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([listHash(users), listHash(teams), listHash(apps)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is ProtectedBranchRequiredPullRequestReviewsBypassPullRequestAllowances &&
        listsEqual(users, other.users) &&
        listsEqual(teams, other.teams) &&
        listsEqual(apps, other.apps);
  }
}
