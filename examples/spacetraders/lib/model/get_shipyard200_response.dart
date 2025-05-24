import 'package:spacetraders/model/shipyard.dart';

class GetShipyard200Response {
  GetShipyard200Response({required this.data});

  factory GetShipyard200Response.fromJson(Map<String, dynamic> json) {
    return GetShipyard200Response(
      data: Shipyard.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GetShipyard200Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GetShipyard200Response.fromJson(json);
  }

  final Shipyard data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }
}
