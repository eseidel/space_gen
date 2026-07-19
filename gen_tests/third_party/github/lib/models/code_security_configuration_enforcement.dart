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
