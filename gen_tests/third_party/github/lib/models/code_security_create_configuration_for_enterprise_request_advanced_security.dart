// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
/// The enablement status of GitHub Advanced Security features. `enabled` will
/// enable both Code Security and Secret Protection features.
enum CodeSecurityCreateConfigurationForEnterpriseRequestAdvancedSecurity {
  enabled._('enabled'),
  disabled._('disabled'),
  codeSecurity._('code_security'),
  secretProtection._('secret_protection');

  const CodeSecurityCreateConfigurationForEnterpriseRequestAdvancedSecurity._(
    this.value,
  );

  /// Creates a CodeSecurityCreateConfigurationForEnterpriseRequestAdvancedSecurity from a json value.
  factory CodeSecurityCreateConfigurationForEnterpriseRequestAdvancedSecurity.fromJson(
    String json,
  ) {
    return CodeSecurityCreateConfigurationForEnterpriseRequestAdvancedSecurity
        .values
        .firstWhere(
          (value) => value.value == json,
          orElse: () => throw FormatException(
            'Unknown CodeSecurityCreateConfigurationForEnterpriseRequestAdvancedSecurity value: $json',
          ),
        );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static CodeSecurityCreateConfigurationForEnterpriseRequestAdvancedSecurity?
  maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return CodeSecurityCreateConfigurationForEnterpriseRequestAdvancedSecurity.fromJson(
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
