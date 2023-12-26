class JumpShipRequest {
  JumpShipRequest({
    required this.waypointSymbol,
  });

  factory JumpShipRequest.fromJson(Map<String, dynamic> json) {
    return JumpShipRequest(
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
