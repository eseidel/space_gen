// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:spacetraders/api_exception.dart';

/// The symbol of the waypoint.
extension type const WaypointSymbol._(String value) {
  WaypointSymbol(this.value) {
    value.validate(minLength: 1);
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
