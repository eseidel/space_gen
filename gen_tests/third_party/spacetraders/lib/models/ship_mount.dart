import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/ship_mount_deposits_inner.dart';
import 'package:spacetraders/models/ship_mount_symbol.dart';
import 'package:spacetraders/models/ship_requirements.dart';

/// {@template ship_mount}
/// A mount is installed on the exterior of a ship.
/// {@endtemplate}
@immutable
class ShipMount {
  /// {@macro ship_mount}
  const ShipMount({
    required this.symbol,
    required this.name,
    required this.description,
    required this.requirements,
    this.strength,
    this.deposits,
  });

  /// Converts a `Map<String, dynamic>` to a [ShipMount].
  factory ShipMount.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ShipMount',
      json,
      () => ShipMount(
        symbol: ShipMountSymbol.fromJson(json['symbol'] as String),
        name: json['name'] as String,
        description: json['description'] as String,
        strength: json['strength'] as int?,
        deposits: (json['deposits'] as List?)
            ?.map<ShipMountDepositsInner>(
              (e) => ShipMountDepositsInner.fromJson(e as String),
            )
            .toList(),
        requirements: ShipRequirements.fromJson(
          json['requirements'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ShipMount? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ShipMount.fromJson(json);
  }

  /// Symbol of this mount.
  final ShipMountSymbol symbol;

  /// Name of this mount.
  final String name;

  /// Description of this mount.
  final String description;

  /// Mounts that have this value, such as mining lasers, denote how powerful
  /// this mount's capabilities are.
  final int? strength;

  /// Mounts that have this value denote what goods can be produced from using
  /// the mount.
  final List<ShipMountDepositsInner>? deposits;

  /// The requirements for installation on a ship
  final ShipRequirements requirements;

  /// Converts a [ShipMount] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol.toJson(),
      'name': name,
      'description': description,
      'strength': strength,
      'deposits': deposits?.map((e) => e.toJson()).toList(),
      'requirements': requirements.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    symbol,
    name,
    description,
    strength,
    listHash(deposits),
    requirements,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ShipMount &&
        symbol == other.symbol &&
        name == other.name &&
        description == other.description &&
        strength == other.strength &&
        listsEqual(deposits, other.deposits) &&
        requirements == other.requirements;
  }
}
