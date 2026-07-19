// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ProjectsCreateForAuthenticatedUserRequest {
  const ProjectsCreateForAuthenticatedUserRequest({
    required this.name,
    this.body,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [ProjectsCreateForAuthenticatedUserRequest].
  factory ProjectsCreateForAuthenticatedUserRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ProjectsCreateForAuthenticatedUserRequest',
      json,
      () => ProjectsCreateForAuthenticatedUserRequest(
        name: json['name'] as String,
        body: json['body'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ProjectsCreateForAuthenticatedUserRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ProjectsCreateForAuthenticatedUserRequest.fromJson(json);
  }

  /// Name of the project
  /// Example: `'Week One Sprint'`
  final String name;

  /// Body of the project
  /// Example: `'This project represents the sprint of the first week in January'`
  final String? body;

  /// Converts a [ProjectsCreateForAuthenticatedUserRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'name': name, 'body': body};
  }

  @override
  int get hashCode => Object.hashAll([name, body]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ProjectsCreateForAuthenticatedUserRequest &&
        name == other.name &&
        body == other.body;
  }
}
