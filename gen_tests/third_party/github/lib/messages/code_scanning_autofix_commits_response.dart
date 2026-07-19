import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class CodeScanningAutofixCommitsResponse {
  const CodeScanningAutofixCommitsResponse({this.targetRef, this.sha});

  /// Converts a `Map<String, dynamic>` to a
  /// [CodeScanningAutofixCommitsResponse].
  factory CodeScanningAutofixCommitsResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'CodeScanningAutofixCommitsResponse',
      json,
      () => CodeScanningAutofixCommitsResponse(
        targetRef: json['target_ref'] as String?,
        sha: json['sha'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodeScanningAutofixCommitsResponse? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CodeScanningAutofixCommitsResponse.fromJson(json);
  }

  /// The Git reference of target branch for the commit. For more information,
  /// see "[Git
  /// References](https://git-scm.com/book/en/v2/Git-Internals-Git-References)"
  /// in the Git documentation.
  final String? targetRef;

  /// SHA of commit with autofix.
  final String? sha;

  /// Converts a [CodeScanningAutofixCommitsResponse]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (targetRef != null) 'target_ref': targetRef,
      if (sha != null) 'sha': sha,
    };
  }

  @override
  int get hashCode => Object.hashAll([targetRef, sha]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CodeScanningAutofixCommitsResponse &&
        targetRef == other.targetRef &&
        sha == other.sha;
  }
}
