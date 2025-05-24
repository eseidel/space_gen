import 'package:spacetraders/model/ship_module.dart';

class GetShipModules200Response {
  GetShipModules200Response({required this.data});

  factory GetShipModules200Response.fromJson(Map<String, dynamic> json) {
    return GetShipModules200Response(
      data:
          (json['data'] as List<dynamic>)
              .map<ShipModule>(
                (e) => ShipModule.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GetShipModules200Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GetShipModules200Response.fromJson(json);
  }

  final List<ShipModule> data;

  Map<String, dynamic> toJson() {
    return {'data': data.map((e) => e.toJson()).toList()};
  }
}
