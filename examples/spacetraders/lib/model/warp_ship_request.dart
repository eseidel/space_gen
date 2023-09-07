class WarpShipRequest {
  WarpShipRequest({
    required this.waypointSymbol,
  });

  factory WarpShipRequest.fromJson(Map<String, dynamic> json) {
    return WarpShipRequest(
      waypointSymbol: json['waypointSymbol'] as String,
    );
  }

  final String waypointSymbol;

  Map<String, dynamic> toJson() {
    return {
      'waypointSymbol': waypointSymbol,
    };
  }
}
