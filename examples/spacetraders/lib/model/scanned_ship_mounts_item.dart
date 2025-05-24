class ScannedShipMountsItem {
  ScannedShipMountsItem({required this.symbol});

  factory ScannedShipMountsItem.fromJson(Map<String, dynamic> json) {
    return ScannedShipMountsItem(symbol: json['symbol'] as String);
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ScannedShipMountsItem? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ScannedShipMountsItem.fromJson(json);
  }

  final String symbol;

  Map<String, dynamic> toJson() {
    return {'symbol': symbol};
  }
}
