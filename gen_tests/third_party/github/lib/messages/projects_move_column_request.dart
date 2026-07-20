import 'package:github/api_exception.dart';
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ProjectsMoveColumnRequest {
  ProjectsMoveColumnRequest({required this.position}) {
    position.validate(pattern: r'^(?:first|last|after:\d+)$');
  }

  /// Converts a `Map<String, dynamic>` to a [ProjectsMoveColumnRequest].
  factory ProjectsMoveColumnRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ProjectsMoveColumnRequest',
      json,
      () => ProjectsMoveColumnRequest(position: json['position'] as String),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ProjectsMoveColumnRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ProjectsMoveColumnRequest.fromJson(json);
  }

  /// The position of the column in a project. Can be one of: `first`, `last`,
  /// or `after:<column_id>` to place after the specified column.
  /// Example: `'last'`
  final String position;

  /// Converts a [ProjectsMoveColumnRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'position': position};
  }

  @override
  int get hashCode => position.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ProjectsMoveColumnRequest && position == other.position;
  }
}
