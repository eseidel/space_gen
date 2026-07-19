enum MigrationsStartForOrgRequestExcludeInner {
  repositories._('repositories');

  const MigrationsStartForOrgRequestExcludeInner._(this.value);

  /// Creates a MigrationsStartForOrgRequestExcludeInner from a json value.
  factory MigrationsStartForOrgRequestExcludeInner.fromJson(String json) {
    return MigrationsStartForOrgRequestExcludeInner.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown MigrationsStartForOrgRequestExcludeInner value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static MigrationsStartForOrgRequestExcludeInner? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return MigrationsStartForOrgRequestExcludeInner.fromJson(json);
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
