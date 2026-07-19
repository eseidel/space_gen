import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/cooldown.dart';
import 'package:spacetraders/models/ship_cargo.dart';
import 'package:spacetraders/models/ship_condition_event.dart';
import 'package:spacetraders/models/siphon.dart';

@immutable
class SiphonResources201ResponseData {
  const SiphonResources201ResponseData({
    required this.siphon,
    required this.cooldown,
    required this.cargo,
    required this.events,
  });

  /// Converts a `Map<String, dynamic>` to a [SiphonResources201ResponseData].
  factory SiphonResources201ResponseData.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'SiphonResources201ResponseData',
      json,
      () => SiphonResources201ResponseData(
        siphon: Siphon.fromJson(json['siphon'] as Map<String, dynamic>),
        cooldown: Cooldown.fromJson(json['cooldown'] as Map<String, dynamic>),
        cargo: ShipCargo.fromJson(json['cargo'] as Map<String, dynamic>),
        events: (json['events'] as List)
            .map<ShipConditionEvent>(
              (e) => ShipConditionEvent.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SiphonResources201ResponseData? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return SiphonResources201ResponseData.fromJson(json);
  }

  /// Siphon details.
  final Siphon siphon;

  /// A cooldown is a period of time in which a ship cannot perform certain
  /// actions.
  final Cooldown cooldown;

  /// Ship cargo details.
  final ShipCargo cargo;
  final List<ShipConditionEvent> events;

  /// Converts a [SiphonResources201ResponseData] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'siphon': siphon.toJson(),
      'cooldown': cooldown.toJson(),
      'cargo': cargo.toJson(),
      'events': events.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([siphon, cooldown, cargo, listHash(events)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SiphonResources201ResponseData &&
        siphon == other.siphon &&
        cooldown == other.cooldown &&
        cargo == other.cargo &&
        listsEqual(events, other.events);
  }
}
