import 'package:meta/meta.dart';

@immutable
class WaypointOrbital {
  const WaypointOrbital({required this.symbol});

  factory WaypointOrbital.fromJson(Map<String, dynamic> json) {
    return WaypointOrbital(symbol: json['symbol'] as String);
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static WaypointOrbital? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return WaypointOrbital.fromJson(json);
  }

  final String symbol;

  Map<String, dynamic> toJson() {
    return {'symbol': symbol};
  }

  @override
  int get hashCode => symbol.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is WaypointOrbital && symbol == other.symbol;
  }
}
