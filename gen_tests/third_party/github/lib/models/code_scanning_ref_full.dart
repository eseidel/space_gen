import 'package:github/api_exception.dart';

/// The full Git reference, formatted as `refs/heads/<branch name>`,
/// `refs/tags/<tag>`, `refs/pull/<number>/merge`, or `refs/pull/<number>/head`.
/// Example: `'refs/heads/main'`
extension type const CodeScanningRefFull._(String value) {
  CodeScanningRefFull(this.value) {
    value.validate(pattern: r'^refs/(heads|tags|pull)/.*$');
  }

  factory CodeScanningRefFull.fromJson(String json) =>
      CodeScanningRefFull(json);

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodeScanningRefFull? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return CodeScanningRefFull.fromJson(json);
  }

  String toJson() => value;
}
