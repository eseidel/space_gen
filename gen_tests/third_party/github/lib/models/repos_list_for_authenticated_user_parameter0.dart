enum ReposListForAuthenticatedUserParameter0 {
  all._('all'),
  public._('public'),
  private._('private');

  const ReposListForAuthenticatedUserParameter0._(this.value);

  /// Creates a ReposListForAuthenticatedUserParameter0 from a json value.
  factory ReposListForAuthenticatedUserParameter0.fromJson(String json) {
    return ReposListForAuthenticatedUserParameter0.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown ReposListForAuthenticatedUserParameter0 value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ReposListForAuthenticatedUserParameter0? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ReposListForAuthenticatedUserParameter0.fromJson(json);
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
