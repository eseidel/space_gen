import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/faction_symbol.dart';

@immutable
class RegisterRequest {
  const RegisterRequest({required this.symbol, required this.faction});

  /// Converts a `Map<String, dynamic>` to a [RegisterRequest].
  factory RegisterRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RegisterRequest',
      json,
      () => RegisterRequest(
        symbol: json['symbol'] as String,
        faction: FactionSymbol.fromJson(json['faction'] as String),
      ),
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

  /// Your desired agent symbol. This will be a unique name used to represent
  /// your agent, and will be the prefix for your ships.
  /// Example: `'BADGER'`
  final String symbol;

  /// The symbol of the faction.
  final FactionSymbol faction;

  /// Converts a [RegisterRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'symbol': symbol, 'faction': faction.toJson()};
  }

  @override
  int get hashCode => Object.hashAll([symbol, faction]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RegisterRequest &&
        symbol == other.symbol &&
        faction == other.faction;
  }
}
