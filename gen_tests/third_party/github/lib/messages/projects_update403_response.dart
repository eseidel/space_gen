import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ProjectsUpdate403Response {
  const ProjectsUpdate403Response({
    this.message,
    this.documentationUrl,
    this.errors,
  });

  /// Converts a `Map<String, dynamic>` to a [ProjectsUpdate403Response].
  factory ProjectsUpdate403Response.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ProjectsUpdate403Response',
      json,
      () => ProjectsUpdate403Response(
        message: json['message'] as String?,
        documentationUrl: json['documentation_url'] as String?,
        errors: (json['errors'] as List?)?.cast<String>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ProjectsUpdate403Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ProjectsUpdate403Response.fromJson(json);
  }

  final String? message;
  final String? documentationUrl;
  final List<String>? errors;

  /// Converts a [ProjectsUpdate403Response] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (message != null) 'message': message,
      if (documentationUrl != null) 'documentation_url': documentationUrl,
      if (errors != null) 'errors': errors,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([message, documentationUrl, listHash(errors)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ProjectsUpdate403Response &&
        message == other.message &&
        documentationUrl == other.documentationUrl &&
        listsEqual(errors, other.errors);
  }
}
