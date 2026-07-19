import 'package:github/model_helpers.dart';
import 'package:github/models/orgs_set_membership_for_user_request_role.dart';
import 'package:meta/meta.dart';

@immutable
class OrgsSetMembershipForUserRequest {
  const OrgsSetMembershipForUserRequest({
    this.role = OrgsSetMembershipForUserRequestRole.member,
  });

  /// Converts a `Map<String, dynamic>` to an [OrgsSetMembershipForUserRequest].
  factory OrgsSetMembershipForUserRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'OrgsSetMembershipForUserRequest',
      json,
      () => OrgsSetMembershipForUserRequest(
        role:
            OrgsSetMembershipForUserRequestRole.maybeFromJson(
              json['role'] as String?,
            ) ??
            OrgsSetMembershipForUserRequestRole.member,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static OrgsSetMembershipForUserRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return OrgsSetMembershipForUserRequest.fromJson(json);
  }

  /// The role to give the user in the organization. Can be one of:
  ///  * `admin` - The user will become an owner of the organization.
  /// * `member` - The user will become a non-owner member of the
  /// organization.
  final OrgsSetMembershipForUserRequestRole? role;

  /// Converts an [OrgsSetMembershipForUserRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'role': role?.toJson()};
  }

  @override
  int get hashCode => role.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is OrgsSetMembershipForUserRequest && role == other.role;
  }
}
