enum InstallationTokenRepositorySelection {
  all._('all'),
  selected._('selected');

  const InstallationTokenRepositorySelection._(this.value);

  /// Creates a InstallationTokenRepositorySelection from a json value.
  factory InstallationTokenRepositorySelection.fromJson(String json) {
    return InstallationTokenRepositorySelection.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown InstallationTokenRepositorySelection value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static InstallationTokenRepositorySelection? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return InstallationTokenRepositorySelection.fromJson(json);
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
