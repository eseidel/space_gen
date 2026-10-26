enum ReposListForksSort {
  newest._('newest'),
  oldest._('oldest'),
  stargazers._('stargazers'),
  watchers._('watchers');

  const ReposListForksSort._(this.value);

  /// Creates a ReposListForksSort from a json value.
  factory ReposListForksSort.fromJson(String json) {
    return ReposListForksSort.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown ReposListForksSort value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ReposListForksSort? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ReposListForksSort.fromJson(json);
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
