import 'package:spacetraders/model/faction_symbol.dart';

class WaypointFaction {
  WaypointFaction({required this.symbol});

  factory WaypointFaction.fromJson(Map<String, dynamic> json) {
    return WaypointFaction(
      symbol: FactionSymbol.fromJson(json['symbol'] as String),
    );
  }

  final FactionSymbol symbol;

  Map<String, dynamic> toJson() {
    return {'symbol': symbol.toJson()};
  }
}
