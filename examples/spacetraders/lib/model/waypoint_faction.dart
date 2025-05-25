import 'package:meta/meta.dart';
import 'package:spacetraders/model/faction_symbol.dart';

@immutable
class WaypointFaction {
  const WaypointFaction({required this.symbol});

  factory WaypointFaction.fromJson(Map<String, dynamic> json) {
    return WaypointFaction(
      symbol: FactionSymbol.fromJson(json['symbol'] as String),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static WaypointFaction? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return WaypointFaction.fromJson(json);
  }

  final FactionSymbol symbol;

  Map<String, dynamic> toJson() {
    return {'symbol': symbol.toJson()};
  }

  @override
  int get hashCode => symbol.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is WaypointFaction && symbol == other.symbol;
  }
}
