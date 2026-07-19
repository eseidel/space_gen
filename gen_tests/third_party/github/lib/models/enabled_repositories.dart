/// The policy that controls the repositories in the organization that are
/// allowed to run GitHub Actions.
enum EnabledRepositories {
  all._('all'),
  none._('none'),
  selected._('selected');

  const EnabledRepositories._(this.value);

  /// Creates a EnabledRepositories from a json value.
  factory EnabledRepositories.fromJson(String json) {
    return EnabledRepositories.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown EnabledRepositories value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static EnabledRepositories? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return EnabledRepositories.fromJson(json);
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
