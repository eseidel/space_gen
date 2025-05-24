import 'package:spacetraders/model/faction_symbol.dart';

class RegisterRequest {
  RegisterRequest({required this.symbol, required this.faction});

  factory RegisterRequest.fromJson(Map<String, dynamic> json) {
    return RegisterRequest(
      symbol: json['symbol'] as String,
      faction: FactionSymbol.fromJson(json['faction'] as String),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RegisterRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return RegisterRequest.fromJson(json);
  }

  final String symbol;
  final FactionSymbol faction;

  Map<String, dynamic> toJson() {
    return {'symbol': symbol, 'faction': faction.toJson()};
  }
}
