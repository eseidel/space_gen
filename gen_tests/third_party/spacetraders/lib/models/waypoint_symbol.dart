import 'package:spacetraders/api_exception.dart';

/// The symbol of the waypoint.
extension type const WaypointSymbol._(String value) {
  WaypointSymbol(this.value) {
    value.validateMinimumLength(1);
  }

  factory WaypointSymbol.fromJson(String json) => WaypointSymbol(json);

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static WaypointSymbol? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return WaypointSymbol.fromJson(json);
  }

  String toJson() => value;
}
