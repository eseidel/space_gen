class GetMyFactions200ResponseData {
  GetMyFactions200ResponseData({
    required this.symbol,
    required this.reputation,
  });

  factory GetMyFactions200ResponseData.fromJson(Map<String, dynamic> json) {
    return GetMyFactions200ResponseData(
      symbol: json['symbol'] as String,
      reputation: json['reputation'] as int,
    );
  }

  final String symbol;
  final int reputation;

  Map<String, dynamic> toJson() {
    return {'symbol': symbol, 'reputation': reputation};
  }
}
