import 'package:spacetraders/model/cooldown.dart';
import 'package:spacetraders/model/extraction.dart';
import 'package:spacetraders/model/ship_cargo.dart';

class ExtractResourcesWithSurvey201Response {
  ExtractResourcesWithSurvey201Response({
    required this.data,
  });

  factory ExtractResourcesWithSurvey201Response.fromJson(
    Map<String, dynamic> json,
  ) {
    return ExtractResourcesWithSurvey201Response(
      data: ExtractResourcesWithSurvey201ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final ExtractResourcesWithSurvey201ResponseData data;

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}

class ExtractResourcesWithSurvey201ResponseData {
  ExtractResourcesWithSurvey201ResponseData({
    required this.cooldown,
    required this.extraction,
    required this.cargo,
  });

  factory ExtractResourcesWithSurvey201ResponseData.fromJson(
    Map<String, dynamic> json,
  ) {
    return ExtractResourcesWithSurvey201ResponseData(
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
