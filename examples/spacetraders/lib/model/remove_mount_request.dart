class RemoveMountRequest {
  RemoveMountRequest({required this.symbol});

  factory RemoveMountRequest.fromJson(Map<String, dynamic> json) {
    return RemoveMountRequest(symbol: json['symbol'] as String);
  }

  final String symbol;

  Map<String, dynamic> toJson() {
    return {'symbol': symbol};
  }
}
