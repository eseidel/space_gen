class JumpShipRequest {
  JumpShipRequest({
    required this.systemSymbol,
  });

  factory JumpShipRequest.fromJson(Map<String, dynamic> json) {
    return JumpShipRequest(
      systemSymbol: json['systemSymbol'] as String,
    );
  }

  final String systemSymbol;

  Map<String, dynamic> toJson() {
    return {
      'systemSymbol': systemSymbol,
    };
  }
}
