class InstallMountRequest {
  InstallMountRequest({
    required this.symbol,
  });

  factory InstallMountRequest.fromJson(Map<String, dynamic> json) {
    return InstallMountRequest(
      symbol: json['symbol'] as String,
    );
  }

  final String symbol;

  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol,
    };
  }
}
