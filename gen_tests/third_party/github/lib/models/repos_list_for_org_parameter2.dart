enum ReposListForOrgParameter2 {
  created._('created'),
  updated._('updated'),
  pushed._('pushed'),
  fullName._('full_name');

  const ReposListForOrgParameter2._(this.value);

  /// Creates a ReposListForOrgParameter2 from a json value.
  factory ReposListForOrgParameter2.fromJson(String json) {
    return ReposListForOrgParameter2.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown ReposListForOrgParameter2 value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ReposListForOrgParameter2? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ReposListForOrgParameter2.fromJson(json);
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
