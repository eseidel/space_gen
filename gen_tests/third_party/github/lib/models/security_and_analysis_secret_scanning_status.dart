enum SecurityAndAnalysisSecretScanningStatus {
  enabled._('enabled'),
  disabled._('disabled');

  const SecurityAndAnalysisSecretScanningStatus._(this.value);

  /// Creates a SecurityAndAnalysisSecretScanningStatus from a json value.
  factory SecurityAndAnalysisSecretScanningStatus.fromJson(String json) {
    return SecurityAndAnalysisSecretScanningStatus.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown SecurityAndAnalysisSecretScanningStatus value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static SecurityAndAnalysisSecretScanningStatus? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return SecurityAndAnalysisSecretScanningStatus.fromJson(json);
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
