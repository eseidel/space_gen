/// The state of the status. When you set a transient deployment to `inactive`,
/// the deployment will be shown as `destroyed` in GitHub.
enum ReposCreateDeploymentStatusRequestState {
  error._('error'),
  failure._('failure'),
  inactive._('inactive'),
  inProgress._('in_progress'),
  queued._('queued'),
  pending._('pending'),
  success._('success');

  const ReposCreateDeploymentStatusRequestState._(this.value);

  /// Creates a ReposCreateDeploymentStatusRequestState from a json value.
  factory ReposCreateDeploymentStatusRequestState.fromJson(String json) {
    return ReposCreateDeploymentStatusRequestState.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown ReposCreateDeploymentStatusRequestState value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ReposCreateDeploymentStatusRequestState? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ReposCreateDeploymentStatusRequestState.fromJson(json);
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
