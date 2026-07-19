/// The type of the code security configuration.
enum CodeSecurityConfigurationTargetType {
  global._('global'),
  organization._('organization'),
  enterprise._('enterprise');

  const CodeSecurityConfigurationTargetType._(this.value);

  /// Creates a CodeSecurityConfigurationTargetType from a json value.
  factory CodeSecurityConfigurationTargetType.fromJson(String json) {
    return CodeSecurityConfigurationTargetType.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown CodeSecurityConfigurationTargetType value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static CodeSecurityConfigurationTargetType? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return CodeSecurityConfigurationTargetType.fromJson(json);
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
