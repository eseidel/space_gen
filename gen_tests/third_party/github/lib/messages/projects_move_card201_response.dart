// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:meta/meta.dart';

@immutable
class ProjectsMoveCard201Response {
  const ProjectsMoveCard201Response();

  /// Converts a `Map<String, dynamic>` to a [ProjectsMoveCard201Response].
  factory ProjectsMoveCard201Response.fromJson(Map<String, dynamic> _) {
    return const ProjectsMoveCard201Response();
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ProjectsMoveCard201Response? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ProjectsMoveCard201Response.fromJson(json);
  }

  Map<String, dynamic> toJson() => const {};
}
