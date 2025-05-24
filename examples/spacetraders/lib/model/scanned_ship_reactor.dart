class ScannedShipReactor {
  ScannedShipReactor({required this.symbol});

  factory ScannedShipReactor.fromJson(Map<String, dynamic> json) {
    return ScannedShipReactor(symbol: json['symbol'] as String);
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ScannedShipReactor? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ScannedShipReactor.fromJson(json);
  }

  final String symbol;

  Map<String, dynamic> toJson() {
    return {'symbol': symbol};
  }
}
