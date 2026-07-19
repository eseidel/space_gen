import 'package:github/model_helpers.dart';
import 'package:github/models/branch_restriction_policy_apps_inner.dart';
import 'package:github/models/branch_restriction_policy_teams_inner.dart';
import 'package:github/models/branch_restriction_policy_users_inner.dart';
import 'package:meta/meta.dart';

/// {@template branch_restriction_policy}
/// Branch Restriction Policy
/// Branch Restriction Policy
/// {@endtemplate}
@immutable
class BranchRestrictionPolicy {
  /// {@macro branch_restriction_policy}
  const BranchRestrictionPolicy({
    required this.url,
    required this.usersUrl,
    required this.teamsUrl,
    required this.appsUrl,
    required this.users,
    required this.teams,
    required this.apps,
  });

  /// Converts a `Map<String, dynamic>` to a [BranchRestrictionPolicy].
  factory BranchRestrictionPolicy.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'BranchRestrictionPolicy',
      json,
      () => BranchRestrictionPolicy(
        url: Uri.parse(json['url'] as String),
        usersUrl: Uri.parse(json['users_url'] as String),
        teamsUrl: Uri.parse(json['teams_url'] as String),
        appsUrl: Uri.parse(json['apps_url'] as String),
        users: (json['users'] as List)
            .map<BranchRestrictionPolicyUsersInner>(
              (e) => BranchRestrictionPolicyUsersInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
        teams: (json['teams'] as List)
            .map<BranchRestrictionPolicyTeamsInner>(
              (e) => BranchRestrictionPolicyTeamsInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
        apps: (json['apps'] as List)
            .map<BranchRestrictionPolicyAppsInner>(
              (e) => BranchRestrictionPolicyAppsInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static BranchRestrictionPolicy? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return BranchRestrictionPolicy.fromJson(json);
  }

  final Uri url;
  final Uri usersUrl;
  final Uri teamsUrl;
  final Uri appsUrl;
  final List<BranchRestrictionPolicyUsersInner> users;
  final List<BranchRestrictionPolicyTeamsInner> teams;
  final List<BranchRestrictionPolicyAppsInner> apps;

  /// Converts a [BranchRestrictionPolicy] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'url': url.toString(),
      'users_url': usersUrl.toString(),
      'teams_url': teamsUrl.toString(),
      'apps_url': appsUrl.toString(),
      'users': users.map((e) => e.toJson()).toList(),
      'teams': teams.map((e) => e.toJson()).toList(),
      'apps': apps.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    url,
    usersUrl,
    teamsUrl,
    appsUrl,
    listHash(users),
    listHash(teams),
    listHash(apps),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is BranchRestrictionPolicy &&
        url == other.url &&
        usersUrl == other.usersUrl &&
        teamsUrl == other.teamsUrl &&
        appsUrl == other.appsUrl &&
        listsEqual(users, other.users) &&
        listsEqual(teams, other.teams) &&
        listsEqual(apps, other.apps);
  }
}
