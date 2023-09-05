import 'package:spacetraders/model/waypoint_type.dart';

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
      type: WaypointType.fromJson(json['type'] as String),
      x: json['x'] as int,
      y: json['y'] as int,
    );
  }

  final String symbol;
  final WaypointType type;
  final int x;
  final int y;

  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol,
      'type': type.toJson(),
      'x': x,
      'y': y,
    };
  }
}
