// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:github/api_exception.dart';

/// The SHA of the commit to which the analysis you are uploading relates.
extension type const CodeScanningAnalysisCommitSha._(String value) {
  CodeScanningAnalysisCommitSha(this.value) {
    value.validate(minLength: 40, maxLength: 40, pattern: r'^[0-9a-fA-F]+$');
  }

  factory CodeScanningAnalysisCommitSha.fromJson(String json) =>
      CodeScanningAnalysisCommitSha(json);

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodeScanningAnalysisCommitSha? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return CodeScanningAnalysisCommitSha.fromJson(json);
  }

  String toJson() => value;
}
