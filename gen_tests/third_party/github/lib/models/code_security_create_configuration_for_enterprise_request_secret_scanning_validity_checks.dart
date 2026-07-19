// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
/// The enablement status of secret scanning validity checks
enum CodeSecurityCreateConfigurationForEnterpriseRequestSecretScanningValidityChecks {
  enabled._('enabled'),
  disabled._('disabled'),
  notSet._('not_set');

  const CodeSecurityCreateConfigurationForEnterpriseRequestSecretScanningValidityChecks._(
    this.value,
  );

  /// Creates a CodeSecurityCreateConfigurationForEnterpriseRequestSecretScanningValidityChecks from a json value.
  factory CodeSecurityCreateConfigurationForEnterpriseRequestSecretScanningValidityChecks.fromJson(
    String json,
  ) {
    return CodeSecurityCreateConfigurationForEnterpriseRequestSecretScanningValidityChecks
        .values
        .firstWhere(
          (value) => value.value == json,
          orElse: () => throw FormatException(
            'Unknown CodeSecurityCreateConfigurationForEnterpriseRequestSecretScanningValidityChecks value: $json',
          ),
        );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static CodeSecurityCreateConfigurationForEnterpriseRequestSecretScanningValidityChecks?
  maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return CodeSecurityCreateConfigurationForEnterpriseRequestSecretScanningValidityChecks.fromJson(
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
