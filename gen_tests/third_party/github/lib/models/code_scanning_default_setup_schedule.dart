/// The frequency of the periodic analysis.
enum CodeScanningDefaultSetupSchedule {
  weekly._('weekly');

  const CodeScanningDefaultSetupSchedule._(this.value);

  /// Creates a CodeScanningDefaultSetupSchedule from a json value.
  factory CodeScanningDefaultSetupSchedule.fromJson(String json) {
    return CodeScanningDefaultSetupSchedule.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown CodeScanningDefaultSetupSchedule value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static CodeScanningDefaultSetupSchedule? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return CodeScanningDefaultSetupSchedule.fromJson(json);
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
