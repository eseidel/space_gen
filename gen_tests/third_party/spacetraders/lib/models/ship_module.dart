import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/ship_module_symbol.dart';
import 'package:spacetraders/models/ship_requirements.dart';

/// {@template ship_module}
/// A module can be installed in a ship and provides a set of capabilities such
/// as storage space or quarters for crew. Module installations are permanent.
/// {@endtemplate}
@immutable
class ShipModule {
  /// {@macro ship_module}
  const ShipModule({
    required this.symbol,
    required this.name,
    required this.description,
    required this.requirements,
    this.capacity,
    this.range,
  });

  /// Converts a `Map<String, dynamic>` to a [ShipModule].
  factory ShipModule.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ShipModule',
      json,
      () => ShipModule(
        symbol: ShipModuleSymbol.fromJson(json['symbol'] as String),
        name: json['name'] as String,
        description: json['description'] as String,
        capacity: json['capacity'] as int?,
        range: json['range'] as int?,
        requirements: ShipRequirements.fromJson(
          json['requirements'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ShipModule? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ShipModule.fromJson(json);
  }

  /// The symbol of the module.
  final ShipModuleSymbol symbol;

  /// Name of this module.
  final String name;

  /// Description of this module.
  final String description;

  /// Modules that provide capacity, such as cargo hold or crew quarters will
  /// show this value to denote how much of a bonus the module grants.
  final int? capacity;

  /// Modules that have a range will such as a sensor array show this value to
  /// denote how far can the module reach with its capabilities.
  final int? range;

  /// The requirements for installation on a ship
  final ShipRequirements requirements;

  /// Converts a [ShipModule] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol.toJson(),
      'name': name,
      'description': description,
      if (capacity != null) 'capacity': capacity,
      if (range != null) 'range': range,
      'requirements': requirements.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    symbol,
    name,
    description,
    capacity,
    range,
    requirements,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ShipModule &&
        symbol == other.symbol &&
        name == other.name &&
        description == other.description &&
        capacity == other.capacity &&
        range == other.range &&
        requirements == other.requirements;
  }
}
