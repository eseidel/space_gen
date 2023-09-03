class WaypointOrbital {
  WaypointOrbital({
    required this.symbol,
  });

  factory WaypointOrbital.fromJson(Map<String, dynamic> json) {
    return WaypointOrbital(
      symbol: json['symbol'] as String,
    );
  }

  final String symbol;

  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol,
    };
  }
}
