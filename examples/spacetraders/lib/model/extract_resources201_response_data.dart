import 'package:meta/meta.dart';
import 'package:spacetraders/model/cooldown.dart';
import 'package:spacetraders/model/extraction.dart';
import 'package:spacetraders/model/ship_cargo.dart';
import 'package:spacetraders/model/ship_condition_event.dart';
import 'package:spacetraders/model/waypoint_modifier.dart';
import 'package:spacetraders/model_helpers.dart';

@immutable
class ExtractResources201ResponseData {
  const ExtractResources201ResponseData({
    required this.extraction,
    required this.cooldown,
    required this.cargo,
    this.modifiers = const [],
    this.events = const [],
  });

  factory ExtractResources201ResponseData.fromJson(Map<String, dynamic> json) {
    return ExtractResources201ResponseData(
      extraction: Extraction.fromJson(
        json['extraction'] as Map<String, dynamic>,
      ),
      cooldown: Cooldown.fromJson(json['cooldown'] as Map<String, dynamic>),
      cargo: ShipCargo.fromJson(json['cargo'] as Map<String, dynamic>),
      modifiers: (json['modifiers'] as List?)
          ?.map<WaypointModifier>(
            (e) => WaypointModifier.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      events: (json['events'] as List)
          .map<ShipConditionEvent>(
            (e) => ShipConditionEvent.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ExtractResources201ResponseData? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ExtractResources201ResponseData.fromJson(json);
  }

  final Extraction extraction;
  final Cooldown cooldown;
  final ShipCargo cargo;
  final List<WaypointModifier>? modifiers;
  final List<ShipConditionEvent> events;

  Map<String, dynamic> toJson() {
    return {
      'extraction': extraction.toJson(),
      'cooldown': cooldown.toJson(),
      'cargo': cargo.toJson(),
      'modifiers': modifiers?.map((e) => e.toJson()).toList(),
      'events': events.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode =>
      Object.hash(extraction, cooldown, cargo, modifiers, events);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ExtractResources201ResponseData &&
        extraction == other.extraction &&
        cooldown == other.cooldown &&
        cargo == other.cargo &&
        listsEqual(modifiers, other.modifiers) &&
        listsEqual(events, other.events);
  }
}
