import 'package:meta/meta.dart';
import 'package:spacetraders/model/faction_symbol.dart';

@immutable
class RegisterRequest {
  const RegisterRequest({required this.symbol, required this.faction});

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

  @override
  int get hashCode => Object.hash(symbol, faction);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RegisterRequest &&
        symbol == other.symbol &&
        faction == other.faction;
  }
}
