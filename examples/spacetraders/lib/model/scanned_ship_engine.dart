class ScannedShipEngine {
  ScannedShipEngine({required this.symbol});

  factory ScannedShipEngine.fromJson(Map<String, dynamic> json) {
    return ScannedShipEngine(symbol: json['symbol'] as String);
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ScannedShipEngine? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ScannedShipEngine.fromJson(json);
  }

  final String symbol;

  Map<String, dynamic> toJson() {
    return {'symbol': symbol};
  }
}
