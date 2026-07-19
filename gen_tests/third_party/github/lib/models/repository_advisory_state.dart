/// The state of the advisory.
enum RepositoryAdvisoryState {
  published._('published'),
  closed._('closed'),
  withdrawn._('withdrawn'),
  draft._('draft'),
  triage._('triage');

  const RepositoryAdvisoryState._(this.value);

  /// Creates a RepositoryAdvisoryState from a json value.
  factory RepositoryAdvisoryState.fromJson(String json) {
    return RepositoryAdvisoryState.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown RepositoryAdvisoryState value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static RepositoryAdvisoryState? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return RepositoryAdvisoryState.fromJson(json);
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
