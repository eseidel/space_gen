// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
/// Specifies which types of repository this security configuration is applied
/// to by default.
enum CodeSecuritySetConfigurationAsDefault200ResponseDefaultForNewRepos {
  all._('all'),
  none._('none'),
  privateAndInternal._('private_and_internal'),
  public._('public');

  const CodeSecuritySetConfigurationAsDefault200ResponseDefaultForNewRepos._(
    this.value,
  );

  /// Creates a CodeSecuritySetConfigurationAsDefault200ResponseDefaultForNewRepos from a json value.
  factory CodeSecuritySetConfigurationAsDefault200ResponseDefaultForNewRepos.fromJson(
    String json,
  ) {
    return CodeSecuritySetConfigurationAsDefault200ResponseDefaultForNewRepos
        .values
        .firstWhere(
          (value) => value.value == json,
          orElse: () => throw FormatException(
            'Unknown CodeSecuritySetConfigurationAsDefault200ResponseDefaultForNewRepos value: $json',
          ),
        );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static CodeSecuritySetConfigurationAsDefault200ResponseDefaultForNewRepos?
  maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return CodeSecuritySetConfigurationAsDefault200ResponseDefaultForNewRepos.fromJson(
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
