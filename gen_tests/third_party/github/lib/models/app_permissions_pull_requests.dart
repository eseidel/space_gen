/// The level of permission to grant the access token for pull requests and
/// related comments, assignees, labels, milestones, and merges.
enum AppPermissionsPullRequests {
  read._('read'),
  write._('write');

  const AppPermissionsPullRequests._(this.value);

  /// Creates a AppPermissionsPullRequests from a json value.
  factory AppPermissionsPullRequests.fromJson(String json) {
    return AppPermissionsPullRequests.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown AppPermissionsPullRequests value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static AppPermissionsPullRequests? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return AppPermissionsPullRequests.fromJson(json);
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
