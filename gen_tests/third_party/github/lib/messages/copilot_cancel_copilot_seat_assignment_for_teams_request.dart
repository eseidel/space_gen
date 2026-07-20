import 'package:github/api_exception.dart';
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class CopilotCancelCopilotSeatAssignmentForTeamsRequest {
  CopilotCancelCopilotSeatAssignmentForTeamsRequest({
    required this.selectedTeams,
  }) {
    selectedTeams.validate(minItems: 1);
  }

  /// Converts a `Map<String, dynamic>` to a
  /// [CopilotCancelCopilotSeatAssignmentForTeamsRequest].
  factory CopilotCancelCopilotSeatAssignmentForTeamsRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'CopilotCancelCopilotSeatAssignmentForTeamsRequest',
      json,
      () => CopilotCancelCopilotSeatAssignmentForTeamsRequest(
        selectedTeams: (json['selected_teams'] as List).cast<String>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CopilotCancelCopilotSeatAssignmentForTeamsRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CopilotCancelCopilotSeatAssignmentForTeamsRequest.fromJson(json);
  }

  /// The names of teams from which to revoke access to GitHub Copilot.
  final List<String> selectedTeams;

  /// Converts a [CopilotCancelCopilotSeatAssignmentForTeamsRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'selected_teams': selectedTeams};
  }

  @override
  int get hashCode => listHash(selectedTeams).hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CopilotCancelCopilotSeatAssignmentForTeamsRequest &&
        listsEqual(selectedTeams, other.selectedTeams);
  }
}
