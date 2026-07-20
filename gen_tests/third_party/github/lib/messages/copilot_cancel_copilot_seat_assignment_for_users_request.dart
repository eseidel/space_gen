import 'package:github/api_exception.dart';
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class CopilotCancelCopilotSeatAssignmentForUsersRequest {
  CopilotCancelCopilotSeatAssignmentForUsersRequest({
    required this.selectedUsernames,
  }) {
    selectedUsernames.validate(minItems: 1);
  }

  /// Converts a `Map<String, dynamic>` to a
  /// [CopilotCancelCopilotSeatAssignmentForUsersRequest].
  factory CopilotCancelCopilotSeatAssignmentForUsersRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'CopilotCancelCopilotSeatAssignmentForUsersRequest',
      json,
      () => CopilotCancelCopilotSeatAssignmentForUsersRequest(
        selectedUsernames: (json['selected_usernames'] as List).cast<String>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CopilotCancelCopilotSeatAssignmentForUsersRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CopilotCancelCopilotSeatAssignmentForUsersRequest.fromJson(json);
  }

  /// The usernames of the organization members for which to revoke access to
  /// GitHub Copilot.
  final List<String> selectedUsernames;

  /// Converts a [CopilotCancelCopilotSeatAssignmentForUsersRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'selected_usernames': selectedUsernames};
  }

  @override
  int get hashCode => listHash(selectedUsernames).hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CopilotCancelCopilotSeatAssignmentForUsersRequest &&
        listsEqual(selectedUsernames, other.selectedUsernames);
  }
}
