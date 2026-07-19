import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ProjectsMoveCard403ResponseErrorsInner {
  const ProjectsMoveCard403ResponseErrorsInner({
    this.code,
    this.message,
    this.resource,
    this.field,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [ProjectsMoveCard403ResponseErrorsInner].
  factory ProjectsMoveCard403ResponseErrorsInner.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ProjectsMoveCard403ResponseErrorsInner',
      json,
      () => ProjectsMoveCard403ResponseErrorsInner(
        code: json['code'] as String?,
        message: json['message'] as String?,
        resource: json['resource'] as String?,
        field: json['field'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ProjectsMoveCard403ResponseErrorsInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ProjectsMoveCard403ResponseErrorsInner.fromJson(json);
  }

  final String? code;
  final String? message;
  final String? resource;
  final String? field;

  /// Converts a [ProjectsMoveCard403ResponseErrorsInner]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (code != null) 'code': code,
      if (message != null) 'message': message,
      if (resource != null) 'resource': resource,
      if (field != null) 'field': field,
    };
  }

  @override
  int get hashCode => Object.hashAll([code, message, resource, field]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ProjectsMoveCard403ResponseErrorsInner &&
        code == other.code &&
        message == other.message &&
        resource == other.resource &&
        field == other.field;
  }
}
