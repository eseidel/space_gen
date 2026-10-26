enum SecurityAdvisoriesListGlobalAdvisoriesType {
  reviewed._('reviewed'),
  malware._('malware'),
  unreviewed._('unreviewed');

  const SecurityAdvisoriesListGlobalAdvisoriesType._(this.value);

  /// Creates a SecurityAdvisoriesListGlobalAdvisoriesType from a json value.
  factory SecurityAdvisoriesListGlobalAdvisoriesType.fromJson(String json) {
    return SecurityAdvisoriesListGlobalAdvisoriesType.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown SecurityAdvisoriesListGlobalAdvisoriesType value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static SecurityAdvisoriesListGlobalAdvisoriesType? maybeFromJson(
    String? json,
  ) {
    if (json == null) {
      return null;
    }
    return SecurityAdvisoriesListGlobalAdvisoriesType.fromJson(json);
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
