import 'package:spacetraders/model/faction_symbol.dart';

class SystemFaction {
  SystemFaction({required this.symbol});

  factory SystemFaction.fromJson(Map<String, dynamic> json) {
    return SystemFaction(
      symbol: FactionSymbol.fromJson(json['symbol'] as String),
    );
  }

  final FactionSymbol symbol;

  Map<String, dynamic> toJson() {
    return {'symbol': symbol.toJson()};
  }
}
