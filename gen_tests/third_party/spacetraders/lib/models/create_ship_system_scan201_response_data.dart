import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/cooldown.dart';
import 'package:spacetraders/models/scanned_system.dart';

@immutable
class CreateShipSystemScan201ResponseData {
  const CreateShipSystemScan201ResponseData({
    required this.cooldown,
    required this.systems,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [CreateShipSystemScan201ResponseData].
  factory CreateShipSystemScan201ResponseData.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'CreateShipSystemScan201ResponseData',
      json,
      () => CreateShipSystemScan201ResponseData(
        cooldown: Cooldown.fromJson(json['cooldown'] as Map<String, dynamic>),
        systems: (json['systems'] as List)
            .map<ScannedSystem>(
              (e) => ScannedSystem.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
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

  /// A cooldown is a period of time in which a ship cannot perform certain
  /// actions.
  final Cooldown cooldown;

  /// List of scanned systems.
  final List<ScannedSystem> systems;

  /// Converts a [CreateShipSystemScan201ResponseData]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'cooldown': cooldown.toJson(),
      'systems': systems.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([cooldown, listHash(systems)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CreateShipSystemScan201ResponseData &&
        cooldown == other.cooldown &&
        listsEqual(systems, other.systems);
  }
}
