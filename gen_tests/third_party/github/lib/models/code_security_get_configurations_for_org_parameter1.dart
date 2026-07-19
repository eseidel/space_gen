enum CodeSecurityGetConfigurationsForOrgParameter1 {
  global._('global'),
  all._('all');

  const CodeSecurityGetConfigurationsForOrgParameter1._(this.value);

  /// Creates a CodeSecurityGetConfigurationsForOrgParameter1 from a json value.
  factory CodeSecurityGetConfigurationsForOrgParameter1.fromJson(String json) {
    return CodeSecurityGetConfigurationsForOrgParameter1.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown CodeSecurityGetConfigurationsForOrgParameter1 value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static CodeSecurityGetConfigurationsForOrgParameter1? maybeFromJson(
    String? json,
  ) {
    if (json == null) {
      return null;
    }
    return CodeSecurityGetConfigurationsForOrgParameter1.fromJson(json);
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
