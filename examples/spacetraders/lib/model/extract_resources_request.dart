import 'package:spacetraders/model/survey.dart';

class ExtractResourcesRequest {
  ExtractResourcesRequest({
    required this.survey,
  });

  factory ExtractResourcesRequest.fromJson(Map<String, dynamic> json) {
    return ExtractResourcesRequest(
      survey: Survey.fromJson(json['survey'] as Map<String, dynamic>),
    );
  }

  final Survey survey;

  Map<String, dynamic> toJson() {
    return {
      'survey': survey.toJson(),
    };
  }
}
