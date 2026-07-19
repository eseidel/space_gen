import 'package:github/model_helpers.dart';
import 'package:github/models/team_full_notification_setting.dart';
import 'package:github/models/team_full_privacy.dart';
import 'package:github/models/team_organization.dart';
import 'package:github/models/team_simple.dart';
import 'package:meta/meta.dart';

/// {@template team_full}
/// Full Team
/// Groups of organization members that gives permissions on specified
/// repositories.
/// {@endtemplate}
@immutable
class TeamFull {
  /// {@macro team_full}
  const TeamFull({
    required this.id,
    required this.nodeId,
    required this.url,
    required this.htmlUrl,
    required this.name,
    required this.slug,
    required this.description,
    required this.permission,
    required this.membersUrl,
    required this.repositoriesUrl,
    required this.membersCount,
    required this.reposCount,
    required this.createdAt,
    required this.updatedAt,
    required this.organization,
    this.privacy,
    this.notificationSetting,
    this.parent,
    this.ldapDn,
  });

  /// Converts a `Map<String, dynamic>` to a [TeamFull].
  factory TeamFull.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'TeamFull',
      json,
      () => TeamFull(
        id: json['id'] as int,
        nodeId: json['node_id'] as String,
        url: Uri.parse(json['url'] as String),
        htmlUrl: Uri.parse(json['html_url'] as String),
        name: json['name'] as String,
        slug: json['slug'] as String,
        description: checkedKey(json, 'description') as String?,
        privacy: TeamFullPrivacy.maybeFromJson(json['privacy'] as String?),
        notificationSetting: TeamFullNotificationSetting.maybeFromJson(
          json['notification_setting'] as String?,
        ),
        permission: json['permission'] as String,
        membersUrl: json['members_url'] as String,
        repositoriesUrl: Uri.parse(json['repositories_url'] as String),
        parent: TeamSimple.maybeFromJson(
          json['parent'] as Map<String, dynamic>?,
        ),
        membersCount: json['members_count'] as int,
        reposCount: json['repos_count'] as int,
        createdAt: DateTime.parse(json['created_at'] as String),
        updatedAt: DateTime.parse(json['updated_at'] as String),
        organization: TeamOrganization.fromJson(
          json['organization'] as Map<String, dynamic>,
        ),
        ldapDn: json['ldap_dn'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static TeamFull? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return TeamFull.fromJson(json);
  }

  /// Unique identifier of the team
  /// Example: `42`
  final int id;

  /// Example: `'MDQ6VGVhbTE='`
  final String nodeId;

  /// URL for the team
  /// Example: `'https://api.github.com/organizations/1/team/1'`
  final Uri url;

  /// Example: `'https://github.com/orgs/rails/teams/core'`
  final Uri htmlUrl;

  /// Name of the team
  /// Example: `'Developers'`
  final String name;

  /// Example: `'justice-league'`
  final String slug;

  /// Example: `'A great team.'`
  final String? description;

  /// The level of privacy this team should have
  /// Example: `'closed'`
  final TeamFullPrivacy? privacy;

  /// The notification setting the team has set
  /// Example: `'notifications_enabled'`
  final TeamFullNotificationSetting? notificationSetting;

  /// Permission that the team will have for its repositories
  /// Example: `'push'`
  final String permission;

  /// Example:
  /// `'https://api.github.com/organizations/1/team/1/members{/member}'`
  final String membersUrl;

  /// Example: `'https://api.github.com/organizations/1/team/1/repos'`
  final Uri repositoriesUrl;

  /// Team Simple
  /// Groups of organization members that gives permissions on specified
  /// repositories.
  final TeamSimple? parent;

  /// Example: `3`
  final int membersCount;

  /// Example: `10`
  final int reposCount;

  /// Example: `'2017-07-14T16:53:42Z'`
  final DateTime createdAt;

  /// Example: `'2017-08-17T12:37:15Z'`
  final DateTime updatedAt;

  /// Team Organization
  /// Team Organization
  final TeamOrganization organization;

  /// Distinguished Name (DN) that team maps to within LDAP environment
  /// Example: `'uid=example,ou=users,dc=github,dc=com'`
  final String? ldapDn;

  /// Converts a [TeamFull] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'node_id': nodeId,
      'url': url.toString(),
      'html_url': htmlUrl.toString(),
      'name': name,
      'slug': slug,
      'description': description,
      'privacy': privacy?.toJson(),
      'notification_setting': notificationSetting?.toJson(),
      'permission': permission,
      'members_url': membersUrl,
      'repositories_url': repositoriesUrl.toString(),
      'parent': parent?.toJson(),
      'members_count': membersCount,
      'repos_count': reposCount,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'organization': organization.toJson(),
      'ldap_dn': ldapDn,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    nodeId,
    url,
    htmlUrl,
    name,
    slug,
    description,
    privacy,
    notificationSetting,
    permission,
    membersUrl,
    repositoriesUrl,
    parent,
    membersCount,
    reposCount,
    createdAt,
    updatedAt,
    organization,
    ldapDn,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TeamFull &&
        id == other.id &&
        nodeId == other.nodeId &&
        url == other.url &&
        htmlUrl == other.htmlUrl &&
        name == other.name &&
        slug == other.slug &&
        description == other.description &&
        privacy == other.privacy &&
        notificationSetting == other.notificationSetting &&
        permission == other.permission &&
        membersUrl == other.membersUrl &&
        repositoriesUrl == other.repositoriesUrl &&
        parent == other.parent &&
        membersCount == other.membersCount &&
        reposCount == other.reposCount &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        organization == other.organization &&
        ldapDn == other.ldapDn;
  }
}
