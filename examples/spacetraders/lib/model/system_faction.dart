import 'package:spacetraders/model/faction_symbols.dart';

class SystemFaction {
  SystemFaction({
    required this.symbol,
  });

  factory SystemFaction.fromJson(Map<String, dynamic> json) {
    return SystemFaction(
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
