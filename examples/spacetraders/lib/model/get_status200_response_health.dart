class GetStatus200ResponseHealth {
  GetStatus200ResponseHealth({required this.lastMarketUpdate});

  factory GetStatus200ResponseHealth.fromJson(Map<String, dynamic> json) {
    return GetStatus200ResponseHealth(
      lastMarketUpdate: json['lastMarketUpdate'] as String,
    );
  }

  final String lastMarketUpdate;

  Map<String, dynamic> toJson() {
    return {'lastMarketUpdate': lastMarketUpdate};
  }
}
