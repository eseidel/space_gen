// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:discord/model_helpers.dart';
import 'package:discord/models/automod_action_type.dart';
import 'package:discord/models/user_communication_disabled_action_metadata.dart';
import 'package:meta/meta.dart';

@immutable
class UserCommunicationDisabledAction {
  const UserCommunicationDisabledAction({required this.metadata});

  /// Converts a `Map<String, dynamic>` to a [UserCommunicationDisabledAction].
  factory UserCommunicationDisabledAction.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'UserCommunicationDisabledAction',
      json,
      () => UserCommunicationDisabledAction(
        metadata: UserCommunicationDisabledActionMetadata.fromJson(
          json['metadata'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static UserCommunicationDisabledAction? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return UserCommunicationDisabledAction.fromJson(json);
  }

  AutomodActionType get type => AutomodActionType.userCommunicationDisabled;
  final UserCommunicationDisabledActionMetadata metadata;

  /// Converts a [UserCommunicationDisabledAction] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'type': type.toJson(), 'metadata': metadata.toJson()};
  }

  @override
  int get hashCode => metadata.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UserCommunicationDisabledAction &&
        metadata == other.metadata;
  }
}
