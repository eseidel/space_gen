enum ReposListForOrgDirection {
  asc._('asc'),
  desc._('desc');

  const ReposListForOrgDirection._(this.value);

  /// Creates a ReposListForOrgDirection from a json value.
  factory ReposListForOrgDirection.fromJson(String json) {
    return ReposListForOrgDirection.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown ReposListForOrgDirection value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ReposListForOrgDirection? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ReposListForOrgDirection.fromJson(json);
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
