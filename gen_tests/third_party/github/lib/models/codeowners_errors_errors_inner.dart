// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class CodeownersErrorsErrorsInner {
  const CodeownersErrorsErrorsInner({
    required this.line,
    required this.column,
    required this.kind,
    required this.message,
    required this.path,
    this.source,
    this.suggestion,
  });

  /// Converts a `Map<String, dynamic>` to a [CodeownersErrorsErrorsInner].
  factory CodeownersErrorsErrorsInner.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CodeownersErrorsErrorsInner',
      json,
      () => CodeownersErrorsErrorsInner(
        line: json['line'] as int,
        column: json['column'] as int,
        source: json['source'] as String?,
        kind: json['kind'] as String,
        suggestion: json['suggestion'] as String?,
        message: json['message'] as String,
        path: json['path'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodeownersErrorsErrorsInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CodeownersErrorsErrorsInner.fromJson(json);
  }

  /// The line number where this errors occurs.
  /// Example: `7`
  final int line;

  /// The column number where this errors occurs.
  /// Example: `3`
  final int column;

  /// The contents of the line where the error occurs.
  /// Example: `'* user'`
  final String? source;

  /// The type of error.
  /// Example: `'Invalid owner'`
  final String kind;

  /// Suggested action to fix the error. This will usually be `null`, but is
  /// provided for some common errors.
  /// Example: `'The pattern `/` will never match anything, did you mean `*` instead?'`
  final String? suggestion;

  /// A human-readable description of the error, combining information from
  /// multiple fields, laid out for display in a monospaced typeface (for
  /// example, a command-line setting).
  /// Example: `'Invalid owner on line 7:\n\n  * user\n    ^'`
  final String message;

  /// The path of the file where the error occured.
  /// Example: `'.github/CODEOWNERS'`
  final String path;

  /// Converts a [CodeownersErrorsErrorsInner] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'line': line,
      'column': column,
      'source': ?source,
      'kind': kind,
      'suggestion': suggestion,
      'message': message,
      'path': path,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([line, column, source, kind, suggestion, message, path]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CodeownersErrorsErrorsInner &&
        line == other.line &&
        column == other.column &&
        source == other.source &&
        kind == other.kind &&
        suggestion == other.suggestion &&
        message == other.message &&
        path == other.path;
  }
}
