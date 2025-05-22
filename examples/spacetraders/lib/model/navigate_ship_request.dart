class NavigateShipRequest {
  NavigateShipRequest({required this.waypointSymbol});

  factory NavigateShipRequest.fromJson(Map<String, dynamic> json) {
    return NavigateShipRequest(
      waypointSymbol: json['waypointSymbol'] as String,
    );
  }

  final String waypointSymbol;

  Map<String, dynamic> toJson() {
    return {'waypointSymbol': waypointSymbol};
  }
}
