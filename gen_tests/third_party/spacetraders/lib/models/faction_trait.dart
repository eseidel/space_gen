import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/faction_trait_symbol.dart';

@immutable
class FactionTrait {
  const FactionTrait({
    required this.symbol,
    required this.name,
    required this.description,
  });

  /// Converts a `Map<String, dynamic>` to a [FactionTrait].
  factory FactionTrait.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'FactionTrait',
      json,
      () => FactionTrait(
        symbol: FactionTraitSymbol.fromJson(json['symbol'] as String),
        name: json['name'] as String,
        description: json['description'] as String,
      ),
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

  /// The unique identifier of the trait.
  final FactionTraitSymbol symbol;

  /// The name of the trait.
  final String name;

  /// A description of the trait.
  final String description;

  /// Converts a [FactionTrait] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol.toJson(),
      'name': name,
      'description': description,
    };
  }

  @override
  int get hashCode => Object.hashAll([symbol, name, description]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is FactionTrait &&
        symbol == other.symbol &&
        name == other.name &&
        description == other.description;
  }
}
