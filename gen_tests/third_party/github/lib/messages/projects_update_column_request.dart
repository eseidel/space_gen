// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ProjectsUpdateColumnRequest {
  const ProjectsUpdateColumnRequest({required this.name});

  /// Converts a `Map<String, dynamic>` to a [ProjectsUpdateColumnRequest].
  factory ProjectsUpdateColumnRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ProjectsUpdateColumnRequest',
      json,
      () => ProjectsUpdateColumnRequest(name: json['name'] as String),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ProjectsUpdateColumnRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ProjectsUpdateColumnRequest.fromJson(json);
  }

  /// Name of the project column
  /// Example: `'Remaining tasks'`
  final String name;

  /// Converts a [ProjectsUpdateColumnRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'name': name};
  }

  @override
  int get hashCode => name.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ProjectsUpdateColumnRequest && name == other.name;
  }
}
