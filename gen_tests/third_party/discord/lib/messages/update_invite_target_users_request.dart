import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class UpdateInviteTargetUsersRequest {
  const UpdateInviteTargetUsersRequest({required this.targetUsersFile});

  /// Converts a `Map<String, dynamic>` to a [UpdateInviteTargetUsersRequest].
  factory UpdateInviteTargetUsersRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'UpdateInviteTargetUsersRequest',
      json,
      () => UpdateInviteTargetUsersRequest(
        targetUsersFile: json['target_users_file'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static UpdateInviteTargetUsersRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return UpdateInviteTargetUsersRequest.fromJson(json);
  }

  final String targetUsersFile;

  /// Converts a [UpdateInviteTargetUsersRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'target_users_file': targetUsersFile};
  }

  @override
  int get hashCode => targetUsersFile.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UpdateInviteTargetUsersRequest &&
        targetUsersFile == other.targetUsersFile;
  }
}
