import 'package:meta/meta.dart';
import 'package:spacetraders/model/cooldown.dart';
import 'package:spacetraders/model/scanned_ship.dart';
import 'package:spacetraders/model_helpers.dart';

@immutable
class CreateShipShipScan201ResponseData {
  const CreateShipShipScan201ResponseData({
    required this.cooldown,
    this.ships = const [],
  });

  factory CreateShipShipScan201ResponseData.fromJson(
    Map<String, dynamic> json,
  ) {
    return CreateShipShipScan201ResponseData(
      cooldown: Cooldown.fromJson(json['cooldown'] as Map<String, dynamic>),
      ships:
          (json['ships'] as List<dynamic>)
              .map<ScannedShip>(
                (e) => ScannedShip.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
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

  final Cooldown cooldown;
  final List<ScannedShip> ships;

  Map<String, dynamic> toJson() {
    return {
      'cooldown': cooldown.toJson(),
      'ships': ships.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hash(cooldown, ships);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CreateShipShipScan201ResponseData &&
        cooldown == other.cooldown &&
        listsEqual(ships, other.ships);
  }
}
