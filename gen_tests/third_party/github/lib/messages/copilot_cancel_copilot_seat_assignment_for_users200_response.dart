import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template copilot_cancel_copilot_seat_assignment_for_users200_response}
/// The total number of seats set to "pending cancellation" for the specified
/// users.
/// {@endtemplate}
@immutable
class CopilotCancelCopilotSeatAssignmentForUsers200Response {
  /// {@macro copilot_cancel_copilot_seat_assignment_for_users200_response}
  const CopilotCancelCopilotSeatAssignmentForUsers200Response({
    required this.seatsCancelled,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [CopilotCancelCopilotSeatAssignmentForUsers200Response].
  factory CopilotCancelCopilotSeatAssignmentForUsers200Response.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'CopilotCancelCopilotSeatAssignmentForUsers200Response',
      json,
      () => CopilotCancelCopilotSeatAssignmentForUsers200Response(
        seatsCancelled: json['seats_cancelled'] as int,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CopilotCancelCopilotSeatAssignmentForUsers200Response? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CopilotCancelCopilotSeatAssignmentForUsers200Response.fromJson(json);
  }

  final int seatsCancelled;

  /// Converts a [CopilotCancelCopilotSeatAssignmentForUsers200Response]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'seats_cancelled': seatsCancelled};
  }

  @override
  int get hashCode => seatsCancelled.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CopilotCancelCopilotSeatAssignmentForUsers200Response &&
        seatsCancelled == other.seatsCancelled;
  }
}
