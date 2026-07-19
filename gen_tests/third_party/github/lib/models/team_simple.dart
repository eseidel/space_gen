import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template team_simple}
/// Team Simple
/// Groups of organization members that gives permissions on specified
/// repositories.
/// {@endtemplate}
@immutable
class TeamSimple {
  /// {@macro team_simple}
  const TeamSimple({
    required this.id,
    required this.nodeId,
    required this.url,
    required this.membersUrl,
    required this.name,
    required this.description,
    required this.permission,
    required this.htmlUrl,
    required this.repositoriesUrl,
    required this.slug,
    this.privacy,
    this.notificationSetting,
    this.ldapDn,
  });

  /// Converts a `Map<String, dynamic>` to a [TeamSimple].
  factory TeamSimple.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'TeamSimple',
      json,
      () => TeamSimple(
        id: json['id'] as int,
        nodeId: json['node_id'] as String,
        url: Uri.parse(json['url'] as String),
        membersUrl: json['members_url'] as String,
        name: json['name'] as String,
        description: checkedKey(json, 'description') as String?,
        permission: json['permission'] as String,
        privacy: json['privacy'] as String?,
        notificationSetting: json['notification_setting'] as String?,
        htmlUrl: Uri.parse(json['html_url'] as String),
        repositoriesUrl: Uri.parse(json['repositories_url'] as String),
        slug: json['slug'] as String,
        ldapDn: json['ldap_dn'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static TeamSimple? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return TeamSimple.fromJson(json);
  }

  /// Unique identifier of the team
  /// Example: `1`
  final int id;

  /// Example: `'MDQ6VGVhbTE='`
  final String nodeId;

  /// URL for the team
  /// Example: `'https://api.github.com/organizations/1/team/1'`
  final Uri url;

  /// Example:
  /// `'https://api.github.com/organizations/1/team/1/members{/member}'`
  final String membersUrl;

  /// Name of the team
  /// Example: `'Justice League'`
  final String name;

  /// Description of the team
  /// Example: `'A great team.'`
  final String? description;

  /// Permission that the team will have for its repositories
  /// Example: `'admin'`
  final String permission;

  /// The level of privacy this team should have
  /// Example: `'closed'`
  final String? privacy;

  /// The notification setting the team has set
  /// Example: `'notifications_enabled'`
  final String? notificationSetting;

  /// Example: `'https://github.com/orgs/rails/teams/core'`
  final Uri htmlUrl;

  /// Example: `'https://api.github.com/organizations/1/team/1/repos'`
  final Uri repositoriesUrl;

  /// Example: `'justice-league'`
  final String slug;

  /// Distinguished Name (DN) that team maps to within LDAP environment
  /// Example: `'uid=example,ou=users,dc=github,dc=com'`
  final String? ldapDn;

  /// Converts a [TeamSimple] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'node_id': nodeId,
      'url': url.toString(),
      'members_url': membersUrl,
      'name': name,
      'description': description,
      'permission': permission,
      'privacy': ?privacy,
      'notification_setting': ?notificationSetting,
      'html_url': htmlUrl.toString(),
      'repositories_url': repositoriesUrl.toString(),
      'slug': slug,
      'ldap_dn': ?ldapDn,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    nodeId,
    url,
    membersUrl,
    name,
    description,
    permission,
    privacy,
    notificationSetting,
    htmlUrl,
    repositoriesUrl,
    slug,
    ldapDn,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TeamSimple &&
        id == other.id &&
        nodeId == other.nodeId &&
        url == other.url &&
        membersUrl == other.membersUrl &&
        name == other.name &&
        description == other.description &&
        permission == other.permission &&
        privacy == other.privacy &&
        notificationSetting == other.notificationSetting &&
        htmlUrl == other.htmlUrl &&
        repositoriesUrl == other.repositoriesUrl &&
        slug == other.slug &&
        ldapDn == other.ldapDn;
  }
}
