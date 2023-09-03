
class WaypointFaction {
  WaypointFaction({
    required this.symbol,
  });

  factory WaypointFaction.fromJson(Map<String, dynamic> json) {
    return WaypointFaction(
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
