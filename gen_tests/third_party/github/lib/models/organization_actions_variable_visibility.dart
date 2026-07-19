/// Visibility of a variable
enum OrganizationActionsVariableVisibility {
  all._('all'),
  private._('private'),
  selected._('selected');

  const OrganizationActionsVariableVisibility._(this.value);

  /// Creates a OrganizationActionsVariableVisibility from a json value.
  factory OrganizationActionsVariableVisibility.fromJson(String json) {
    return OrganizationActionsVariableVisibility.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown OrganizationActionsVariableVisibility value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static OrganizationActionsVariableVisibility? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return OrganizationActionsVariableVisibility.fromJson(json);
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
