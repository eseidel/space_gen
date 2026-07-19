/// The hosted compute service the network configuration supports.
enum NetworkConfigurationComputeService {
  none._('none'),
  actions._('actions'),
  codespaces._('codespaces');

  const NetworkConfigurationComputeService._(this.value);

  /// Creates a NetworkConfigurationComputeService from a json value.
  factory NetworkConfigurationComputeService.fromJson(String json) {
    return NetworkConfigurationComputeService.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown NetworkConfigurationComputeService value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static NetworkConfigurationComputeService? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return NetworkConfigurationComputeService.fromJson(json);
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
