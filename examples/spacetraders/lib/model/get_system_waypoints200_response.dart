import 'package:spacetraders/model/meta.dart';
import 'package:spacetraders/model/waypoint.dart';

class GetSystemWaypoints200Response {
  GetSystemWaypoints200Response({required this.meta, this.data = const []});

  factory GetSystemWaypoints200Response.fromJson(Map<String, dynamic> json) {
    return GetSystemWaypoints200Response(
      data:
          (json['data'] as List<dynamic>)
              .map<Waypoint>(
                (e) => Waypoint.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
      meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
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
  final Meta meta;

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((e) => e.toJson()).toList(),
      'meta': meta.toJson(),
    };
  }
}
