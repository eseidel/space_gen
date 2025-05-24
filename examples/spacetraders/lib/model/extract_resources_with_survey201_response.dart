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

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ExtractResourcesWithSurvey201Response? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ExtractResourcesWithSurvey201Response.fromJson(json);
  }

  final ExtractResourcesWithSurvey201ResponseData data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }
}
