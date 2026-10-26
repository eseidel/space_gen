enum ReposListForUserSort {
  created._('created'),
  updated._('updated'),
  pushed._('pushed'),
  fullName._('full_name');

  const ReposListForUserSort._(this.value);

  /// Creates a ReposListForUserSort from a json value.
  factory ReposListForUserSort.fromJson(String json) {
    return ReposListForUserSort.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown ReposListForUserSort value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ReposListForUserSort? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ReposListForUserSort.fromJson(json);
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
