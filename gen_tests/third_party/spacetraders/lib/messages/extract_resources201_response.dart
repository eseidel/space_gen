import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/extract_resources201_response_data.dart';

/// {@template extract_resources201_response}
/// Successfully extracted resources.
/// {@endtemplate}
@immutable
class ExtractResources201Response {
  /// {@macro extract_resources201_response}
  const ExtractResources201Response({required this.data});

  /// Converts a `Map<String, dynamic>` to an [ExtractResources201Response].
  factory ExtractResources201Response.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ExtractResources201Response',
      json,
      () => ExtractResources201Response(
        data: ExtractResources201ResponseData.fromJson(
          json['data'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ExtractResources201Response? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ExtractResources201Response.fromJson(json);
  }

  final ExtractResources201ResponseData data;

  /// Converts an [ExtractResources201Response] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }

  @override
  int get hashCode => data.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ExtractResources201Response && data == other.data;
  }
}
