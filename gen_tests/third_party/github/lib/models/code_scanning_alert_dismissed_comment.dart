// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:github/api_exception.dart';

/// The dismissal comment associated with the dismissal of the alert.
extension type const CodeScanningAlertDismissedComment._(String value) {
  CodeScanningAlertDismissedComment(this.value) {
    value.validate(maxLength: 280);
  }

  factory CodeScanningAlertDismissedComment.fromJson(String json) =>
      CodeScanningAlertDismissedComment(json);

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodeScanningAlertDismissedComment? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return CodeScanningAlertDismissedComment.fromJson(json);
  }

  String toJson() => value;
}
