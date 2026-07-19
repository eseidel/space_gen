import 'package:github/model_helpers.dart';
import 'package:github/models/projects_move_card503_response_errors_inner.dart';
import 'package:meta/meta.dart';

@immutable
class ProjectsMoveCard503Response {
  const ProjectsMoveCard503Response({
    this.code,
    this.message,
    this.documentationUrl,
    this.errors,
  });

  /// Converts a `Map<String, dynamic>` to a [ProjectsMoveCard503Response].
  factory ProjectsMoveCard503Response.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ProjectsMoveCard503Response',
      json,
      () => ProjectsMoveCard503Response(
        code: json['code'] as String?,
        message: json['message'] as String?,
        documentationUrl: json['documentation_url'] as String?,
        errors: (json['errors'] as List?)
            ?.map<ProjectsMoveCard503ResponseErrorsInner>(
              (e) => ProjectsMoveCard503ResponseErrorsInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ProjectsMoveCard503Response? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ProjectsMoveCard503Response.fromJson(json);
  }

  final String? code;
  final String? message;
  final String? documentationUrl;
  final List<ProjectsMoveCard503ResponseErrorsInner>? errors;

  /// Converts a [ProjectsMoveCard503Response] to a `Map<String, dynamic>`.
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
    return other is ProjectsMoveCard503Response &&
        code == other.code &&
        message == other.message &&
        documentationUrl == other.documentationUrl &&
        listsEqual(errors, other.errors);
  }
}
