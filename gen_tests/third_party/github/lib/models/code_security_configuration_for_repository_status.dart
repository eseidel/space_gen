/// The attachment status of the code security configuration on the repository.
enum CodeSecurityConfigurationForRepositoryStatus {
  attached._('attached'),
  attaching._('attaching'),
  detached._('detached'),
  removed._('removed'),
  enforced._('enforced'),
  failed._('failed'),
  updating._('updating'),
  removedByEnterprise._('removed_by_enterprise');

  const CodeSecurityConfigurationForRepositoryStatus._(this.value);

  /// Creates a CodeSecurityConfigurationForRepositoryStatus from a json value.
  factory CodeSecurityConfigurationForRepositoryStatus.fromJson(String json) {
    return CodeSecurityConfigurationForRepositoryStatus.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown CodeSecurityConfigurationForRepositoryStatus value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static CodeSecurityConfigurationForRepositoryStatus? maybeFromJson(
    String? json,
  ) {
    if (json == null) {
      return null;
    }
    return CodeSecurityConfigurationForRepositoryStatus.fromJson(json);
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
