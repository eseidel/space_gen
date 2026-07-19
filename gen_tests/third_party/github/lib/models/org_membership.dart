import 'package:github/model_helpers.dart';
import 'package:github/models/org_membership_permissions.dart';
import 'package:github/models/org_membership_role.dart';
import 'package:github/models/org_membership_state.dart';
import 'package:github/models/organization_simple.dart';
import 'package:github/models/simple_user.dart';
import 'package:meta/meta.dart';

/// {@template org_membership}
/// Org Membership
/// Org Membership
/// {@endtemplate}
@immutable
class OrgMembership {
  /// {@macro org_membership}
  const OrgMembership({
    required this.url,
    required this.state,
    required this.role,
    required this.organizationUrl,
    required this.organization,
    required this.user,
    this.permissions,
  });

  /// Converts a `Map<String, dynamic>` to an [OrgMembership].
  factory OrgMembership.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'OrgMembership',
      json,
      () => OrgMembership(
        url: Uri.parse(json['url'] as String),
        state: OrgMembershipState.fromJson(json['state'] as String),
        role: OrgMembershipRole.fromJson(json['role'] as String),
        organizationUrl: Uri.parse(json['organization_url'] as String),
        organization: OrganizationSimple.fromJson(
          json['organization'] as Map<String, dynamic>,
        ),
        user: SimpleUser.maybeFromJson(
          checkedKey(json, 'user') as Map<String, dynamic>?,
        ),
        permissions: OrgMembershipPermissions.maybeFromJson(
          json['permissions'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static OrgMembership? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return OrgMembership.fromJson(json);
  }

  /// Example: `'https://api.github.com/orgs/octocat/memberships/defunkt'`
  final Uri url;

  /// The state of the member in the organization. The `pending` state
  /// indicates the user has not yet accepted an invitation.
  /// Example: `'active'`
  final OrgMembershipState state;

  /// The user's membership type in the organization.
  /// Example: `'admin'`
  final OrgMembershipRole role;

  /// Example: `'https://api.github.com/orgs/octocat'`
  final Uri organizationUrl;

  /// Organization Simple
  /// A GitHub organization.
  final OrganizationSimple organization;

  /// Simple User
  /// A GitHub user.
  final SimpleUser? user;
  final OrgMembershipPermissions? permissions;

  /// Converts an [OrgMembership] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'url': url.toString(),
      'state': state.toJson(),
      'role': role.toJson(),
      'organization_url': organizationUrl.toString(),
      'organization': organization.toJson(),
      'user': user?.toJson(),
      'permissions': ?permissions?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    url,
    state,
    role,
    organizationUrl,
    organization,
    user,
    permissions,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is OrgMembership &&
        url == other.url &&
        state == other.state &&
        role == other.role &&
        organizationUrl == other.organizationUrl &&
        organization == other.organization &&
        user == other.user &&
        permissions == other.permissions;
  }
}
