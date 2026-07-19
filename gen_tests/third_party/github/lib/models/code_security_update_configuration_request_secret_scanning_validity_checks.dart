// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
/// The enablement status of secret scanning validity checks
enum CodeSecurityUpdateConfigurationRequestSecretScanningValidityChecks {
  enabled._('enabled'),
  disabled._('disabled'),
  notSet._('not_set');

  const CodeSecurityUpdateConfigurationRequestSecretScanningValidityChecks._(
    this.value,
  );

  /// Creates a CodeSecurityUpdateConfigurationRequestSecretScanningValidityChecks from a json value.
  factory CodeSecurityUpdateConfigurationRequestSecretScanningValidityChecks.fromJson(
    String json,
  ) {
    return CodeSecurityUpdateConfigurationRequestSecretScanningValidityChecks
        .values
        .firstWhere(
          (value) => value.value == json,
          orElse: () => throw FormatException(
            'Unknown CodeSecurityUpdateConfigurationRequestSecretScanningValidityChecks value: $json',
          ),
        );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static CodeSecurityUpdateConfigurationRequestSecretScanningValidityChecks?
  maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return CodeSecurityUpdateConfigurationRequestSecretScanningValidityChecks.fromJson(
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
