import 'package:spacetraders/src/model/faction_symbols.dart';

class WaypointFaction {
  WaypointFaction({
    required this.symbol,
  });

  factory WaypointFaction.fromJson(Map<String, dynamic> json) {
    return WaypointFaction(
      symbol: FactionSymbols.fromJson(json['symbol'] as String),
    );
  }

  final FactionSymbols symbol;

  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol.toJson(),
    };
  }
}
