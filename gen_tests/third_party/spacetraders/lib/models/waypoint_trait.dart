import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/waypoint_trait_symbol.dart';

@immutable
class WaypointTrait {
  const WaypointTrait({
    required this.symbol,
    required this.name,
    required this.description,
  });

  /// Converts a `Map<String, dynamic>` to a [WaypointTrait].
  factory WaypointTrait.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'WaypointTrait',
      json,
      () => WaypointTrait(
        symbol: WaypointTraitSymbol.fromJson(json['symbol'] as String),
        name: json['name'] as String,
        description: json['description'] as String,
      ),
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

  /// The unique identifier of the trait.
  final WaypointTraitSymbol symbol;

  /// The name of the trait.
  final String name;

  /// A description of the trait.
  final String description;

  /// Converts a [WaypointTrait] to a `Map<String, dynamic>`.
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
    return other is WaypointTrait &&
        symbol == other.symbol &&
        name == other.name &&
        description == other.description;
  }
}
