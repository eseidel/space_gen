/// The severity of the advisory. You must choose between setting this field or
/// `cvss_vector_string`.
enum RepositoryAdvisoryUpdateSeverity {
  critical._('critical'),
  high._('high'),
  medium._('medium'),
  low._('low');

  const RepositoryAdvisoryUpdateSeverity._(this.value);

  /// Creates a RepositoryAdvisoryUpdateSeverity from a json value.
  factory RepositoryAdvisoryUpdateSeverity.fromJson(String json) {
    return RepositoryAdvisoryUpdateSeverity.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown RepositoryAdvisoryUpdateSeverity value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static RepositoryAdvisoryUpdateSeverity? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return RepositoryAdvisoryUpdateSeverity.fromJson(json);
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
