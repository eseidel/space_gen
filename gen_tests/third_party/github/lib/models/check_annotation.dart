import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template check_annotation}
/// Check Annotation
/// Check Annotation
/// {@endtemplate}
@immutable
class CheckAnnotation {
  /// {@macro check_annotation}
  const CheckAnnotation({
    required this.path,
    required this.startLine,
    required this.endLine,
    required this.startColumn,
    required this.endColumn,
    required this.annotationLevel,
    required this.title,
    required this.message,
    required this.rawDetails,
    required this.blobHref,
  });

  /// Converts a `Map<String, dynamic>` to a [CheckAnnotation].
  factory CheckAnnotation.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CheckAnnotation',
      json,
      () => CheckAnnotation(
        path: json['path'] as String,
        startLine: json['start_line'] as int,
        endLine: json['end_line'] as int,
        startColumn: checkedKey(json, 'start_column') as int?,
        endColumn: checkedKey(json, 'end_column') as int?,
        annotationLevel: checkedKey(json, 'annotation_level') as String?,
        title: checkedKey(json, 'title') as String?,
        message: checkedKey(json, 'message') as String?,
        rawDetails: checkedKey(json, 'raw_details') as String?,
        blobHref: json['blob_href'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CheckAnnotation? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CheckAnnotation.fromJson(json);
  }

  /// Example: `'README.md'`
  final String path;

  /// Example: `2`
  final int startLine;

  /// Example: `2`
  final int endLine;

  /// Example: `5`
  final int? startColumn;

  /// Example: `10`
  final int? endColumn;

  /// Example: `'warning'`
  final String? annotationLevel;

  /// Example: `'Spell Checker'`
  final String? title;

  /// Example: `'Check your spelling for \'banaas\'.'`
  final String? message;

  /// Example: `'Do you mean \'bananas\' or \'banana\'?'`
  final String? rawDetails;
  final String blobHref;

  /// Converts a [CheckAnnotation] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'path': path,
      'start_line': startLine,
      'end_line': endLine,
      'start_column': startColumn,
      'end_column': endColumn,
      'annotation_level': annotationLevel,
      'title': title,
      'message': message,
      'raw_details': rawDetails,
      'blob_href': blobHref,
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
    title,
    message,
    rawDetails,
    blobHref,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CheckAnnotation &&
        path == other.path &&
        startLine == other.startLine &&
        endLine == other.endLine &&
        startColumn == other.startColumn &&
        endColumn == other.endColumn &&
        annotationLevel == other.annotationLevel &&
        title == other.title &&
        message == other.message &&
        rawDetails == other.rawDetails &&
        blobHref == other.blobHref;
  }
}
