/// The state of the status.
/// Example: `'success'`
enum DeploymentStatusState {
  error._('error'),
  failure._('failure'),
  inactive._('inactive'),
  pending._('pending'),
  success._('success'),
  queued._('queued'),
  inProgress._('in_progress');

  const DeploymentStatusState._(this.value);

  /// Creates a DeploymentStatusState from a json value.
  factory DeploymentStatusState.fromJson(String json) {
    return DeploymentStatusState.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown DeploymentStatusState value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static DeploymentStatusState? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return DeploymentStatusState.fromJson(json);
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
