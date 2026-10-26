enum ReposListForAuthenticatedUserSort {
  created._('created'),
  updated._('updated'),
  pushed._('pushed'),
  fullName._('full_name');

  const ReposListForAuthenticatedUserSort._(this.value);

  /// Creates a ReposListForAuthenticatedUserSort from a json value.
  factory ReposListForAuthenticatedUserSort.fromJson(String json) {
    return ReposListForAuthenticatedUserSort.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown ReposListForAuthenticatedUserSort value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ReposListForAuthenticatedUserSort? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ReposListForAuthenticatedUserSort.fromJson(json);
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
