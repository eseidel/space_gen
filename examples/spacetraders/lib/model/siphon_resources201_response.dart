import 'package:spacetraders/model/cooldown.dart';
import 'package:spacetraders/model/ship_cargo.dart';
import 'package:spacetraders/model/ship_condition_event.dart';
import 'package:spacetraders/model/siphon.dart';

class SiphonResources201Response {
  SiphonResources201Response({required this.data});

  factory SiphonResources201Response.fromJson(Map<String, dynamic> json) {
    return SiphonResources201Response(
      data: SiphonResources201ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final SiphonResources201ResponseData data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }
}

class SiphonResources201ResponseData {
  SiphonResources201ResponseData({
    required this.siphon,
    required this.cooldown,
    required this.cargo,
    required this.events,
  });

  factory SiphonResources201ResponseData.fromJson(Map<String, dynamic> json) {
    return SiphonResources201ResponseData(
      siphon: Siphon.fromJson(json['siphon'] as Map<String, dynamic>),
      cooldown: Cooldown.fromJson(json['cooldown'] as Map<String, dynamic>),
      cargo: ShipCargo.fromJson(json['cargo'] as Map<String, dynamic>),
      events:
          (json['events'] as List<dynamic>)
              .map<ShipConditionEvent>(
                (e) => ShipConditionEvent.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
    );
  }

  final Siphon siphon;
  final Cooldown cooldown;
  final ShipCargo cargo;
  final List<ShipConditionEvent> events;

  Map<String, dynamic> toJson() {
    return {
      'siphon': siphon.toJson(),
      'cooldown': cooldown.toJson(),
      'cargo': cargo.toJson(),
      'events': events.map((e) => e.toJson()).toList(),
    };
  }
}
