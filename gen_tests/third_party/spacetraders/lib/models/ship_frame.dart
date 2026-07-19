import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/ship_component_condition.dart';
import 'package:spacetraders/models/ship_component_integrity.dart';
import 'package:spacetraders/models/ship_component_quality.dart';
import 'package:spacetraders/models/ship_frame_symbol.dart';
import 'package:spacetraders/models/ship_requirements.dart';

/// {@template ship_frame}
/// The frame of the ship. The frame determines the number of modules and
/// mounting points of the ship, as well as base fuel capacity. As the condition
/// of the frame takes more wear, the ship will become more sluggish and less
/// maneuverable.
/// {@endtemplate}
@immutable
class ShipFrame {
  /// {@macro ship_frame}
  const ShipFrame({
    required this.symbol,
    required this.name,
    required this.condition,
    required this.integrity,
    required this.description,
    required this.moduleSlots,
    required this.mountingPoints,
    required this.fuelCapacity,
    required this.requirements,
    required this.quality,
  });

  /// Converts a `Map<String, dynamic>` to a [ShipFrame].
  factory ShipFrame.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ShipFrame',
      json,
      () => ShipFrame(
        symbol: ShipFrameSymbol.fromJson(json['symbol'] as String),
        name: json['name'] as String,
        condition: ShipComponentCondition.fromJson(json['condition'] as num),
        integrity: ShipComponentIntegrity.fromJson(json['integrity'] as num),
        description: json['description'] as String,
        moduleSlots: json['moduleSlots'] as int,
        mountingPoints: json['mountingPoints'] as int,
        fuelCapacity: json['fuelCapacity'] as int,
        requirements: ShipRequirements.fromJson(
          json['requirements'] as Map<String, dynamic>,
        ),
        quality: ShipComponentQuality.fromJson(json['quality'] as num),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ShipFrame? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ShipFrame.fromJson(json);
  }

  /// Symbol of the frame.
  final ShipFrameSymbol symbol;

  /// Name of the frame.
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

  /// Description of the frame.
  final String description;

  /// The amount of slots that can be dedicated to modules installed in the
  /// ship. Each installed module take up a number of slots, and once there
  /// are no more slots, no new modules can be installed.
  final int moduleSlots;

  /// The amount of slots that can be dedicated to mounts installed in the
  /// ship. Each installed mount takes up a number of points, and once there
  /// are no more points remaining, no new mounts can be installed.
  final int mountingPoints;

  /// The maximum amount of fuel that can be stored in this ship. When
  /// refueling, the ship will be refueled to this amount.
  final int fuelCapacity;

  /// The requirements for installation on a ship
  final ShipRequirements requirements;

  /// The overall quality of the component, which determines the quality of
  /// the component. High quality components return more ships parts and ship
  /// plating when a ship is scrapped. But also require more of these parts to
  /// repair. This is transparent to the player, as the parts are bought
  /// from/sold to the marketplace.
  final ShipComponentQuality quality;

  /// Converts a [ShipFrame] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol.toJson(),
      'name': name,
      'condition': condition.toJson(),
      'integrity': integrity.toJson(),
      'description': description,
      'moduleSlots': moduleSlots,
      'mountingPoints': mountingPoints,
      'fuelCapacity': fuelCapacity,
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
    moduleSlots,
    mountingPoints,
    fuelCapacity,
    requirements,
    quality,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ShipFrame &&
        symbol == other.symbol &&
        name == other.name &&
        condition == other.condition &&
        integrity == other.integrity &&
        description == other.description &&
        moduleSlots == other.moduleSlots &&
        mountingPoints == other.mountingPoints &&
        fuelCapacity == other.fuelCapacity &&
        requirements == other.requirements &&
        quality == other.quality;
  }
}
