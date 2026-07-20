import 'package:github/api_exception.dart';
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class CopilotAddCopilotSeatsForTeamsRequest {
  CopilotAddCopilotSeatsForTeamsRequest({required this.selectedTeams}) {
    selectedTeams.validate(minItems: 1);
  }

  /// Converts a `Map<String, dynamic>` to a
  /// [CopilotAddCopilotSeatsForTeamsRequest].
  factory CopilotAddCopilotSeatsForTeamsRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'CopilotAddCopilotSeatsForTeamsRequest',
      json,
      () => CopilotAddCopilotSeatsForTeamsRequest(
        selectedTeams: (json['selected_teams'] as List).cast<String>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CopilotAddCopilotSeatsForTeamsRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CopilotAddCopilotSeatsForTeamsRequest.fromJson(json);
  }

  /// List of team names within the organization to which to grant access to
  /// GitHub Copilot.
  final List<String> selectedTeams;

  /// Converts a [CopilotAddCopilotSeatsForTeamsRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'selected_teams': selectedTeams};
  }

  @override
  int get hashCode => listHash(selectedTeams).hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CopilotAddCopilotSeatsForTeamsRequest &&
        listsEqual(selectedTeams, other.selectedTeams);
  }
}
