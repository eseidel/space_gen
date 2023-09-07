import 'package:spacetraders/model/cooldown.dart';
import 'package:spacetraders/model/extraction.dart';
import 'package:spacetraders/model/ship_cargo.dart';

class ExtractResources201Response {
  ExtractResources201Response({
    required this.data,
  });

  factory ExtractResources201Response.fromJson(Map<String, dynamic> json) {
    return ExtractResources201Response(
      data: ExtractResources201ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final ExtractResources201ResponseData data;

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}

class ExtractResources201ResponseData {
  ExtractResources201ResponseData({
    required this.cooldown,
    required this.extraction,
    required this.cargo,
  });

  factory ExtractResources201ResponseData.fromJson(Map<String, dynamic> json) {
    return ExtractResources201ResponseData(
      cooldown: Cooldown.fromJson(json['cooldown'] as Map<String, dynamic>),
      extraction:
          Extraction.fromJson(json['extraction'] as Map<String, dynamic>),
      cargo: ShipCargo.fromJson(json['cargo'] as Map<String, dynamic>),
    );
  }

  final Cooldown cooldown;
  final Extraction extraction;
  final ShipCargo cargo;

  Map<String, dynamic> toJson() {
    return {
      'cooldown': cooldown.toJson(),
      'extraction': extraction.toJson(),
      'cargo': cargo.toJson(),
    };
  }
}
