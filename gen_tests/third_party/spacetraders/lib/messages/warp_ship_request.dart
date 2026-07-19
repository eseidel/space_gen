import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';

@immutable
class WarpShipRequest {
  const WarpShipRequest({required this.waypointSymbol});

  /// Converts a `Map<String, dynamic>` to a [WarpShipRequest].
  factory WarpShipRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'WarpShipRequest',
      json,
      () => WarpShipRequest(waypointSymbol: json['waypointSymbol'] as String),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static WarpShipRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return WarpShipRequest.fromJson(json);
  }

  /// The symbol of the waypoint to navigate/warp to.
  final String waypointSymbol;

  /// Converts a [WarpShipRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'waypointSymbol': waypointSymbol};
  }

  @override
  int get hashCode => waypointSymbol.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is WarpShipRequest && waypointSymbol == other.waypointSymbol;
  }
}
