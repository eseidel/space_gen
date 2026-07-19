/// The type of repositories to attach the configuration to. `selected` means
/// the configuration will be attached to only the repositories specified by
/// `selected_repository_ids`
enum CodeSecurityAttachConfigurationRequestScope {
  all._('all'),
  allWithoutConfigurations._('all_without_configurations'),
  public._('public'),
  privateOrInternal._('private_or_internal'),
  selected._('selected');

  const CodeSecurityAttachConfigurationRequestScope._(this.value);

  /// Creates a CodeSecurityAttachConfigurationRequestScope from a json value.
  factory CodeSecurityAttachConfigurationRequestScope.fromJson(String json) {
    return CodeSecurityAttachConfigurationRequestScope.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown CodeSecurityAttachConfigurationRequestScope value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static CodeSecurityAttachConfigurationRequestScope? maybeFromJson(
    String? json,
  ) {
    if (json == null) {
      return null;
    }
    return CodeSecurityAttachConfigurationRequestScope.fromJson(json);
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
