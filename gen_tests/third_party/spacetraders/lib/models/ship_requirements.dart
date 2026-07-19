import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';

/// {@template ship_requirements}
/// The requirements for installation on a ship
/// {@endtemplate}
@immutable
class ShipRequirements {
  /// {@macro ship_requirements}
  const ShipRequirements({this.power, this.crew, this.slots});

  /// Converts a `Map<String, dynamic>` to a [ShipRequirements].
  factory ShipRequirements.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ShipRequirements',
      json,
      () => ShipRequirements(
        power: json['power'] as int?,
        crew: json['crew'] as int?,
        slots: json['slots'] as int?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ShipRequirements? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ShipRequirements.fromJson(json);
  }

  /// The amount of power required from the reactor.
  final int? power;

  /// The number of crew required for operation.
  final int? crew;

  /// The number of module slots required for installation.
  final int? slots;

  /// Converts a [ShipRequirements] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'power': ?power, 'crew': ?crew, 'slots': ?slots};
  }

  @override
  int get hashCode => Object.hashAll([power, crew, slots]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ShipRequirements &&
        power == other.power &&
        crew == other.crew &&
        slots == other.slots;
  }
}
