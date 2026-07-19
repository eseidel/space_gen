import 'package:github/model_helpers.dart';
import 'package:github/models/organization_programmatic_access_grant_permissions.dart';
import 'package:github/models/organization_programmatic_access_grant_repository_selection.dart';
import 'package:github/models/simple_user.dart';
import 'package:meta/meta.dart';

/// {@template organization_programmatic_access_grant}
/// Organization Programmatic Access Grant
/// Minimal representation of an organization programmatic access grant for
/// enumerations
/// {@endtemplate}
@immutable
class OrganizationProgrammaticAccessGrant {
  /// {@macro organization_programmatic_access_grant}
  const OrganizationProgrammaticAccessGrant({
    required this.id,
    required this.owner,
    required this.repositorySelection,
    required this.repositoriesUrl,
    required this.permissions,
    required this.accessGrantedAt,
    required this.tokenId,
    required this.tokenName,
    required this.tokenExpired,
    required this.tokenExpiresAt,
    required this.tokenLastUsedAt,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [OrganizationProgrammaticAccessGrant].
  factory OrganizationProgrammaticAccessGrant.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'OrganizationProgrammaticAccessGrant',
      json,
      () => OrganizationProgrammaticAccessGrant(
        id: json['id'] as int,
        owner: SimpleUser.fromJson(json['owner'] as Map<String, dynamic>),
        repositorySelection:
            OrganizationProgrammaticAccessGrantRepositorySelection.fromJson(
              json['repository_selection'] as String,
            ),
        repositoriesUrl: json['repositories_url'] as String,
        permissions: OrganizationProgrammaticAccessGrantPermissions.fromJson(
          json['permissions'] as Map<String, dynamic>,
        ),
        accessGrantedAt: json['access_granted_at'] as String,
        tokenId: json['token_id'] as int,
        tokenName: json['token_name'] as String,
        tokenExpired: json['token_expired'] as bool,
        tokenExpiresAt: checkedKey(json, 'token_expires_at') as String?,
        tokenLastUsedAt: checkedKey(json, 'token_last_used_at') as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static OrganizationProgrammaticAccessGrant? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return OrganizationProgrammaticAccessGrant.fromJson(json);
  }

  /// Unique identifier of the fine-grained personal access token grant. The
  /// `pat_id` used to get details about an approved fine-grained personal
  /// access token.
  final int id;

  /// Simple User
  /// A GitHub user.
  final SimpleUser owner;

  /// Type of repository selection requested.
  final OrganizationProgrammaticAccessGrantRepositorySelection
  repositorySelection;

  /// URL to the list of repositories the fine-grained personal access token
  /// can access. Only follow when `repository_selection` is `subset`.
  final String repositoriesUrl;

  /// Permissions requested, categorized by type of permission.
  final OrganizationProgrammaticAccessGrantPermissions permissions;

  /// Date and time when the fine-grained personal access token was approved
  /// to access the organization.
  final String accessGrantedAt;

  /// Unique identifier of the user's token. This field can also be found in
  /// audit log events and the organization's settings for their PAT grants.
  final int tokenId;

  /// The name given to the user's token. This field can also be found in an
  /// organization's settings page for Active Tokens.
  final String tokenName;

  /// Whether the associated fine-grained personal access token has expired.
  final bool tokenExpired;

  /// Date and time when the associated fine-grained personal access token
  /// expires.
  final String? tokenExpiresAt;

  /// Date and time when the associated fine-grained personal access token was
  /// last used for authentication.
  final String? tokenLastUsedAt;

  /// Converts an [OrganizationProgrammaticAccessGrant]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'owner': owner.toJson(),
      'repository_selection': repositorySelection.toJson(),
      'repositories_url': repositoriesUrl,
      'permissions': permissions.toJson(),
      'access_granted_at': accessGrantedAt,
      'token_id': tokenId,
      'token_name': tokenName,
      'token_expired': tokenExpired,
      'token_expires_at': tokenExpiresAt,
      'token_last_used_at': tokenLastUsedAt,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    owner,
    repositorySelection,
    repositoriesUrl,
    permissions,
    accessGrantedAt,
    tokenId,
    tokenName,
    tokenExpired,
    tokenExpiresAt,
    tokenLastUsedAt,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is OrganizationProgrammaticAccessGrant &&
        id == other.id &&
        owner == other.owner &&
        repositorySelection == other.repositorySelection &&
        repositoriesUrl == other.repositoriesUrl &&
        permissions == other.permissions &&
        accessGrantedAt == other.accessGrantedAt &&
        tokenId == other.tokenId &&
        tokenName == other.tokenName &&
        tokenExpired == other.tokenExpired &&
        tokenExpiresAt == other.tokenExpiresAt &&
        tokenLastUsedAt == other.tokenLastUsedAt;
  }
}
