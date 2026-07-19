import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template copilot_cancel_copilot_seat_assignment_for_teams200_response}
/// The total number of seats set to "pending cancellation" for members of the
/// specified team(s).
/// {@endtemplate}
@immutable
class CopilotCancelCopilotSeatAssignmentForTeams200Response {
  /// {@macro copilot_cancel_copilot_seat_assignment_for_teams200_response}
  const CopilotCancelCopilotSeatAssignmentForTeams200Response({
    required this.seatsCancelled,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [CopilotCancelCopilotSeatAssignmentForTeams200Response].
  factory CopilotCancelCopilotSeatAssignmentForTeams200Response.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'CopilotCancelCopilotSeatAssignmentForTeams200Response',
      json,
      () => CopilotCancelCopilotSeatAssignmentForTeams200Response(
        seatsCancelled: json['seats_cancelled'] as int,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CopilotCancelCopilotSeatAssignmentForTeams200Response? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CopilotCancelCopilotSeatAssignmentForTeams200Response.fromJson(json);
  }

  final int seatsCancelled;

  /// Converts a [CopilotCancelCopilotSeatAssignmentForTeams200Response]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'seats_cancelled': seatsCancelled};
  }

  @override
  int get hashCode => seatsCancelled.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CopilotCancelCopilotSeatAssignmentForTeams200Response &&
        seatsCancelled == other.seatsCancelled;
  }
}
