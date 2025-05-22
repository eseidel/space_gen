import 'package:spacetraders/model/cooldown.dart';
import 'package:spacetraders/model/extraction.dart';
import 'package:spacetraders/model/ship_cargo.dart';
import 'package:spacetraders/model/ship_condition_event.dart';
import 'package:spacetraders/model/waypoint_modifier.dart';

class ExtractResources201Response {
  ExtractResources201Response({required this.data});

  factory ExtractResources201Response.fromJson(Map<String, dynamic> json) {
    return ExtractResources201Response(
      data: ExtractResources201ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final ExtractResources201ResponseData data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }
}

class ExtractResources201ResponseData {
  ExtractResources201ResponseData({
    required this.extraction,
    required this.cooldown,
    required this.cargo,
    required this.modifiers,
    required this.events,
  });

  factory ExtractResources201ResponseData.fromJson(Map<String, dynamic> json) {
    return ExtractResources201ResponseData(
      extraction: Extraction.fromJson(
        json['extraction'] as Map<String, dynamic>,
      ),
      cooldown: Cooldown.fromJson(json['cooldown'] as Map<String, dynamic>),
      cargo: ShipCargo.fromJson(json['cargo'] as Map<String, dynamic>),
      modifiers:
          (json['modifiers'] as List<dynamic>)
              .map<WaypointModifier>(
                (e) => WaypointModifier.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
      events:
          (json['events'] as List<dynamic>)
              .map<ShipConditionEvent>(
                (e) => ShipConditionEvent.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
    );
  }

  final Extraction extraction;
  final Cooldown cooldown;
  final ShipCargo cargo;
  final List<WaypointModifier> modifiers;
  final List<ShipConditionEvent> events;

  Map<String, dynamic> toJson() {
    return {
      'extraction': extraction.toJson(),
      'cooldown': cooldown.toJson(),
      'cargo': cargo.toJson(),
      'modifiers': modifiers.map((e) => e.toJson()).toList(),
      'events': events.map((e) => e.toJson()).toList(),
    };
  }
}
