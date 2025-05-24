class GetStatus200ResponseHealth {
  GetStatus200ResponseHealth({required this.lastMarketUpdate});

  factory GetStatus200ResponseHealth.fromJson(Map<String, dynamic> json) {
    return GetStatus200ResponseHealth(
      lastMarketUpdate: json['lastMarketUpdate'] as String,
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GetStatus200ResponseHealth? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GetStatus200ResponseHealth.fromJson(json);
  }

  final String lastMarketUpdate;

  Map<String, dynamic> toJson() {
    return {'lastMarketUpdate': lastMarketUpdate};
  }
}
