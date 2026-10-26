enum CodeSecurityGetConfigurationsForOrgTargetType {
  global._('global'),
  all._('all');

  const CodeSecurityGetConfigurationsForOrgTargetType._(this.value);

  /// Creates a CodeSecurityGetConfigurationsForOrgTargetType from a json value.
  factory CodeSecurityGetConfigurationsForOrgTargetType.fromJson(String json) {
    return CodeSecurityGetConfigurationsForOrgTargetType.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown CodeSecurityGetConfigurationsForOrgTargetType value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static CodeSecurityGetConfigurationsForOrgTargetType? maybeFromJson(
    String? json,
  ) {
    if (json == null) {
      return null;
    }
    return CodeSecurityGetConfigurationsForOrgTargetType.fromJson(json);
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
