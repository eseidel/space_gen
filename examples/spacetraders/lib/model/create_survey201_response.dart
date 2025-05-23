import 'package:spacetraders/model/create_survey201_response_data.dart';

class CreateSurvey201Response {
  CreateSurvey201Response({required this.data});

  factory CreateSurvey201Response.fromJson(Map<String, dynamic> json) {
    return CreateSurvey201Response(
      data: CreateSurvey201ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final CreateSurvey201ResponseData data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }
}
