/// The outcome of the analysis for this particular field
enum AnalyzeLocationEntityFieldState {
  analysisSuggestedValue._('analysisSuggestedValue'),
  analysisSuggestedNoValue._('analysisSuggestedNoValue'),
  needsUserInput._('needsUserInput');

  const AnalyzeLocationEntityFieldState._(this.value);

  /// Creates a AnalyzeLocationEntityFieldState from a json value.
  factory AnalyzeLocationEntityFieldState.fromJson(String json) {
    return AnalyzeLocationEntityFieldState.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown AnalyzeLocationEntityFieldState value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static AnalyzeLocationEntityFieldState? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return AnalyzeLocationEntityFieldState.fromJson(json);
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
