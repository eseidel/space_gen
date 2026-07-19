import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/cooldown.dart';
import 'package:spacetraders/models/scanned_ship.dart';

@immutable
class CreateShipShipScan201ResponseData {
  const CreateShipShipScan201ResponseData({
    required this.cooldown,
    required this.ships,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [CreateShipShipScan201ResponseData].
  factory CreateShipShipScan201ResponseData.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'CreateShipShipScan201ResponseData',
      json,
      () => CreateShipShipScan201ResponseData(
        cooldown: Cooldown.fromJson(json['cooldown'] as Map<String, dynamic>),
        ships: (json['ships'] as List)
            .map<ScannedShip>(
              (e) => ScannedShip.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CreateShipShipScan201ResponseData? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CreateShipShipScan201ResponseData.fromJson(json);
  }

  /// A cooldown is a period of time in which a ship cannot perform certain
  /// actions.
  final Cooldown cooldown;

  /// List of scanned ships.
  final List<ScannedShip> ships;

  /// Converts a [CreateShipShipScan201ResponseData]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'cooldown': cooldown.toJson(),
      'ships': ships.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([cooldown, listHash(ships)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CreateShipShipScan201ResponseData &&
        cooldown == other.cooldown &&
        listsEqual(ships, other.ships);
  }
}
