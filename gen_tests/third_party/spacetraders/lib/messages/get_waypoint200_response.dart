import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/waypoint.dart';

/// {@template get_waypoint200_response}
/// Successfully fetched waypoint details.
/// {@endtemplate}
@immutable
class GetWaypoint200Response {
  /// {@macro get_waypoint200_response}
  const GetWaypoint200Response({required this.data});

  /// Converts a `Map<String, dynamic>` to a [GetWaypoint200Response].
  factory GetWaypoint200Response.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GetWaypoint200Response',
      json,
      () => GetWaypoint200Response(
        data: Waypoint.fromJson(json['data'] as Map<String, dynamic>),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GetWaypoint200Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GetWaypoint200Response.fromJson(json);
  }

  /// A waypoint is a location that ships can travel to such as a Planet, Moon
  /// or Space Station.
  final Waypoint data;

  /// Converts a [GetWaypoint200Response] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }

  @override
  int get hashCode => data.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GetWaypoint200Response && data == other.data;
  }
}
