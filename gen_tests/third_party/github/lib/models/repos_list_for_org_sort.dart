enum ReposListForOrgSort {
  created._('created'),
  updated._('updated'),
  pushed._('pushed'),
  fullName._('full_name');

  const ReposListForOrgSort._(this.value);

  /// Creates a ReposListForOrgSort from a json value.
  factory ReposListForOrgSort.fromJson(String json) {
    return ReposListForOrgSort.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown ReposListForOrgSort value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ReposListForOrgSort? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ReposListForOrgSort.fromJson(json);
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
