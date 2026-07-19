/// The enablement status of GitHub Advanced Security
enum CodeSecurityConfigurationAdvancedSecurity {
  enabled._('enabled'),
  disabled._('disabled'),
  codeSecurity._('code_security'),
  secretProtection._('secret_protection');

  const CodeSecurityConfigurationAdvancedSecurity._(this.value);

  /// Creates a CodeSecurityConfigurationAdvancedSecurity from a json value.
  factory CodeSecurityConfigurationAdvancedSecurity.fromJson(String json) {
    return CodeSecurityConfigurationAdvancedSecurity.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown CodeSecurityConfigurationAdvancedSecurity value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static CodeSecurityConfigurationAdvancedSecurity? maybeFromJson(
    String? json,
  ) {
    if (json == null) {
      return null;
    }
    return CodeSecurityConfigurationAdvancedSecurity.fromJson(json);
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
