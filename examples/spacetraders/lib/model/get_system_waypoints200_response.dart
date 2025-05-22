import 'package:spacetraders/model/meta.dart';
import 'package:spacetraders/model/waypoint.dart';

class GetSystemWaypoints200Response {
  GetSystemWaypoints200Response({required this.data, required this.meta});

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

  final List<Waypoint> data;
  final Meta meta;

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((e) => e.toJson()).toList(),
      'meta': meta.toJson(),
    };
  }
}
