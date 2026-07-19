import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';

@immutable
class JumpShipRequest {
  const JumpShipRequest({required this.waypointSymbol});

  /// Converts a `Map<String, dynamic>` to a [JumpShipRequest].
  factory JumpShipRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'JumpShipRequest',
      json,
      () => JumpShipRequest(waypointSymbol: json['waypointSymbol'] as String),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static JumpShipRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return JumpShipRequest.fromJson(json);
  }

  /// The symbol of the waypoint to jump to. The destination must be a
  /// connected waypoint.
  final String waypointSymbol;

  /// Converts a [JumpShipRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'waypointSymbol': waypointSymbol};
  }

  @override
  int get hashCode => waypointSymbol.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is JumpShipRequest && waypointSymbol == other.waypointSymbol;
  }
}
