/// The size of the deposit. This value indicates how much can be extracted from
/// the survey before it is exhausted.
enum SurveySize {
  small._('SMALL'),
  moderate._('MODERATE'),
  large._('LARGE');

  const SurveySize._(this.value);

  /// Creates a SurveySize from a json value.
  factory SurveySize.fromJson(String json) {
    return SurveySize.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException('Unknown SurveySize value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static SurveySize? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return SurveySize.fromJson(json);
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
