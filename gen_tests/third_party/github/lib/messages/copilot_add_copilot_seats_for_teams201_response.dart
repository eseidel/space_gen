import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template copilot_add_copilot_seats_for_teams201_response}
/// The total number of seats created for members of the specified team(s).
/// {@endtemplate}
@immutable
class CopilotAddCopilotSeatsForTeams201Response {
  /// {@macro copilot_add_copilot_seats_for_teams201_response}
  const CopilotAddCopilotSeatsForTeams201Response({required this.seatsCreated});

  /// Converts a `Map<String, dynamic>` to a
  /// [CopilotAddCopilotSeatsForTeams201Response].
  factory CopilotAddCopilotSeatsForTeams201Response.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'CopilotAddCopilotSeatsForTeams201Response',
      json,
      () => CopilotAddCopilotSeatsForTeams201Response(
        seatsCreated: json['seats_created'] as int,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CopilotAddCopilotSeatsForTeams201Response? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CopilotAddCopilotSeatsForTeams201Response.fromJson(json);
  }

  final int seatsCreated;

  /// Converts a [CopilotAddCopilotSeatsForTeams201Response]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'seats_created': seatsCreated};
  }

  @override
  int get hashCode => seatsCreated.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CopilotAddCopilotSeatsForTeams201Response &&
        seatsCreated == other.seatsCreated;
  }
}
