import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/cooldown.dart';
import 'package:spacetraders/models/extraction.dart';
import 'package:spacetraders/models/ship_cargo.dart';
import 'package:spacetraders/models/ship_condition_event.dart';
import 'package:spacetraders/models/waypoint_modifier.dart';

@immutable
class ExtractResourcesWithSurvey201ResponseData {
  const ExtractResourcesWithSurvey201ResponseData({
    required this.extraction,
    required this.cooldown,
    required this.cargo,
    required this.events,
    this.modifiers,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [ExtractResourcesWithSurvey201ResponseData].
  factory ExtractResourcesWithSurvey201ResponseData.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ExtractResourcesWithSurvey201ResponseData',
      json,
      () => ExtractResourcesWithSurvey201ResponseData(
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
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ExtractResourcesWithSurvey201ResponseData? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ExtractResourcesWithSurvey201ResponseData.fromJson(json);
  }

  /// Extraction details.
  final Extraction extraction;

  /// A cooldown is a period of time in which a ship cannot perform certain
  /// actions.
  final Cooldown cooldown;

  /// Ship cargo details.
  final ShipCargo cargo;
  final List<WaypointModifier>? modifiers;
  final List<ShipConditionEvent> events;

  /// Converts an [ExtractResourcesWithSurvey201ResponseData]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'extraction': extraction.toJson(),
      'cooldown': cooldown.toJson(),
      'cargo': cargo.toJson(),
      if (modifiers != null)
        'modifiers': modifiers?.map((e) => e.toJson()).toList(),
      'events': events.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    extraction,
    cooldown,
    cargo,
    listHash(modifiers),
    listHash(events),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ExtractResourcesWithSurvey201ResponseData &&
        extraction == other.extraction &&
        cooldown == other.cooldown &&
        cargo == other.cargo &&
        listsEqual(modifiers, other.modifiers) &&
        listsEqual(events, other.events);
  }
}
