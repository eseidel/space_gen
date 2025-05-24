class RemoveMountRequest {
  RemoveMountRequest({required this.symbol});

  factory RemoveMountRequest.fromJson(Map<String, dynamic> json) {
    return RemoveMountRequest(symbol: json['symbol'] as String);
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RemoveMountRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return RemoveMountRequest.fromJson(json);
  }

  final String symbol;

  Map<String, dynamic> toJson() {
    return {'symbol': symbol};
  }
}
