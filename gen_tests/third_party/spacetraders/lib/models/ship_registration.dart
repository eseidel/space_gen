import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/ship_role.dart';

/// {@template ship_registration}
/// The public registration information of the ship
/// {@endtemplate}
@immutable
class ShipRegistration {
  /// {@macro ship_registration}
  const ShipRegistration({
    required this.name,
    required this.factionSymbol,
    required this.role,
  });

  /// Converts a `Map<String, dynamic>` to a [ShipRegistration].
  factory ShipRegistration.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ShipRegistration',
      json,
      () => ShipRegistration(
        name: json['name'] as String,
        factionSymbol: json['factionSymbol'] as String,
        role: ShipRole.fromJson(json['role'] as String),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ShipRegistration? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ShipRegistration.fromJson(json);
  }

  /// The agent's registered name of the ship
  final String name;

  /// The symbol of the faction the ship is registered with
  final String factionSymbol;

  /// The registered role of the ship
  final ShipRole role;

  /// Converts a [ShipRegistration] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'factionSymbol': factionSymbol,
      'role': role.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([name, factionSymbol, role]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ShipRegistration &&
        name == other.name &&
        factionSymbol == other.factionSymbol &&
        role == other.role;
  }
}
