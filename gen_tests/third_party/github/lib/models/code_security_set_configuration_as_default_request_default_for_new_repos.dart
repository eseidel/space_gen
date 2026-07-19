// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
/// Specify which types of repository this security configuration should be
/// applied to by default.
enum CodeSecuritySetConfigurationAsDefaultRequestDefaultForNewRepos {
  all._('all'),
  none._('none'),
  privateAndInternal._('private_and_internal'),
  public._('public');

  const CodeSecuritySetConfigurationAsDefaultRequestDefaultForNewRepos._(
    this.value,
  );

  /// Creates a CodeSecuritySetConfigurationAsDefaultRequestDefaultForNewRepos from a json value.
  factory CodeSecuritySetConfigurationAsDefaultRequestDefaultForNewRepos.fromJson(
    String json,
  ) {
    return CodeSecuritySetConfigurationAsDefaultRequestDefaultForNewRepos.values
        .firstWhere(
          (value) => value.value == json,
          orElse: () => throw FormatException(
            'Unknown CodeSecuritySetConfigurationAsDefaultRequestDefaultForNewRepos value: $json',
          ),
        );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static CodeSecuritySetConfigurationAsDefaultRequestDefaultForNewRepos?
  maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return CodeSecuritySetConfigurationAsDefaultRequestDefaultForNewRepos.fromJson(
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
