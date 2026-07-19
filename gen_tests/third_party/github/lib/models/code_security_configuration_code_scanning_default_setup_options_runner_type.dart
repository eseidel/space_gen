// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
/// Whether to use labeled runners or standard GitHub runners.
enum CodeSecurityConfigurationCodeScanningDefaultSetupOptionsRunnerType {
  standard._('standard'),
  labeled._('labeled'),
  notSet._('not_set');

  const CodeSecurityConfigurationCodeScanningDefaultSetupOptionsRunnerType._(
    this.value,
  );

  /// Creates a CodeSecurityConfigurationCodeScanningDefaultSetupOptionsRunnerType from a json value.
  factory CodeSecurityConfigurationCodeScanningDefaultSetupOptionsRunnerType.fromJson(
    String json,
  ) {
    return CodeSecurityConfigurationCodeScanningDefaultSetupOptionsRunnerType
        .values
        .firstWhere(
          (value) => value.value == json,
          orElse: () => throw FormatException(
            'Unknown CodeSecurityConfigurationCodeScanningDefaultSetupOptionsRunnerType value: $json',
          ),
        );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static CodeSecurityConfigurationCodeScanningDefaultSetupOptionsRunnerType?
  maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return CodeSecurityConfigurationCodeScanningDefaultSetupOptionsRunnerType.fromJson(
      json,
    );
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
