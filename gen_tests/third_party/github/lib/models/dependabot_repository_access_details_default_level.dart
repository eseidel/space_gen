/// The default repository access level for Dependabot updates.
/// Example: `'internal'`
enum DependabotRepositoryAccessDetailsDefaultLevel {
  public._('public'),
  internal._('internal');

  const DependabotRepositoryAccessDetailsDefaultLevel._(this.value);

  /// Creates a DependabotRepositoryAccessDetailsDefaultLevel from a json value.
  factory DependabotRepositoryAccessDetailsDefaultLevel.fromJson(String json) {
    return DependabotRepositoryAccessDetailsDefaultLevel.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown DependabotRepositoryAccessDetailsDefaultLevel value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static DependabotRepositoryAccessDetailsDefaultLevel? maybeFromJson(
    String? json,
  ) {
    if (json == null) {
      return null;
    }
    return DependabotRepositoryAccessDetailsDefaultLevel.fromJson(json);
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
