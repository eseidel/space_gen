// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

sealed class ProjectsCreateCardRequest {
  const ProjectsCreateCardRequest();

  factory ProjectsCreateCardRequest.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('note')) {
      return ProjectsCreateCardRequestOneOf0.fromJson(json);
    }
    if (json.containsKey('content_id')) {
      return ProjectsCreateCardRequestOneOf1.fromJson(json);
    }
    throw FormatException(
      'No variant of ProjectsCreateCardRequest matched json keys: ${json.keys.toList()}',
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ProjectsCreateCardRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ProjectsCreateCardRequest.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class ProjectsCreateCardRequestOneOf0 extends ProjectsCreateCardRequest {
  const ProjectsCreateCardRequestOneOf0({required this.note});

  /// Converts a `Map<String, dynamic>` to a [ProjectsCreateCardRequestOneOf0].
  factory ProjectsCreateCardRequestOneOf0.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ProjectsCreateCardRequestOneOf0',
      json,
      () => ProjectsCreateCardRequestOneOf0(
        note: checkedKey(json, 'note') as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ProjectsCreateCardRequestOneOf0? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ProjectsCreateCardRequestOneOf0.fromJson(json);
  }

  /// The project card's note
  /// Example: `'Update all gems'`
  final String? note;

  /// Converts a [ProjectsCreateCardRequestOneOf0] to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {'note': note};
  }

  @override
  int get hashCode => note.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ProjectsCreateCardRequestOneOf0 && note == other.note;
  }
}

@immutable
final class ProjectsCreateCardRequestOneOf1 extends ProjectsCreateCardRequest {
  const ProjectsCreateCardRequestOneOf1({
    required this.contentId,
    required this.contentType,
  });

  /// Converts a `Map<String, dynamic>` to a [ProjectsCreateCardRequestOneOf1].
  factory ProjectsCreateCardRequestOneOf1.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ProjectsCreateCardRequestOneOf1',
      json,
      () => ProjectsCreateCardRequestOneOf1(
        contentId: json['content_id'] as int,
        contentType: json['content_type'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ProjectsCreateCardRequestOneOf1? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ProjectsCreateCardRequestOneOf1.fromJson(json);
  }

  /// The unique identifier of the content associated with the card
  /// Example: `42`
  final int contentId;

  /// The piece of content associated with the card
  /// Example: `'PullRequest'`
  final String contentType;

  /// Converts a [ProjectsCreateCardRequestOneOf1] to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {'content_id': contentId, 'content_type': contentType};
  }

  @override
  int get hashCode => Object.hashAll([contentId, contentType]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ProjectsCreateCardRequestOneOf1 &&
        contentId == other.contentId &&
        contentType == other.contentType;
  }
}
