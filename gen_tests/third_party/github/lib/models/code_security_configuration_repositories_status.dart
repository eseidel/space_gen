/// The attachment status of the code security configuration on the repository.
enum CodeSecurityConfigurationRepositoriesStatus {
  attached._('attached'),
  attaching._('attaching'),
  detached._('detached'),
  removed._('removed'),
  enforced._('enforced'),
  failed._('failed'),
  updating._('updating'),
  removedByEnterprise._('removed_by_enterprise');

  const CodeSecurityConfigurationRepositoriesStatus._(this.value);

  /// Creates a CodeSecurityConfigurationRepositoriesStatus from a json value.
  factory CodeSecurityConfigurationRepositoriesStatus.fromJson(String json) {
    return CodeSecurityConfigurationRepositoriesStatus.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown CodeSecurityConfigurationRepositoriesStatus value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static CodeSecurityConfigurationRepositoriesStatus? maybeFromJson(
    String? json,
  ) {
    if (json == null) {
      return null;
    }
    return CodeSecurityConfigurationRepositoriesStatus.fromJson(json);
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
