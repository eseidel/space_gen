/// The type of repositories in the organization that can access the variable.
/// `selected` means only the repositories specified by
/// `selected_repository_ids` can access the variable.
enum ActionsCreateOrgVariableRequestVisibility {
  all._('all'),
  private._('private'),
  selected._('selected');

  const ActionsCreateOrgVariableRequestVisibility._(this.value);

  /// Creates a ActionsCreateOrgVariableRequestVisibility from a json value.
  factory ActionsCreateOrgVariableRequestVisibility.fromJson(String json) {
    return ActionsCreateOrgVariableRequestVisibility.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown ActionsCreateOrgVariableRequestVisibility value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ActionsCreateOrgVariableRequestVisibility? maybeFromJson(
    String? json,
  ) {
    if (json == null) {
      return null;
    }
    return ActionsCreateOrgVariableRequestVisibility.fromJson(json);
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
