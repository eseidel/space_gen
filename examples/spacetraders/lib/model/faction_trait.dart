import 'package:spacetraders/model/faction_trait_symbol.dart';

class FactionTrait {
  FactionTrait({
    required this.symbol,
    required this.name,
    required this.description,
  });

  factory FactionTrait.fromJson(Map<String, dynamic> json) {
    return FactionTrait(
      symbol: FactionTraitSymbol.fromJson(json['symbol'] as String),
      name: json['name'] as String,
      description: json['description'] as String,
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static FactionTrait? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return FactionTrait.fromJson(json);
  }

  final FactionTraitSymbol symbol;
  final String name;
  final String description;

  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol.toJson(),
      'name': name,
      'description': description,
    };
  }
}
