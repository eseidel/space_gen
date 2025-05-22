class InstallShipModuleRequest {
  InstallShipModuleRequest({required this.symbol});

  factory InstallShipModuleRequest.fromJson(Map<String, dynamic> json) {
    return InstallShipModuleRequest(symbol: json['symbol'] as String);
  }

  final String symbol;

  Map<String, dynamic> toJson() {
    return {'symbol': symbol};
  }
}
