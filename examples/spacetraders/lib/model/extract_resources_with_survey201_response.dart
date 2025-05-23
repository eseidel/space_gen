import 'package:spacetraders/model/extract_resources_with_survey201_response_data.dart';

class ExtractResourcesWithSurvey201Response {
  ExtractResourcesWithSurvey201Response({required this.data});

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
    return {'data': data.toJson()};
  }
}
