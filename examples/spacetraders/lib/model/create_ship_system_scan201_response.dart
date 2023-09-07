import 'package:spacetraders/model/cooldown.dart';
import 'package:spacetraders/model/scanned_system.dart';

class CreateShipSystemScan201Response {
  CreateShipSystemScan201Response({
    required this.data,
  });

  factory CreateShipSystemScan201Response.fromJson(Map<String, dynamic> json) {
    return CreateShipSystemScan201Response(
      data: CreateShipSystemScan201ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final CreateShipSystemScan201ResponseData data;

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}

class CreateShipSystemScan201ResponseData {
  CreateShipSystemScan201ResponseData({
    required this.cooldown,
    required this.systems,
  });

  factory CreateShipSystemScan201ResponseData.fromJson(
    Map<String, dynamic> json,
  ) {
    return CreateShipSystemScan201ResponseData(
      cooldown: Cooldown.fromJson(json['cooldown'] as Map<String, dynamic>),
      systems: (json['systems'] as List<dynamic>)
          .map<ScannedSystem>(
            (e) => ScannedSystem.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );
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
