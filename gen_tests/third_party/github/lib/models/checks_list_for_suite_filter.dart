enum ChecksListForSuiteFilter {
  latest._('latest'),
  all._('all');

  const ChecksListForSuiteFilter._(this.value);

  /// Creates a ChecksListForSuiteFilter from a json value.
  factory ChecksListForSuiteFilter.fromJson(String json) {
    return ChecksListForSuiteFilter.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown ChecksListForSuiteFilter value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ChecksListForSuiteFilter? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ChecksListForSuiteFilter.fromJson(json);
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
