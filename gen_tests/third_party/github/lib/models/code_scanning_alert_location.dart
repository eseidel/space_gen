import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template code_scanning_alert_location}
/// Describe a region within a file for the alert.
/// {@endtemplate}
@immutable
class CodeScanningAlertLocation {
  /// {@macro code_scanning_alert_location}
  const CodeScanningAlertLocation({
    this.path,
    this.startLine,
    this.endLine,
    this.startColumn,
    this.endColumn,
  });

  /// Converts a `Map<String, dynamic>` to a [CodeScanningAlertLocation].
  factory CodeScanningAlertLocation.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CodeScanningAlertLocation',
      json,
      () => CodeScanningAlertLocation(
        path: json['path'] as String?,
        startLine: json['start_line'] as int?,
        endLine: json['end_line'] as int?,
        startColumn: json['start_column'] as int?,
        endColumn: json['end_column'] as int?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodeScanningAlertLocation? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CodeScanningAlertLocation.fromJson(json);
  }

  final String? path;
  final int? startLine;
  final int? endLine;
  final int? startColumn;
  final int? endColumn;

  /// Converts a [CodeScanningAlertLocation] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'path': ?path,
      'start_line': ?startLine,
      'end_line': ?endLine,
      'start_column': ?startColumn,
      'end_column': ?endColumn,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([path, startLine, endLine, startColumn, endColumn]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CodeScanningAlertLocation &&
        path == other.path &&
        startLine == other.startLine &&
        endLine == other.endLine &&
        startColumn == other.startColumn &&
        endColumn == other.endColumn;
  }
}
