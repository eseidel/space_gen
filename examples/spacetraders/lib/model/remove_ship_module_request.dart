class RemoveShipModuleRequest {
  RemoveShipModuleRequest({required this.symbol});

  factory RemoveShipModuleRequest.fromJson(Map<String, dynamic> json) {
    return RemoveShipModuleRequest(symbol: json['symbol'] as String);
  }

  final String symbol;

  Map<String, dynamic> toJson() {
    return {'symbol': symbol};
  }
}
