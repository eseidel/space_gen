import 'package:spacetraders/model/faction_symbol.dart';

class RegisterRequest {
  RegisterRequest({
    required this.faction,
    required this.symbol,
    required this.email,
  });

  factory RegisterRequest.fromJson(Map<String, dynamic> json) {
    return RegisterRequest(
      faction: FactionSymbol.fromJson(json['faction'] as String),
      symbol: json['symbol'] as String,
      email: json['email'] as String,
    );
  }

  final FactionSymbol faction;
  final String symbol;
  final String email;

  Map<String, dynamic> toJson() {
    return {
      'faction': faction.toJson(),
      'symbol': symbol,
      'email': email,
    };
  }
}
