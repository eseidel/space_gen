/// The severity of the advisory. You must choose between setting this field or
/// `cvss_vector_string`.
enum RepositoryAdvisoryCreateSeverity {
  critical._('critical'),
  high._('high'),
  medium._('medium'),
  low._('low');

  const RepositoryAdvisoryCreateSeverity._(this.value);

  /// Creates a RepositoryAdvisoryCreateSeverity from a json value.
  factory RepositoryAdvisoryCreateSeverity.fromJson(String json) {
    return RepositoryAdvisoryCreateSeverity.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown RepositoryAdvisoryCreateSeverity value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static RepositoryAdvisoryCreateSeverity? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return RepositoryAdvisoryCreateSeverity.fromJson(json);
  }

  /// The value of the enum.  This is the exact value
  /// from the OpenAPI spec and will be used for network transport.
  final String value;

  /// Converts the enum to its json value.
  String toJson() => value;

  /// Returns the string form of the enum.
  @override
  String toString() => value;
}
