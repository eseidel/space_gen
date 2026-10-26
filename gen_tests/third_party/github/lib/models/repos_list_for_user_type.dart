enum ReposListForUserType {
  all._('all'),
  owner._('owner'),
  member._('member');

  const ReposListForUserType._(this.value);

  /// Creates a ReposListForUserType from a json value.
  factory ReposListForUserType.fromJson(String json) {
    return ReposListForUserType.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown ReposListForUserType value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ReposListForUserType? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ReposListForUserType.fromJson(json);
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
