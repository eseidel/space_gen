enum SecurityAndAnalysisAdvancedSecurityStatus {
  enabled._('enabled'),
  disabled._('disabled');

  const SecurityAndAnalysisAdvancedSecurityStatus._(this.value);

  /// Creates a SecurityAndAnalysisAdvancedSecurityStatus from a json value.
  factory SecurityAndAnalysisAdvancedSecurityStatus.fromJson(String json) {
    return SecurityAndAnalysisAdvancedSecurityStatus.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown SecurityAndAnalysisAdvancedSecurityStatus value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static SecurityAndAnalysisAdvancedSecurityStatus? maybeFromJson(
    String? json,
  ) {
    if (json == null) {
      return null;
    }
    return SecurityAndAnalysisAdvancedSecurityStatus.fromJson(json);
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
