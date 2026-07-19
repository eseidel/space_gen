// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
enum SecurityAdvisoriesListOrgRepositoryAdvisoriesParameter2 {
  created._('created'),
  updated._('updated'),
  published._('published');

  const SecurityAdvisoriesListOrgRepositoryAdvisoriesParameter2._(this.value);

  /// Creates a SecurityAdvisoriesListOrgRepositoryAdvisoriesParameter2 from a json value.
  factory SecurityAdvisoriesListOrgRepositoryAdvisoriesParameter2.fromJson(
    String json,
  ) {
    return SecurityAdvisoriesListOrgRepositoryAdvisoriesParameter2.values
        .firstWhere(
          (value) => value.value == json,
          orElse: () => throw FormatException(
            'Unknown SecurityAdvisoriesListOrgRepositoryAdvisoriesParameter2 value: $json',
          ),
        );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static SecurityAdvisoriesListOrgRepositoryAdvisoriesParameter2? maybeFromJson(
    String? json,
  ) {
    if (json == null) {
      return null;
    }
    return SecurityAdvisoriesListOrgRepositoryAdvisoriesParameter2.fromJson(
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
