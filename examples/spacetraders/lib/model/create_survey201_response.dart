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

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CreateSurvey201Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CreateSurvey201Response.fromJson(json);
  }

  final CreateSurvey201ResponseData data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }
}
