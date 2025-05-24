class WarpShipRequest {
  WarpShipRequest({required this.waypointSymbol});

  factory WarpShipRequest.fromJson(Map<String, dynamic> json) {
    return WarpShipRequest(waypointSymbol: json['waypointSymbol'] as String);
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static WarpShipRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return WarpShipRequest.fromJson(json);
  }

  final String waypointSymbol;

  Map<String, dynamic> toJson() {
    return {'waypointSymbol': waypointSymbol};
  }
}
