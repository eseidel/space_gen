import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/remove_mount201_response_data.dart';

/// {@template remove_mount201_response}
/// Remove Mount 201 Response
/// Successfully removed the mount.
/// {@endtemplate}
@immutable
class RemoveMount201Response {
  /// {@macro remove_mount201_response}
  const RemoveMount201Response({required this.data});

  /// Converts a `Map<String, dynamic>` to a [RemoveMount201Response].
  factory RemoveMount201Response.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RemoveMount201Response',
      json,
      () => RemoveMount201Response(
        data: RemoveMount201ResponseData.fromJson(
          json['data'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RemoveMount201Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return RemoveMount201Response.fromJson(json);
  }

  final RemoveMount201ResponseData data;

  /// Converts a [RemoveMount201Response] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }

  @override
  int get hashCode => data.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RemoveMount201Response && data == other.data;
  }
}
