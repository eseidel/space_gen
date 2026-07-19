import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ProjectsUpdateCardRequest {
  const ProjectsUpdateCardRequest({this.note, this.archived});

  /// Converts a `Map<String, dynamic>` to a [ProjectsUpdateCardRequest].
  factory ProjectsUpdateCardRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ProjectsUpdateCardRequest',
      json,
      () => ProjectsUpdateCardRequest(
        note: json['note'] as String?,
        archived: json['archived'] as bool?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ProjectsUpdateCardRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ProjectsUpdateCardRequest.fromJson(json);
  }

  /// The project card's note
  /// Example: `'Update all gems'`
  final String? note;

  /// Whether or not the card is archived
  /// Example: `false`
  final bool? archived;

  /// Converts a [ProjectsUpdateCardRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'note': note, if (archived != null) 'archived': archived};
  }

  @override
  int get hashCode => Object.hashAll([note, archived]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ProjectsUpdateCardRequest &&
        note == other.note &&
        archived == other.archived;
  }
}
