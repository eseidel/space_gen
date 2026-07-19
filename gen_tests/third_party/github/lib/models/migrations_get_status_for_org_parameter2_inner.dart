/// Allowed values that can be passed to the exclude param.
/// Example: `'repositories'`
enum MigrationsGetStatusForOrgParameter2Inner {
  repositories._('repositories');

  const MigrationsGetStatusForOrgParameter2Inner._(this.value);

  /// Creates a MigrationsGetStatusForOrgParameter2Inner from a json value.
  factory MigrationsGetStatusForOrgParameter2Inner.fromJson(String json) {
    return MigrationsGetStatusForOrgParameter2Inner.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown MigrationsGetStatusForOrgParameter2Inner value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static MigrationsGetStatusForOrgParameter2Inner? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return MigrationsGetStatusForOrgParameter2Inner.fromJson(json);
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
