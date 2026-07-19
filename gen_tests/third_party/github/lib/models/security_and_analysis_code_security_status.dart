enum SecurityAndAnalysisCodeSecurityStatus {
  enabled._('enabled'),
  disabled._('disabled');

  const SecurityAndAnalysisCodeSecurityStatus._(this.value);

  /// Creates a SecurityAndAnalysisCodeSecurityStatus from a json value.
  factory SecurityAndAnalysisCodeSecurityStatus.fromJson(String json) {
    return SecurityAndAnalysisCodeSecurityStatus.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown SecurityAndAnalysisCodeSecurityStatus value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static SecurityAndAnalysisCodeSecurityStatus? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return SecurityAndAnalysisCodeSecurityStatus.fromJson(json);
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
