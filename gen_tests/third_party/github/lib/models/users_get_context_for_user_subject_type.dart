enum UsersGetContextForUserSubjectType {
  organization._('organization'),
  repository._('repository'),
  issue._('issue'),
  pullRequest._('pull_request');

  const UsersGetContextForUserSubjectType._(this.value);

  /// Creates a UsersGetContextForUserSubjectType from a json value.
  factory UsersGetContextForUserSubjectType.fromJson(String json) {
    return UsersGetContextForUserSubjectType.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown UsersGetContextForUserSubjectType value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static UsersGetContextForUserSubjectType? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return UsersGetContextForUserSubjectType.fromJson(json);
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
