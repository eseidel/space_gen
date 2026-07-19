// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/checks_update_request_any_of_0_output_annotations_inner_annotation_level.dart';
import 'package:meta/meta.dart';

@immutable
class ChecksUpdateRequestAnyOf0OutputAnnotationsInner {
  const ChecksUpdateRequestAnyOf0OutputAnnotationsInner({
    required this.path,
    required this.startLine,
    required this.endLine,
    required this.annotationLevel,
    required this.message,
    this.startColumn,
    this.endColumn,
    this.title,
    this.rawDetails,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [ChecksUpdateRequestAnyOf0OutputAnnotationsInner].
  factory ChecksUpdateRequestAnyOf0OutputAnnotationsInner.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ChecksUpdateRequestAnyOf0OutputAnnotationsInner',
      json,
      () => ChecksUpdateRequestAnyOf0OutputAnnotationsInner(
        path: json['path'] as String,
        startLine: json['start_line'] as int,
        endLine: json['end_line'] as int,
        startColumn: json['start_column'] as int?,
        endColumn: json['end_column'] as int?,
        annotationLevel:
            ChecksUpdateRequestAnyOf0OutputAnnotationsInnerAnnotationLevel.fromJson(
              json['annotation_level'] as String,
            ),
        message: json['message'] as String,
        title: json['title'] as String?,
        rawDetails: json['raw_details'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ChecksUpdateRequestAnyOf0OutputAnnotationsInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ChecksUpdateRequestAnyOf0OutputAnnotationsInner.fromJson(json);
  }

  /// The path of the file to add an annotation to. For example,
  /// `assets/css/main.css`.
  final String path;

  /// The start line of the annotation. Line numbers start at 1.
  final int startLine;

  /// The end line of the annotation.
  final int endLine;

  /// The start column of the annotation. Annotations only support
  /// `start_column` and `end_column` on the same line. Omit this parameter if
  /// `start_line` and `end_line` have different values. Column numbers start
  /// at 1.
  final int? startColumn;

  /// The end column of the annotation. Annotations only support
  /// `start_column` and `end_column` on the same line. Omit this parameter if
  /// `start_line` and `end_line` have different values.
  final int? endColumn;

  /// The level of the annotation.
  final ChecksUpdateRequestAnyOf0OutputAnnotationsInnerAnnotationLevel
  annotationLevel;

  /// A short description of the feedback for these lines of code. The maximum
  /// size is 64 KB.
  final String message;

  /// The title that represents the annotation. The maximum size is 255
  /// characters.
  final String? title;

  /// Details about this annotation. The maximum size is 64 KB.
  final String? rawDetails;

  /// Converts a [ChecksUpdateRequestAnyOf0OutputAnnotationsInner]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'path': path,
      'start_line': startLine,
      'end_line': endLine,
      'start_column': startColumn,
      'end_column': endColumn,
      'annotation_level': annotationLevel.toJson(),
      'message': message,
      'title': title,
      'raw_details': rawDetails,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    path,
    startLine,
    endLine,
    startColumn,
    endColumn,
    annotationLevel,
    message,
    title,
    rawDetails,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ChecksUpdateRequestAnyOf0OutputAnnotationsInner &&
        path == other.path &&
        startLine == other.startLine &&
        endLine == other.endLine &&
        startColumn == other.startColumn &&
        endColumn == other.endColumn &&
        annotationLevel == other.annotationLevel &&
        message == other.message &&
        title == other.title &&
        rawDetails == other.rawDetails;
  }
}
