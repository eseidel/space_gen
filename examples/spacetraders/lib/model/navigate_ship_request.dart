class NavigateShipRequest {
  NavigateShipRequest({required this.waypointSymbol});

  factory NavigateShipRequest.fromJson(Map<String, dynamic> json) {
    return NavigateShipRequest(
      waypointSymbol: json['waypointSymbol'] as String,
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

  final String waypointSymbol;

  Map<String, dynamic> toJson() {
    return {'waypointSymbol': waypointSymbol};
  }
}
