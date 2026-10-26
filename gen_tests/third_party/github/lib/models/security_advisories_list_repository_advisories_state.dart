// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
enum SecurityAdvisoriesListRepositoryAdvisoriesState {
  triage._('triage'),
  draft._('draft'),
  published._('published'),
  closed._('closed');

  const SecurityAdvisoriesListRepositoryAdvisoriesState._(this.value);

  /// Creates a SecurityAdvisoriesListRepositoryAdvisoriesState from a json value.
  factory SecurityAdvisoriesListRepositoryAdvisoriesState.fromJson(
    String json,
  ) {
    return SecurityAdvisoriesListRepositoryAdvisoriesState.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown SecurityAdvisoriesListRepositoryAdvisoriesState value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static SecurityAdvisoriesListRepositoryAdvisoriesState? maybeFromJson(
    String? json,
  ) {
    if (json == null) {
      return null;
    }
    return SecurityAdvisoriesListRepositoryAdvisoriesState.fromJson(json);
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
