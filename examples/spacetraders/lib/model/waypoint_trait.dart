import 'package:meta/meta.dart';
import 'package:spacetraders/model/waypoint_trait_symbol.dart';

@immutable
class WaypointTrait {
  const WaypointTrait({
    required this.symbol,
    required this.name,
    required this.description,
  });

  factory WaypointTrait.fromJson(Map<String, dynamic> json) {
    return WaypointTrait(
      symbol: WaypointTraitSymbol.fromJson(json['symbol'] as String),
      name: json['name'] as String,
      description: json['description'] as String,
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static WaypointTrait? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return WaypointTrait.fromJson(json);
  }

  final WaypointTraitSymbol symbol;
  final String name;
  final String description;

  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol.toJson(),
      'name': name,
      'description': description,
    };
  }

  @override
  int get hashCode => Object.hash(symbol, name, description);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is WaypointTrait &&
        symbol == other.symbol &&
        name == other.name &&
        description == other.description;
  }
}
