/// The enablement status of Dependency Graph
enum CodeSecurityConfigurationDependencyGraph {
  enabled._('enabled'),
  disabled._('disabled'),
  notSet._('not_set');

  const CodeSecurityConfigurationDependencyGraph._(this.value);

  /// Creates a CodeSecurityConfigurationDependencyGraph from a json value.
  factory CodeSecurityConfigurationDependencyGraph.fromJson(String json) {
    return CodeSecurityConfigurationDependencyGraph.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown CodeSecurityConfigurationDependencyGraph value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static CodeSecurityConfigurationDependencyGraph? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return CodeSecurityConfigurationDependencyGraph.fromJson(json);
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
