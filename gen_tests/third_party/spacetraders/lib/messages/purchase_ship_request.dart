// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/ship_type.dart';

@immutable
class PurchaseShipRequest {
  const PurchaseShipRequest({
    required this.shipType,
    required this.waypointSymbol,
  });

  /// Converts a `Map<String, dynamic>` to a [PurchaseShipRequest].
  factory PurchaseShipRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'PurchaseShipRequest',
      json,
      () => PurchaseShipRequest(
        shipType: ShipType.fromJson(json['shipType'] as String),
        waypointSymbol: json['waypointSymbol'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PurchaseShipRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return PurchaseShipRequest.fromJson(json);
  }

  /// Type of ship
  final ShipType shipType;

  /// The symbol of the waypoint you want to purchase the ship at.
  final String waypointSymbol;

  /// Converts a [PurchaseShipRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'shipType': shipType.toJson(), 'waypointSymbol': waypointSymbol};
  }

  @override
  int get hashCode => Object.hashAll([shipType, waypointSymbol]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PurchaseShipRequest &&
        shipType == other.shipType &&
        waypointSymbol == other.waypointSymbol;
  }
}
