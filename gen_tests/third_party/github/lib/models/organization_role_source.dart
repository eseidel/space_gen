/// Source answers the question, "where did this role come from?"
enum OrganizationRoleSource {
  organization._('Organization'),
  enterprise._('Enterprise'),
  predefined._('Predefined');

  const OrganizationRoleSource._(this.value);

  /// Creates a OrganizationRoleSource from a json value.
  factory OrganizationRoleSource.fromJson(String json) {
    return OrganizationRoleSource.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown OrganizationRoleSource value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static OrganizationRoleSource? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return OrganizationRoleSource.fromJson(json);
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
