enum ReposListForAuthenticatedUserParameter2 {
  all._('all'),
  owner._('owner'),
  public._('public'),
  private._('private'),
  member._('member');

  const ReposListForAuthenticatedUserParameter2._(this.value);

  /// Creates a ReposListForAuthenticatedUserParameter2 from a json value.
  factory ReposListForAuthenticatedUserParameter2.fromJson(String json) {
    return ReposListForAuthenticatedUserParameter2.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown ReposListForAuthenticatedUserParameter2 value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ReposListForAuthenticatedUserParameter2? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ReposListForAuthenticatedUserParameter2.fromJson(json);
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
