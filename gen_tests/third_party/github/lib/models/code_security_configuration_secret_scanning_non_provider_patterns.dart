// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
/// The enablement status of secret scanning non-provider patterns
enum CodeSecurityConfigurationSecretScanningNonProviderPatterns {
  enabled._('enabled'),
  disabled._('disabled'),
  notSet._('not_set');

  const CodeSecurityConfigurationSecretScanningNonProviderPatterns._(
    this.value,
  );

  /// Creates a CodeSecurityConfigurationSecretScanningNonProviderPatterns from a json value.
  factory CodeSecurityConfigurationSecretScanningNonProviderPatterns.fromJson(
    String json,
  ) {
    return CodeSecurityConfigurationSecretScanningNonProviderPatterns.values
        .firstWhere(
          (value) => value.value == json,
          orElse: () => throw FormatException(
            'Unknown CodeSecurityConfigurationSecretScanningNonProviderPatterns value: $json',
          ),
        );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static CodeSecurityConfigurationSecretScanningNonProviderPatterns?
  maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return CodeSecurityConfigurationSecretScanningNonProviderPatterns.fromJson(
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
