import 'package:github/model_helpers.dart';
import 'package:github/models/projects_create_card503_response_errors_inner.dart';
import 'package:meta/meta.dart';

@immutable
class ProjectsCreateCard503Response {
  const ProjectsCreateCard503Response({
    this.code,
    this.message,
    this.documentationUrl,
    this.errors,
  });

  /// Converts a `Map<String, dynamic>` to a [ProjectsCreateCard503Response].
  factory ProjectsCreateCard503Response.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ProjectsCreateCard503Response',
      json,
      () => ProjectsCreateCard503Response(
        code: json['code'] as String?,
        message: json['message'] as String?,
        documentationUrl: json['documentation_url'] as String?,
        errors: (json['errors'] as List?)
            ?.map<ProjectsCreateCard503ResponseErrorsInner>(
              (e) => ProjectsCreateCard503ResponseErrorsInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ProjectsCreateCard503Response? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ProjectsCreateCard503Response.fromJson(json);
  }

  final String? code;
  final String? message;
  final String? documentationUrl;
  final List<ProjectsCreateCard503ResponseErrorsInner>? errors;

  /// Converts a [ProjectsCreateCard503Response] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (code != null) 'code': code,
      if (message != null) 'message': message,
      if (documentationUrl != null) 'documentation_url': documentationUrl,
      if (errors != null) 'errors': errors?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([code, message, documentationUrl, listHash(errors)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ProjectsCreateCard503Response &&
        code == other.code &&
        message == other.message &&
        documentationUrl == other.documentationUrl &&
        listsEqual(errors, other.errors);
  }
}
