import 'package:github/model_helpers.dart';
import 'package:github/models/copilot_seat_details.dart';
import 'package:meta/meta.dart';

@immutable
class CopilotListCopilotSeats200Response {
  const CopilotListCopilotSeats200Response({this.totalSeats, this.seats});

  /// Converts a `Map<String, dynamic>` to a
  /// [CopilotListCopilotSeats200Response].
  factory CopilotListCopilotSeats200Response.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'CopilotListCopilotSeats200Response',
      json,
      () => CopilotListCopilotSeats200Response(
        totalSeats: json['total_seats'] as int?,
        seats: (json['seats'] as List?)
            ?.map<CopilotSeatDetails>(
              (e) => CopilotSeatDetails.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CopilotListCopilotSeats200Response? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CopilotListCopilotSeats200Response.fromJson(json);
  }

  /// Total number of Copilot seats for the organization currently being
  /// billed.
  final int? totalSeats;
  final List<CopilotSeatDetails>? seats;

  /// Converts a [CopilotListCopilotSeats200Response]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'total_seats': totalSeats,
      'seats': seats?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([totalSeats, listHash(seats)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CopilotListCopilotSeats200Response &&
        totalSeats == other.totalSeats &&
        listsEqual(seats, other.seats);
  }
}
