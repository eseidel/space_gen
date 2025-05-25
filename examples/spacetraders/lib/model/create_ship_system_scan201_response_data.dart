import 'package:spacetraders/model/cooldown.dart';
import 'package:spacetraders/model/scanned_system.dart';

class CreateShipSystemScan201ResponseData {
  CreateShipSystemScan201ResponseData({
    required this.cooldown,
    this.systems = const [],
  });

  factory CreateShipSystemScan201ResponseData.fromJson(
    Map<String, dynamic> json,
  ) {
    return CreateShipSystemScan201ResponseData(
      cooldown: Cooldown.fromJson(json['cooldown'] as Map<String, dynamic>),
      systems:
          (json['systems'] as List<dynamic>)
              .map<ScannedSystem>(
                (e) => ScannedSystem.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CreateShipSystemScan201ResponseData? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CreateShipSystemScan201ResponseData.fromJson(json);
  }

  final Cooldown cooldown;
  final List<ScannedSystem> systems;

  Map<String, dynamic> toJson() {
    return {
      'cooldown': cooldown.toJson(),
      'systems': systems.map((e) => e.toJson()).toList(),
    };
  }
}
