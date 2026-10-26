enum SecurityAdvisoriesListGlobalAdvisoriesSort {
  updated._('updated'),
  published._('published'),
  epssPercentage._('epss_percentage'),
  epssPercentile._('epss_percentile');

  const SecurityAdvisoriesListGlobalAdvisoriesSort._(this.value);

  /// Creates a SecurityAdvisoriesListGlobalAdvisoriesSort from a json value.
  factory SecurityAdvisoriesListGlobalAdvisoriesSort.fromJson(String json) {
    return SecurityAdvisoriesListGlobalAdvisoriesSort.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown SecurityAdvisoriesListGlobalAdvisoriesSort value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static SecurityAdvisoriesListGlobalAdvisoriesSort? maybeFromJson(
    String? json,
  ) {
    if (json == null) {
      return null;
    }
    return SecurityAdvisoriesListGlobalAdvisoriesSort.fromJson(json);
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
