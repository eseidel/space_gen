/// Allowed values that can be passed to the exclude param.
/// Example: `'repositories'`
enum MigrationsListForOrgExcludeInner {
  repositories._('repositories');

  const MigrationsListForOrgExcludeInner._(this.value);

  /// Creates a MigrationsListForOrgExcludeInner from a json value.
  factory MigrationsListForOrgExcludeInner.fromJson(String json) {
    return MigrationsListForOrgExcludeInner.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown MigrationsListForOrgExcludeInner value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static MigrationsListForOrgExcludeInner? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return MigrationsListForOrgExcludeInner.fromJson(json);
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
