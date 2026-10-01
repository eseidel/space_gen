// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
/// The enablement status of secret scanning
enum CodeSecurityConfigurationSecretScanning {
  enabled._('enabled'),
  disabled._('disabled'),
  notSet._('not_set');

  const CodeSecurityConfigurationSecretScanning._(this.value);

  /// Creates a CodeSecurityConfigurationSecretScanning from a json value.
  factory CodeSecurityConfigurationSecretScanning.fromJson(String json) {
    return CodeSecurityConfigurationSecretScanning.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown CodeSecurityConfigurationSecretScanning value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static CodeSecurityConfigurationSecretScanning? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return CodeSecurityConfigurationSecretScanning.fromJson(json);
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
