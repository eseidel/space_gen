// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/create_chart201_response_data.dart';

/// {@template create_chart201_response}
/// Successfully charted waypoint.
/// {@endtemplate}
@immutable
class CreateChart201Response {
  /// {@macro create_chart201_response}
  const CreateChart201Response({required this.data});

  /// Converts a `Map<String, dynamic>` to a [CreateChart201Response].
  factory CreateChart201Response.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CreateChart201Response',
      json,
      () => CreateChart201Response(
        data: CreateChart201ResponseData.fromJson(
          json['data'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CreateChart201Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CreateChart201Response.fromJson(json);
  }

  final CreateChart201ResponseData data;

  /// Converts a [CreateChart201Response] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }

  @override
  int get hashCode => data.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CreateChart201Response && data == other.data;
  }
}
