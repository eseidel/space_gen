/// Runner type to be used.
enum CodeScanningDefaultSetupUpdateRunnerType {
  standard._('standard'),
  labeled._('labeled');

  const CodeScanningDefaultSetupUpdateRunnerType._(this.value);

  /// Creates a CodeScanningDefaultSetupUpdateRunnerType from a json value.
  factory CodeScanningDefaultSetupUpdateRunnerType.fromJson(String json) {
    return CodeScanningDefaultSetupUpdateRunnerType.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown CodeScanningDefaultSetupUpdateRunnerType value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static CodeScanningDefaultSetupUpdateRunnerType? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return CodeScanningDefaultSetupUpdateRunnerType.fromJson(json);
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
