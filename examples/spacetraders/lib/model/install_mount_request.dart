class InstallMountRequest {
  InstallMountRequest({required this.symbol});

  factory InstallMountRequest.fromJson(Map<String, dynamic> json) {
    return InstallMountRequest(symbol: json['symbol'] as String);
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static InstallMountRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return InstallMountRequest.fromJson(json);
  }

  final String symbol;

  Map<String, dynamic> toJson() {
    return {'symbol': symbol};
  }
}
