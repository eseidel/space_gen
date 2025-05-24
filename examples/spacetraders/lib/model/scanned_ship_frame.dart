class ScannedShipFrame {
  ScannedShipFrame({required this.symbol});

  factory ScannedShipFrame.fromJson(Map<String, dynamic> json) {
    return ScannedShipFrame(symbol: json['symbol'] as String);
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ScannedShipFrame? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ScannedShipFrame.fromJson(json);
  }

  final String symbol;

  Map<String, dynamic> toJson() {
    return {'symbol': symbol};
  }
}
