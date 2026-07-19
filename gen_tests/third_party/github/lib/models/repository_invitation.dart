import 'package:github/model_helpers.dart';
import 'package:github/models/minimal_repository.dart';
import 'package:github/models/repository_invitation_permissions.dart';
import 'package:github/models/simple_user.dart';
import 'package:meta/meta.dart';

/// {@template repository_invitation}
/// Repository Invitation
/// Repository invitations let you manage who you collaborate with.
/// {@endtemplate}
@immutable
class RepositoryInvitation {
  /// {@macro repository_invitation}
  const RepositoryInvitation({
    required this.id,
    required this.repository,
    required this.invitee,
    required this.inviter,
    required this.permissions,
    required this.createdAt,
    required this.url,
    required this.htmlUrl,
    required this.nodeId,
    this.expired,
  });

  /// Converts a `Map<String, dynamic>` to a [RepositoryInvitation].
  factory RepositoryInvitation.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RepositoryInvitation',
      json,
      () => RepositoryInvitation(
        id: json['id'] as int,
        repository: MinimalRepository.fromJson(
          json['repository'] as Map<String, dynamic>,
        ),
        invitee: SimpleUser.maybeFromJson(
          checkedKey(json, 'invitee') as Map<String, dynamic>?,
        ),
        inviter: SimpleUser.maybeFromJson(
          checkedKey(json, 'inviter') as Map<String, dynamic>?,
        ),
        permissions: RepositoryInvitationPermissions.fromJson(
          json['permissions'] as String,
        ),
        createdAt: DateTime.parse(json['created_at'] as String),
        expired: json['expired'] as bool?,
        url: json['url'] as String,
        htmlUrl: json['html_url'] as String,
        nodeId: json['node_id'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryInvitation? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return RepositoryInvitation.fromJson(json);
  }

  /// Unique identifier of the repository invitation.
  /// Example: `42`
  final int id;

  /// Minimal Repository
  /// Minimal Repository
  final MinimalRepository repository;

  /// Simple User
  /// A GitHub user.
  final SimpleUser? invitee;

  /// Simple User
  /// A GitHub user.
  final SimpleUser? inviter;

  /// The permission associated with the invitation.
  /// Example: `'read'`
  final RepositoryInvitationPermissions permissions;

  /// Example: `'2016-06-13T14:52:50-05:00'`
  final DateTime createdAt;

  /// Whether or not the invitation has expired
  final bool? expired;

  /// URL for the repository invitation
  /// Example: `'https://api.github.com/user/repository-invitations/1'`
  final String url;

  /// Example: `'https://github.com/octocat/Hello-World/invitations'`
  final String htmlUrl;
  final String nodeId;

  /// Converts a [RepositoryInvitation] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'repository': repository.toJson(),
      'invitee': invitee?.toJson(),
      'inviter': inviter?.toJson(),
      'permissions': permissions.toJson(),
      'created_at': createdAt.toIso8601String(),
      'expired': ?expired,
      'url': url,
      'html_url': htmlUrl,
      'node_id': nodeId,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    repository,
    invitee,
    inviter,
    permissions,
    createdAt,
    expired,
    url,
    htmlUrl,
    nodeId,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryInvitation &&
        id == other.id &&
        repository == other.repository &&
        invitee == other.invitee &&
        inviter == other.inviter &&
        permissions == other.permissions &&
        createdAt == other.createdAt &&
        expired == other.expired &&
        url == other.url &&
        htmlUrl == other.htmlUrl &&
        nodeId == other.nodeId;
  }
}
