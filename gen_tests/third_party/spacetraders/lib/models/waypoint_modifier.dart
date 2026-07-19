import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/waypoint_modifier_symbol.dart';

@immutable
class WaypointModifier {
  const WaypointModifier({
    required this.symbol,
    required this.name,
    required this.description,
  });

  /// Converts a `Map<String, dynamic>` to a [WaypointModifier].
  factory WaypointModifier.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'WaypointModifier',
      json,
      () => WaypointModifier(
        symbol: WaypointModifierSymbol.fromJson(json['symbol'] as String),
        name: json['name'] as String,
        description: json['description'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static WaypointModifier? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return WaypointModifier.fromJson(json);
  }

  /// Waypoint Modifier Symbol
  /// The unique identifier of the modifier.
  final WaypointModifierSymbol symbol;

  /// The name of the trait.
  final String name;

  /// A description of the trait.
  final String description;

  /// Converts a [WaypointModifier] to a `Map<String, dynamic>`.
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
    return other is WaypointModifier &&
        symbol == other.symbol &&
        name == other.name &&
        description == other.description;
  }
}
