// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
/// The publisher of the advisory.
sealed class RepositoryAdvisoryPublisher {
  const RepositoryAdvisoryPublisher();

  factory RepositoryAdvisoryPublisher.fromJson(dynamic json) {
    return switch (json) {
      _ => throw FormatException(
        'Unsupported shape for RepositoryAdvisoryPublisher: ${json.runtimeType}',
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryAdvisoryPublisher? maybeFromJson(dynamic json) {
    if (json == null) {
      return null;
    }
    return RepositoryAdvisoryPublisher.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  dynamic toJson();
}
