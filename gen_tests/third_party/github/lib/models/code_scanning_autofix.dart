import 'package:github/model_helpers.dart';
import 'package:github/models/code_scanning_autofix_description.dart';
import 'package:github/models/code_scanning_autofix_started_at.dart';
import 'package:github/models/code_scanning_autofix_status.dart';
import 'package:meta/meta.dart';

@immutable
class CodeScanningAutofix {
  const CodeScanningAutofix({
    required this.status,
    required this.description,
    required this.startedAt,
  });

  /// Converts a `Map<String, dynamic>` to a [CodeScanningAutofix].
  factory CodeScanningAutofix.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CodeScanningAutofix',
      json,
      () => CodeScanningAutofix(
        status: CodeScanningAutofixStatus.fromJson(json['status'] as String),
        description: CodeScanningAutofixDescription.maybeFromJson(
          checkedKey(json, 'description') as String?,
        ),
        startedAt: CodeScanningAutofixStartedAt.fromJson(
          json['started_at'] as String,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodeScanningAutofix? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CodeScanningAutofix.fromJson(json);
  }

  /// The status of an autofix.
  final CodeScanningAutofixStatus status;

  /// The description of an autofix.
  final CodeScanningAutofixDescription? description;

  /// The start time of an autofix in ISO 8601 format: `YYYY-MM-DDTHH:MM:SSZ`.
  final CodeScanningAutofixStartedAt startedAt;

  /// Converts a [CodeScanningAutofix] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'status': status.toJson(),
      'description': description?.toJson(),
      'started_at': startedAt.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([status, description, startedAt]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CodeScanningAutofix &&
        status == other.status &&
        description == other.description &&
        startedAt == other.startedAt;
  }
}
