import 'package:spacetraders/model/ship_mount.dart';

class GetMounts200Response {
  GetMounts200Response({required this.data});

  factory GetMounts200Response.fromJson(Map<String, dynamic> json) {
    return GetMounts200Response(
      data:
          (json['data'] as List<dynamic>)
              .map<ShipMount>(
                (e) => ShipMount.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GetMounts200Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GetMounts200Response.fromJson(json);
  }

  final List<ShipMount> data;

  Map<String, dynamic> toJson() {
    return {'data': data.map((e) => e.toJson()).toList()};
  }
}
