class SystemWaypoint {
  SystemWaypoint({
    required this.symbol,
    required this.type,
    required this.x,
    required this.y,
  });

  factory SystemWaypoint.fromJson(Map<String, dynamic> json) {
    return SystemWaypoint(
      symbol: json['symbol'] as String,
      type: json['type'] as String,
      x: json['x'] as int,
      y: json['y'] as int,
    );
  }

  final String symbol;
  final String type;
  final int x;
  final int y;

  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol,
      'type': type,
      'x': x,
      'y': y,
    };
  }
}
