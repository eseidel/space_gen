// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/extract_resources_with_survey201_response_data.dart';

/// {@template extract_resources_with_survey201_response}
/// Successfully extracted resources.
/// {@endtemplate}
@immutable
class ExtractResourcesWithSurvey201Response {
  /// {@macro extract_resources_with_survey201_response}
  const ExtractResourcesWithSurvey201Response({required this.data});

  /// Converts a `Map<String, dynamic>` to an
  /// [ExtractResourcesWithSurvey201Response].
  factory ExtractResourcesWithSurvey201Response.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ExtractResourcesWithSurvey201Response',
      json,
      () => ExtractResourcesWithSurvey201Response(
        data: ExtractResourcesWithSurvey201ResponseData.fromJson(
          json['data'] as Map<String, dynamic>,
        ),
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

  /// Converts an [ExtractResourcesWithSurvey201Response]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }

  @override
  int get hashCode => data.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ExtractResourcesWithSurvey201Response && data == other.data;
  }
}
