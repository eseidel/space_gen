// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
enum SecurityAdvisoriesListGlobalAdvisoriesParameter1 {
  reviewed._('reviewed'),
  malware._('malware'),
  unreviewed._('unreviewed');

  const SecurityAdvisoriesListGlobalAdvisoriesParameter1._(this.value);

  /// Creates a SecurityAdvisoriesListGlobalAdvisoriesParameter1 from a json value.
  factory SecurityAdvisoriesListGlobalAdvisoriesParameter1.fromJson(
    String json,
  ) {
    return SecurityAdvisoriesListGlobalAdvisoriesParameter1.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown SecurityAdvisoriesListGlobalAdvisoriesParameter1 value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static SecurityAdvisoriesListGlobalAdvisoriesParameter1? maybeFromJson(
    String? json,
  ) {
    if (json == null) {
      return null;
    }
    return SecurityAdvisoriesListGlobalAdvisoriesParameter1.fromJson(json);
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
