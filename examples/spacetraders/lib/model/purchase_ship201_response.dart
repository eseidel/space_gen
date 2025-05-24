import 'package:spacetraders/model/purchase_ship201_response_data.dart';

class PurchaseShip201Response {
  PurchaseShip201Response({required this.data});

  factory PurchaseShip201Response.fromJson(Map<String, dynamic> json) {
    return PurchaseShip201Response(
      data: PurchaseShip201ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PurchaseShip201Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return PurchaseShip201Response.fromJson(json);
  }

  final PurchaseShip201ResponseData data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }
}
