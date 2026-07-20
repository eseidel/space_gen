import 'package:meta/meta.dart';
import 'package:spacetraders/api_exception.dart';
import 'package:spacetraders/model_helpers.dart';

@immutable
class NavigateShipRequest {
  NavigateShipRequest({required this.waypointSymbol}) {
    waypointSymbol.validate(minLength: 1);
  }

  /// Converts a `Map<String, dynamic>` to a [NavigateShipRequest].
  factory NavigateShipRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'NavigateShipRequest',
      json,
      () =>
          NavigateShipRequest(waypointSymbol: json['waypointSymbol'] as String),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static NavigateShipRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return NavigateShipRequest.fromJson(json);
  }

  /// The symbol of the waypoint to navigate/warp to.
  final String waypointSymbol;

  /// Converts a [NavigateShipRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'waypointSymbol': waypointSymbol};
  }

  @override
  int get hashCode => waypointSymbol.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is NavigateShipRequest &&
        waypointSymbol == other.waypointSymbol;
  }
}
