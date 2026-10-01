// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
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
