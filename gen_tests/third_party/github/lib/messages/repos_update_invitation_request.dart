import 'package:github/model_helpers.dart';
import 'package:github/models/repos_update_invitation_request_permissions.dart';
import 'package:meta/meta.dart';

@immutable
class ReposUpdateInvitationRequest {
  const ReposUpdateInvitationRequest({this.permissions});

  /// Converts a `Map<String, dynamic>` to a [ReposUpdateInvitationRequest].
  factory ReposUpdateInvitationRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ReposUpdateInvitationRequest',
      json,
      () => ReposUpdateInvitationRequest(
        permissions: ReposUpdateInvitationRequestPermissions.maybeFromJson(
          json['permissions'] as String?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReposUpdateInvitationRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ReposUpdateInvitationRequest.fromJson(json);
  }

  /// The permissions that the associated user will have on the repository.
  /// Valid values are `read`, `write`, `maintain`, `triage`, and `admin`.
  final ReposUpdateInvitationRequestPermissions? permissions;

  /// Converts a [ReposUpdateInvitationRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'permissions': ?permissions?.toJson()};
  }

  @override
  int get hashCode => permissions.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReposUpdateInvitationRequest &&
        permissions == other.permissions;
  }
}
