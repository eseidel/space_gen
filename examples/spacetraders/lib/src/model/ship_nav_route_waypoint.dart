class ShipNavRouteWaypoint {
  ShipNavRouteWaypoint({
    required this.symbol,
    required this.type,
    required this.systemSymbol,
    required this.x,
    required this.y,
  });

  factory ShipNavRouteWaypoint.fromJson(Map<String, dynamic> json) {
    return ShipNavRouteWaypoint(
      symbol: json['symbol'] as String,
      type: json['type'] as String,
      systemSymbol: json['systemSymbol'] as String,
      x: json['x'] as int,
      y: json['y'] as int,
    );
  }

  final String symbol;
  final String type;
  final String systemSymbol;
  final int x;
  final int y;

  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol,
      'type': type,
      'systemSymbol': systemSymbol,
      'x': x,
      'y': y,
    };
  }
}
