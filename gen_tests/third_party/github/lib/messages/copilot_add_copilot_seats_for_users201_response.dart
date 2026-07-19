import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template copilot_add_copilot_seats_for_users201_response}
/// The total number of seats created for the specified user(s).
/// {@endtemplate}
@immutable
class CopilotAddCopilotSeatsForUsers201Response {
  /// {@macro copilot_add_copilot_seats_for_users201_response}
  const CopilotAddCopilotSeatsForUsers201Response({required this.seatsCreated});

  /// Converts a `Map<String, dynamic>` to a
  /// [CopilotAddCopilotSeatsForUsers201Response].
  factory CopilotAddCopilotSeatsForUsers201Response.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'CopilotAddCopilotSeatsForUsers201Response',
      json,
      () => CopilotAddCopilotSeatsForUsers201Response(
        seatsCreated: json['seats_created'] as int,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CopilotAddCopilotSeatsForUsers201Response? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CopilotAddCopilotSeatsForUsers201Response.fromJson(json);
  }

  final int seatsCreated;

  /// Converts a [CopilotAddCopilotSeatsForUsers201Response]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'seats_created': seatsCreated};
  }

  @override
  int get hashCode => seatsCreated.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CopilotAddCopilotSeatsForUsers201Response &&
        seatsCreated == other.seatsCreated;
  }
}
