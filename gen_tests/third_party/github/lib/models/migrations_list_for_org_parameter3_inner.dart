/// Allowed values that can be passed to the exclude param.
/// Example: `'repositories'`
enum MigrationsListForOrgParameter3Inner {
  repositories._('repositories');

  const MigrationsListForOrgParameter3Inner._(this.value);

  /// Creates a MigrationsListForOrgParameter3Inner from a json value.
  factory MigrationsListForOrgParameter3Inner.fromJson(String json) {
    return MigrationsListForOrgParameter3Inner.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown MigrationsListForOrgParameter3Inner value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static MigrationsListForOrgParameter3Inner? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return MigrationsListForOrgParameter3Inner.fromJson(json);
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
