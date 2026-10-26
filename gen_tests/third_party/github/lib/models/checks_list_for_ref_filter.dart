enum ChecksListForRefFilter {
  latest._('latest'),
  all._('all');

  const ChecksListForRefFilter._(this.value);

  /// Creates a ChecksListForRefFilter from a json value.
  factory ChecksListForRefFilter.fromJson(String json) {
    return ChecksListForRefFilter.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown ChecksListForRefFilter value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ChecksListForRefFilter? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ChecksListForRefFilter.fromJson(json);
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
