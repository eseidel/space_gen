/// The author of the advisory.
sealed class RepositoryAdvisoryAuthor {
  const RepositoryAdvisoryAuthor();

  factory RepositoryAdvisoryAuthor.fromJson(dynamic json) {
    return switch (json) {
      _ => throw FormatException(
        'Unsupported shape for RepositoryAdvisoryAuthor: ${json.runtimeType}',
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryAdvisoryAuthor? maybeFromJson(dynamic json) {
    if (json == null) {
      return null;
    }
    return RepositoryAdvisoryAuthor.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  dynamic toJson();
}
