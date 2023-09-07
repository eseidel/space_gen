import 'package:spacetraders/model/cooldown.dart';
import 'package:spacetraders/model/survey.dart';

class CreateSurvey201Response {
  CreateSurvey201Response({
    required this.data,
  });

  factory CreateSurvey201Response.fromJson(Map<String, dynamic> json) {
    return CreateSurvey201Response(
      data: CreateSurvey201ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final CreateSurvey201ResponseData data;

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}

class CreateSurvey201ResponseData {
  CreateSurvey201ResponseData({
    required this.cooldown,
    required this.surveys,
  });

  factory CreateSurvey201ResponseData.fromJson(Map<String, dynamic> json) {
    return CreateSurvey201ResponseData(
      cooldown: Cooldown.fromJson(json['cooldown'] as Map<String, dynamic>),
      surveys: (json['surveys'] as List<dynamic>)
          .map<Survey>((e) => Survey.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  final Cooldown cooldown;
  final List<Survey> surveys;

  Map<String, dynamic> toJson() {
    return {
      'cooldown': cooldown.toJson(),
      'surveys': surveys.map((e) => e.toJson()).toList(),
    };
  }
}
