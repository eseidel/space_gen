import 'package:github/model_helpers.dart';
import 'package:github/models/orgs_update_membership_for_authenticated_user_request_state.dart';
import 'package:meta/meta.dart';

@immutable
class OrgsUpdateMembershipForAuthenticatedUserRequest {
  const OrgsUpdateMembershipForAuthenticatedUserRequest({required this.state});

  /// Converts a `Map<String, dynamic>` to an
  /// [OrgsUpdateMembershipForAuthenticatedUserRequest].
  factory OrgsUpdateMembershipForAuthenticatedUserRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'OrgsUpdateMembershipForAuthenticatedUserRequest',
      json,
      () => OrgsUpdateMembershipForAuthenticatedUserRequest(
        state: OrgsUpdateMembershipForAuthenticatedUserRequestState.fromJson(
          json['state'] as String,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static OrgsUpdateMembershipForAuthenticatedUserRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return OrgsUpdateMembershipForAuthenticatedUserRequest.fromJson(json);
  }

  /// The state that the membership should be in. Only `"active"` will be
  /// accepted.
  final OrgsUpdateMembershipForAuthenticatedUserRequestState state;

  /// Converts an [OrgsUpdateMembershipForAuthenticatedUserRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'state': state.toJson()};
  }

  @override
  int get hashCode => state.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is OrgsUpdateMembershipForAuthenticatedUserRequest &&
        state == other.state;
  }
}
