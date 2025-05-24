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

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GetMyFactions200ResponseDataItem? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return GetMyFactions200ResponseDataItem.fromJson(json);
  }

  final String symbol;
  final int reputation;

  Map<String, dynamic> toJson() {
    return {'symbol': symbol, 'reputation': reputation};
  }
}
