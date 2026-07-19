import 'package:github/model_helpers.dart';
import 'package:github/models/organization_role.dart';
import 'package:meta/meta.dart';

@immutable
class OrgsListOrgRoles200Response {
  const OrgsListOrgRoles200Response({this.totalCount, this.roles});

  /// Converts a `Map<String, dynamic>` to an [OrgsListOrgRoles200Response].
  factory OrgsListOrgRoles200Response.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'OrgsListOrgRoles200Response',
      json,
      () => OrgsListOrgRoles200Response(
        totalCount: json['total_count'] as int?,
        roles: (json['roles'] as List?)
            ?.map<OrganizationRole>(
              (e) => OrganizationRole.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static OrgsListOrgRoles200Response? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return OrgsListOrgRoles200Response.fromJson(json);
  }

  /// The total number of organization roles available to the organization.
  final int? totalCount;

  /// The list of organization roles available to the organization.
  final List<OrganizationRole>? roles;

  /// Converts an [OrgsListOrgRoles200Response] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'total_count': totalCount,
      'roles': roles?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([totalCount, listHash(roles)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is OrgsListOrgRoles200Response &&
        totalCount == other.totalCount &&
        listsEqual(roles, other.roles);
  }
}
