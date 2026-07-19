import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/meta.dart';
import 'package:spacetraders/models/waypoint.dart';

/// {@template get_system_waypoints200_response}
/// Successfully listed waypoints.
/// {@endtemplate}
@immutable
class GetSystemWaypoints200Response {
  /// {@macro get_system_waypoints200_response}
  const GetSystemWaypoints200Response({required this.data, required this.meta});

  /// Converts a `Map<String, dynamic>` to a [GetSystemWaypoints200Response].
  factory GetSystemWaypoints200Response.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GetSystemWaypoints200Response',
      json,
      () => GetSystemWaypoints200Response(
        data: (json['data'] as List)
            .map<Waypoint>((e) => Waypoint.fromJson(e as Map<String, dynamic>))
            .toList(),
        meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GetSystemWaypoints200Response? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return GetSystemWaypoints200Response.fromJson(json);
  }

  final List<Waypoint> data;

  /// Meta details for pagination.
  final Meta meta;

  /// Converts a [GetSystemWaypoints200Response] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'data': data.map((e) => e.toJson()).toList(),
      'meta': meta.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([listHash(data), meta]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GetSystemWaypoints200Response &&
        listsEqual(data, other.data) &&
        meta == other.meta;
  }
}
