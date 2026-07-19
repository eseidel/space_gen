// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
/// Which type of organization repositories have access to the private registry.
/// `selected` means only the repositories specified by
/// `selected_repository_ids` can access the private registry.
enum OrgPrivateRegistryConfigurationWithSelectedRepositoriesVisibility {
  all._('all'),
  private._('private'),
  selected._('selected');

  const OrgPrivateRegistryConfigurationWithSelectedRepositoriesVisibility._(
    this.value,
  );

  /// Creates a OrgPrivateRegistryConfigurationWithSelectedRepositoriesVisibility from a json value.
  factory OrgPrivateRegistryConfigurationWithSelectedRepositoriesVisibility.fromJson(
    String json,
  ) {
    return OrgPrivateRegistryConfigurationWithSelectedRepositoriesVisibility
        .values
        .firstWhere(
          (value) => value.value == json,
          orElse: () => throw FormatException(
            'Unknown OrgPrivateRegistryConfigurationWithSelectedRepositoriesVisibility value: $json',
          ),
        );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static OrgPrivateRegistryConfigurationWithSelectedRepositoriesVisibility?
  maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return OrgPrivateRegistryConfigurationWithSelectedRepositoriesVisibility.fromJson(
      json,
    );
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
