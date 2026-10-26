enum ReposListForOrgType {
  all._('all'),
  public._('public'),
  private._('private'),
  forks._('forks'),
  sources._('sources'),
  member._('member');

  const ReposListForOrgType._(this.value);

  /// Creates a ReposListForOrgType from a json value.
  factory ReposListForOrgType.fromJson(String json) {
    return ReposListForOrgType.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown ReposListForOrgType value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ReposListForOrgType? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ReposListForOrgType.fromJson(json);
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
