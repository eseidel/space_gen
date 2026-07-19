import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template code_scanning_autofix_commits}
/// Commit an autofix for a code scanning alert
/// {@endtemplate}
@immutable
class CodeScanningAutofixCommits {
  /// {@macro code_scanning_autofix_commits}
  const CodeScanningAutofixCommits({this.targetRef, this.message});

  /// Converts a `Map<String, dynamic>` to a [CodeScanningAutofixCommits].
  factory CodeScanningAutofixCommits.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CodeScanningAutofixCommits',
      json,
      () => CodeScanningAutofixCommits(
        targetRef: json['target_ref'] as String?,
        message: json['message'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodeScanningAutofixCommits? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CodeScanningAutofixCommits.fromJson(json);
  }

  /// The Git reference of target branch for the commit. Branch needs to
  /// already exist.  For more information, see "[Git
  /// References](https://git-scm.com/book/en/v2/Git-Internals-Git-References)"
  /// in the Git documentation.
  final String? targetRef;

  /// Commit message to be used.
  final String? message;

  /// Converts a [CodeScanningAutofixCommits] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'target_ref': targetRef, 'message': message};
  }

  @override
  int get hashCode => Object.hashAll([targetRef, message]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CodeScanningAutofixCommits &&
        targetRef == other.targetRef &&
        message == other.message;
  }
}
