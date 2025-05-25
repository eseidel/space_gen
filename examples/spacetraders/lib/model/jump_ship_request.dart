import 'package:meta/meta.dart';

@immutable
class JumpShipRequest {
  const JumpShipRequest({required this.waypointSymbol});

  factory JumpShipRequest.fromJson(Map<String, dynamic> json) {
    return JumpShipRequest(waypointSymbol: json['waypointSymbol'] as String);
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static JumpShipRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return JumpShipRequest.fromJson(json);
  }

  final String waypointSymbol;

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
