import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/siphon_resources201_response_data.dart';

/// {@template siphon_resources201_response}
/// Siphon successful.
/// {@endtemplate}
@immutable
class SiphonResources201Response {
  /// {@macro siphon_resources201_response}
  const SiphonResources201Response({required this.data});

  /// Converts a `Map<String, dynamic>` to a [SiphonResources201Response].
  factory SiphonResources201Response.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'SiphonResources201Response',
      json,
      () => SiphonResources201Response(
        data: SiphonResources201ResponseData.fromJson(
          json['data'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SiphonResources201Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return SiphonResources201Response.fromJson(json);
  }

  final SiphonResources201ResponseData data;

  /// Converts a [SiphonResources201Response] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }

  @override
  int get hashCode => data.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SiphonResources201Response && data == other.data;
  }
}
