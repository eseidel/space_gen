// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
/// A temporary private fork of the advisory's repository for collaborating on a
/// fix.
sealed class RepositoryAdvisoryPrivateFork {
  const RepositoryAdvisoryPrivateFork();

  factory RepositoryAdvisoryPrivateFork.fromJson(dynamic json) {
    return switch (json) {
      _ => throw FormatException(
        'Unsupported shape for RepositoryAdvisoryPrivateFork: ${json.runtimeType}',
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryAdvisoryPrivateFork? maybeFromJson(dynamic json) {
    if (json == null) {
      return null;
    }
    return RepositoryAdvisoryPrivateFork.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  dynamic toJson();
}
