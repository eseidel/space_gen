enum ReposListForUserParameter2 {
  created._('created'),
  updated._('updated'),
  pushed._('pushed'),
  fullName._('full_name');

  const ReposListForUserParameter2._(this.value);

  /// Creates a ReposListForUserParameter2 from a json value.
  factory ReposListForUserParameter2.fromJson(String json) {
    return ReposListForUserParameter2.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown ReposListForUserParameter2 value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ReposListForUserParameter2? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ReposListForUserParameter2.fromJson(json);
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
