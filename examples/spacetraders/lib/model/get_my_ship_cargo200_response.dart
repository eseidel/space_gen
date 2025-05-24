import 'package:spacetraders/model/ship_cargo.dart';

class GetMyShipCargo200Response {
  GetMyShipCargo200Response({required this.data});

  factory GetMyShipCargo200Response.fromJson(Map<String, dynamic> json) {
    return GetMyShipCargo200Response(
      data: ShipCargo.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GetMyShipCargo200Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GetMyShipCargo200Response.fromJson(json);
  }

  final ShipCargo data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }
}
