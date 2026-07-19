/// The severity of the advisory.
enum RepositoryAdvisorySeverity {
  critical._('critical'),
  high._('high'),
  medium._('medium'),
  low._('low');

  const RepositoryAdvisorySeverity._(this.value);

  /// Creates a RepositoryAdvisorySeverity from a json value.
  factory RepositoryAdvisorySeverity.fromJson(String json) {
    return RepositoryAdvisorySeverity.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown RepositoryAdvisorySeverity value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static RepositoryAdvisorySeverity? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return RepositoryAdvisorySeverity.fromJson(json);
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
