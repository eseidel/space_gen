import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/create_survey201_response_data.dart';

/// {@template create_survey201_response}
/// Surveys has been created.
/// {@endtemplate}
@immutable
class CreateSurvey201Response {
  /// {@macro create_survey201_response}
  const CreateSurvey201Response({required this.data});

  /// Converts a `Map<String, dynamic>` to a [CreateSurvey201Response].
  factory CreateSurvey201Response.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CreateSurvey201Response',
      json,
      () => CreateSurvey201Response(
        data: CreateSurvey201ResponseData.fromJson(
          json['data'] as Map<String, dynamic>,
        ),
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

  /// Converts a [CreateSurvey201Response] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }

  @override
  int get hashCode => data.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CreateSurvey201Response && data == other.data;
  }
}
