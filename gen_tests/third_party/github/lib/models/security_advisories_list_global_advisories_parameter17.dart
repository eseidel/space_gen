// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
enum SecurityAdvisoriesListGlobalAdvisoriesParameter17 {
  updated._('updated'),
  published._('published'),
  epssPercentage._('epss_percentage'),
  epssPercentile._('epss_percentile');

  const SecurityAdvisoriesListGlobalAdvisoriesParameter17._(this.value);

  /// Creates a SecurityAdvisoriesListGlobalAdvisoriesParameter17 from a json value.
  factory SecurityAdvisoriesListGlobalAdvisoriesParameter17.fromJson(
    String json,
  ) {
    return SecurityAdvisoriesListGlobalAdvisoriesParameter17.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown SecurityAdvisoriesListGlobalAdvisoriesParameter17 value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static SecurityAdvisoriesListGlobalAdvisoriesParameter17? maybeFromJson(
    String? json,
  ) {
    if (json == null) {
      return null;
    }
    return SecurityAdvisoriesListGlobalAdvisoriesParameter17.fromJson(json);
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
