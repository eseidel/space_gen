enum ChecksListForSuiteParameter5 {
  latest._('latest'),
  all._('all');

  const ChecksListForSuiteParameter5._(this.value);

  /// Creates a ChecksListForSuiteParameter5 from a json value.
  factory ChecksListForSuiteParameter5.fromJson(String json) {
    return ChecksListForSuiteParameter5.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown ChecksListForSuiteParameter5 value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ChecksListForSuiteParameter5? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ChecksListForSuiteParameter5.fromJson(json);
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
