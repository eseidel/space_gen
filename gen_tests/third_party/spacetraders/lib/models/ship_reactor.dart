import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/ship_component_condition.dart';
import 'package:spacetraders/models/ship_component_integrity.dart';
import 'package:spacetraders/models/ship_component_quality.dart';
import 'package:spacetraders/models/ship_reactor_symbol.dart';
import 'package:spacetraders/models/ship_requirements.dart';

/// {@template ship_reactor}
/// The reactor of the ship. The reactor is responsible for powering the ship's
/// systems and weapons.
/// {@endtemplate}
@immutable
class ShipReactor {
  /// {@macro ship_reactor}
  const ShipReactor({
    required this.symbol,
    required this.name,
    required this.condition,
    required this.integrity,
    required this.description,
    required this.powerOutput,
    required this.requirements,
    required this.quality,
  });

  /// Converts a `Map<String, dynamic>` to a [ShipReactor].
  factory ShipReactor.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ShipReactor',
      json,
      () => ShipReactor(
        symbol: ShipReactorSymbol.fromJson(json['symbol'] as String),
        name: json['name'] as String,
        condition: ShipComponentCondition.fromJson(json['condition'] as num),
        integrity: ShipComponentIntegrity.fromJson(json['integrity'] as num),
        description: json['description'] as String,
        powerOutput: json['powerOutput'] as int,
        requirements: ShipRequirements.fromJson(
          json['requirements'] as Map<String, dynamic>,
        ),
        quality: ShipComponentQuality.fromJson(json['quality'] as num),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ShipReactor? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ShipReactor.fromJson(json);
  }

  /// Symbol of the reactor.
  final ShipReactorSymbol symbol;

  /// Name of the reactor.
  final String name;

  /// The repairable condition of a component. A value of 0 indicates the
  /// component needs significant repairs, while a value of 1 indicates the
  /// component is in near perfect condition. As the condition of a component
  /// is repaired, the overall integrity of the component decreases.
  final ShipComponentCondition condition;

  /// The overall integrity of the component, which determines the performance
  /// of the component. A value of 0 indicates that the component is almost
  /// completely degraded, while a value of 1 indicates that the component is
  /// in near perfect condition. The integrity of the component is
  /// non-repairable, and represents permanent wear over time.
  final ShipComponentIntegrity integrity;

  /// Description of the reactor.
  final String description;

  /// The amount of power provided by this reactor. The more power a reactor
  /// provides to the ship, the lower the cooldown it gets when using a module
  /// or mount that taxes the ship's power.
  final int powerOutput;

  /// The requirements for installation on a ship
  final ShipRequirements requirements;

  /// The overall quality of the component, which determines the quality of
  /// the component. High quality components return more ships parts and ship
  /// plating when a ship is scrapped. But also require more of these parts to
  /// repair. This is transparent to the player, as the parts are bought
  /// from/sold to the marketplace.
  final ShipComponentQuality quality;

  /// Converts a [ShipReactor] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol.toJson(),
      'name': name,
      'condition': condition.toJson(),
      'integrity': integrity.toJson(),
      'description': description,
      'powerOutput': powerOutput,
      'requirements': requirements.toJson(),
      'quality': quality.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    symbol,
    name,
    condition,
    integrity,
    description,
    powerOutput,
    requirements,
    quality,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ShipReactor &&
        symbol == other.symbol &&
        name == other.name &&
        condition == other.condition &&
        integrity == other.integrity &&
        description == other.description &&
        powerOutput == other.powerOutput &&
        requirements == other.requirements &&
        quality == other.quality;
  }
}
