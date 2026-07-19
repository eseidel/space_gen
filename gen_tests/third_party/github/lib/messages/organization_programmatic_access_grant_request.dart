// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/organization_programmatic_access_grant_request_permissions.dart';
import 'package:github/models/organization_programmatic_access_grant_request_repository_selection.dart';
import 'package:github/models/simple_user.dart';
import 'package:meta/meta.dart';

/// {@template organization_programmatic_access_grant_request}
/// Simple Organization Programmatic Access Grant Request
/// Minimal representation of an organization programmatic access grant request
/// for enumerations
/// {@endtemplate}
@immutable
class OrganizationProgrammaticAccessGrantRequest {
  /// {@macro organization_programmatic_access_grant_request}
  const OrganizationProgrammaticAccessGrantRequest({
    required this.id,
    required this.reason,
    required this.owner,
    required this.repositorySelection,
    required this.repositoriesUrl,
    required this.permissions,
    required this.createdAt,
    required this.tokenId,
    required this.tokenName,
    required this.tokenExpired,
    required this.tokenExpiresAt,
    required this.tokenLastUsedAt,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [OrganizationProgrammaticAccessGrantRequest].
  factory OrganizationProgrammaticAccessGrantRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'OrganizationProgrammaticAccessGrantRequest',
      json,
      () => OrganizationProgrammaticAccessGrantRequest(
        id: json['id'] as int,
        reason: checkedKey(json, 'reason') as String?,
        owner: SimpleUser.fromJson(json['owner'] as Map<String, dynamic>),
        repositorySelection:
            OrganizationProgrammaticAccessGrantRequestRepositorySelection.fromJson(
              json['repository_selection'] as String,
            ),
        repositoriesUrl: json['repositories_url'] as String,
        permissions:
            OrganizationProgrammaticAccessGrantRequestPermissions.fromJson(
              json['permissions'] as Map<String, dynamic>,
            ),
        createdAt: json['created_at'] as String,
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
  static OrganizationProgrammaticAccessGrantRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return OrganizationProgrammaticAccessGrantRequest.fromJson(json);
  }

  /// Unique identifier of the request for access via fine-grained personal
  /// access token. The `pat_request_id` used to review PAT requests.
  final int id;

  /// Reason for requesting access.
  final String? reason;

  /// Simple User
  /// A GitHub user.
  final SimpleUser owner;

  /// Type of repository selection requested.
  final OrganizationProgrammaticAccessGrantRequestRepositorySelection
  repositorySelection;

  /// URL to the list of repositories requested to be accessed via
  /// fine-grained personal access token. Should only be followed when
  /// `repository_selection` is `subset`.
  final String repositoriesUrl;

  /// Permissions requested, categorized by type of permission.
  final OrganizationProgrammaticAccessGrantRequestPermissions permissions;

  /// Date and time when the request for access was created.
  final String createdAt;

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

  /// Converts an [OrganizationProgrammaticAccessGrantRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'reason': reason,
      'owner': owner.toJson(),
      'repository_selection': repositorySelection.toJson(),
      'repositories_url': repositoriesUrl,
      'permissions': permissions.toJson(),
      'created_at': createdAt,
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
    reason,
    owner,
    repositorySelection,
    repositoriesUrl,
    permissions,
    createdAt,
    tokenId,
    tokenName,
    tokenExpired,
    tokenExpiresAt,
    tokenLastUsedAt,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is OrganizationProgrammaticAccessGrantRequest &&
        id == other.id &&
        reason == other.reason &&
        owner == other.owner &&
        repositorySelection == other.repositorySelection &&
        repositoriesUrl == other.repositoriesUrl &&
        permissions == other.permissions &&
        createdAt == other.createdAt &&
        tokenId == other.tokenId &&
        tokenName == other.tokenName &&
        tokenExpired == other.tokenExpired &&
        tokenExpiresAt == other.tokenExpiresAt &&
        tokenLastUsedAt == other.tokenLastUsedAt;
  }
}
