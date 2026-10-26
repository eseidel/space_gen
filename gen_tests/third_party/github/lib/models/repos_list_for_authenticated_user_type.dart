enum ReposListForAuthenticatedUserType {
  all._('all'),
  owner._('owner'),
  public._('public'),
  private._('private'),
  member._('member');

  const ReposListForAuthenticatedUserType._(this.value);

  /// Creates a ReposListForAuthenticatedUserType from a json value.
  factory ReposListForAuthenticatedUserType.fromJson(String json) {
    return ReposListForAuthenticatedUserType.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown ReposListForAuthenticatedUserType value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ReposListForAuthenticatedUserType? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ReposListForAuthenticatedUserType.fromJson(json);
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
