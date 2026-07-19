import 'package:discord/messages/user_communication_disabled_action_metadata_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/automod_action_type.dart';
import 'package:meta/meta.dart';

@immutable
class UserCommunicationDisabledActionResponse {
  const UserCommunicationDisabledActionResponse({required this.metadata});

  /// Converts a `Map<String, dynamic>` to a
  /// [UserCommunicationDisabledActionResponse].
  factory UserCommunicationDisabledActionResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'UserCommunicationDisabledActionResponse',
      json,
      () => UserCommunicationDisabledActionResponse(
        metadata: UserCommunicationDisabledActionMetadataResponse.fromJson(
          json['metadata'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static UserCommunicationDisabledActionResponse? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return UserCommunicationDisabledActionResponse.fromJson(json);
  }

  AutomodActionType get type => AutomodActionType.userCommunicationDisabled;
  final UserCommunicationDisabledActionMetadataResponse metadata;

  /// Converts a [UserCommunicationDisabledActionResponse]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'type': type.toJson(), 'metadata': metadata.toJson()};
  }

  @override
  int get hashCode => metadata.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UserCommunicationDisabledActionResponse &&
        metadata == other.metadata;
  }
}
