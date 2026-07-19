import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ProjectsDeleteCard403Response {
  const ProjectsDeleteCard403Response({
    this.message,
    this.documentationUrl,
    this.errors,
  });

  /// Converts a `Map<String, dynamic>` to a [ProjectsDeleteCard403Response].
  factory ProjectsDeleteCard403Response.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ProjectsDeleteCard403Response',
      json,
      () => ProjectsDeleteCard403Response(
        message: json['message'] as String?,
        documentationUrl: json['documentation_url'] as String?,
        errors: (json['errors'] as List?)?.cast<String>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ProjectsDeleteCard403Response? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ProjectsDeleteCard403Response.fromJson(json);
  }

  final String? message;
  final String? documentationUrl;
  final List<String>? errors;

  /// Converts a [ProjectsDeleteCard403Response] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'message': ?message,
      'documentation_url': ?documentationUrl,
      'errors': ?errors,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([message, documentationUrl, listHash(errors)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ProjectsDeleteCard403Response &&
        message == other.message &&
        documentationUrl == other.documentationUrl &&
        listsEqual(errors, other.errors);
  }
}
