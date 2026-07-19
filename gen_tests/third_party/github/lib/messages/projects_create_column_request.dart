import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ProjectsCreateColumnRequest {
  const ProjectsCreateColumnRequest({required this.name});

  /// Converts a `Map<String, dynamic>` to a [ProjectsCreateColumnRequest].
  factory ProjectsCreateColumnRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ProjectsCreateColumnRequest',
      json,
      () => ProjectsCreateColumnRequest(name: json['name'] as String),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ProjectsCreateColumnRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ProjectsCreateColumnRequest.fromJson(json);
  }

  /// Name of the project column
  /// Example: `'Remaining tasks'`
  final String name;

  /// Converts a [ProjectsCreateColumnRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'name': name};
  }

  @override
  int get hashCode => name.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ProjectsCreateColumnRequest && name == other.name;
  }
}
