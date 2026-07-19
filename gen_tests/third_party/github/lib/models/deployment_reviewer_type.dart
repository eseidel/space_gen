/// The type of reviewer.
/// Example: `'User'`
enum DeploymentReviewerType {
  user._('User'),
  team._('Team');

  const DeploymentReviewerType._(this.value);

  /// Creates a DeploymentReviewerType from a json value.
  factory DeploymentReviewerType.fromJson(String json) {
    return DeploymentReviewerType.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown DeploymentReviewerType value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static DeploymentReviewerType? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return DeploymentReviewerType.fromJson(json);
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
