import 'package:github/model_helpers.dart';
import 'package:github/models/projects_move_card403_response_errors_inner.dart';
import 'package:meta/meta.dart';

@immutable
class ProjectsMoveCard403Response {
  const ProjectsMoveCard403Response({
    this.message,
    this.documentationUrl,
    this.errors,
  });

  /// Converts a `Map<String, dynamic>` to a [ProjectsMoveCard403Response].
  factory ProjectsMoveCard403Response.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ProjectsMoveCard403Response',
      json,
      () => ProjectsMoveCard403Response(
        message: json['message'] as String?,
        documentationUrl: json['documentation_url'] as String?,
        errors: (json['errors'] as List?)
            ?.map<ProjectsMoveCard403ResponseErrorsInner>(
              (e) => ProjectsMoveCard403ResponseErrorsInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ProjectsMoveCard403Response? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ProjectsMoveCard403Response.fromJson(json);
  }

  final String? message;
  final String? documentationUrl;
  final List<ProjectsMoveCard403ResponseErrorsInner>? errors;

  /// Converts a [ProjectsMoveCard403Response] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'message': ?message,
      'documentation_url': ?documentationUrl,
      'errors': ?errors?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([message, documentationUrl, listHash(errors)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ProjectsMoveCard403Response &&
        message == other.message &&
        documentationUrl == other.documentationUrl &&
        listsEqual(errors, other.errors);
  }
}
