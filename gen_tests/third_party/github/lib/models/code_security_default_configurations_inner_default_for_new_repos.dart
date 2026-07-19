// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
/// The visibility of newly created repositories for which the code security
/// configuration will be applied to by default
enum CodeSecurityDefaultConfigurationsInnerDefaultForNewRepos {
  public._('public'),
  privateAndInternal._('private_and_internal'),
  all._('all');

  const CodeSecurityDefaultConfigurationsInnerDefaultForNewRepos._(this.value);

  /// Creates a CodeSecurityDefaultConfigurationsInnerDefaultForNewRepos from a json value.
  factory CodeSecurityDefaultConfigurationsInnerDefaultForNewRepos.fromJson(
    String json,
  ) {
    return CodeSecurityDefaultConfigurationsInnerDefaultForNewRepos.values
        .firstWhere(
          (value) => value.value == json,
          orElse: () => throw FormatException(
            'Unknown CodeSecurityDefaultConfigurationsInnerDefaultForNewRepos value: $json',
          ),
        );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static CodeSecurityDefaultConfigurationsInnerDefaultForNewRepos?
  maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return CodeSecurityDefaultConfigurationsInnerDefaultForNewRepos.fromJson(
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
