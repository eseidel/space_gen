class GetMyFactions200ResponseDataItem {
  GetMyFactions200ResponseDataItem({
    required this.symbol,
    required this.reputation,
  });

  factory GetMyFactions200ResponseDataItem.fromJson(Map<String, dynamic> json) {
    return GetMyFactions200ResponseDataItem(
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
