// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
/// The enforcement status for a security configuration
enum CodeSecurityConfigurationEnforcement {
  enforced._('enforced'),
  unenforced._('unenforced');

  const CodeSecurityConfigurationEnforcement._(this.value);

  /// Creates a CodeSecurityConfigurationEnforcement from a json value.
  factory CodeSecurityConfigurationEnforcement.fromJson(String json) {
    return CodeSecurityConfigurationEnforcement.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown CodeSecurityConfigurationEnforcement value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static CodeSecurityConfigurationEnforcement? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return CodeSecurityConfigurationEnforcement.fromJson(json);
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
