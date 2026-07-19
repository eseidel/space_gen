/// The level of permission to grant the access token to manage team discussions
/// and related comments.
enum AppPermissionsTeamDiscussions {
  read._('read'),
  write._('write');

  const AppPermissionsTeamDiscussions._(this.value);

  /// Creates a AppPermissionsTeamDiscussions from a json value.
  factory AppPermissionsTeamDiscussions.fromJson(String json) {
    return AppPermissionsTeamDiscussions.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown AppPermissionsTeamDiscussions value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static AppPermissionsTeamDiscussions? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return AppPermissionsTeamDiscussions.fromJson(json);
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
