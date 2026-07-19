import 'package:meta/meta.dart';

@immutable
class ProjectsMoveColumn201Response {
  const ProjectsMoveColumn201Response();

  /// Converts a `Map<String, dynamic>` to a [ProjectsMoveColumn201Response].
  factory ProjectsMoveColumn201Response.fromJson(Map<String, dynamic> _) {
    return const ProjectsMoveColumn201Response();
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ProjectsMoveColumn201Response? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ProjectsMoveColumn201Response.fromJson(json);
  }

  Map<String, dynamic> toJson() => const {};
}
