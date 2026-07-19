import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template repos_update_branch_protection_request_restrictions}
/// Restrict who can push to the protected branch. User, app, and team
/// `restrictions` are only available for organization-owned repositories. Set
/// to `null` to disable.
/// {@endtemplate}
@immutable
class ReposUpdateBranchProtectionRequestRestrictions {
  /// {@macro repos_update_branch_protection_request_restrictions}
  const ReposUpdateBranchProtectionRequestRestrictions({
    required this.users,
    required this.teams,
    this.apps,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [ReposUpdateBranchProtectionRequestRestrictions].
  factory ReposUpdateBranchProtectionRequestRestrictions.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ReposUpdateBranchProtectionRequestRestrictions',
      json,
      () => ReposUpdateBranchProtectionRequestRestrictions(
        users: (json['users'] as List).cast<String>(),
        teams: (json['teams'] as List).cast<String>(),
        apps: (json['apps'] as List?)?.cast<String>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReposUpdateBranchProtectionRequestRestrictions? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ReposUpdateBranchProtectionRequestRestrictions.fromJson(json);
  }

  /// The list of user `login`s with push access
  final List<String> users;

  /// The list of team `slug`s with push access
  final List<String> teams;

  /// The list of app `slug`s with push access
  final List<String>? apps;

  /// Converts a [ReposUpdateBranchProtectionRequestRestrictions]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'users': users, 'teams': teams, 'apps': apps};
  }

  @override
  int get hashCode =>
      Object.hashAll([listHash(users), listHash(teams), listHash(apps)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReposUpdateBranchProtectionRequestRestrictions &&
        listsEqual(users, other.users) &&
        listsEqual(teams, other.teams) &&
        listsEqual(apps, other.apps);
  }
}
