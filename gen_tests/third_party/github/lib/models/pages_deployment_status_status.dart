/// The current status of the deployment.
enum PagesDeploymentStatusStatus {
  deploymentInProgress._('deployment_in_progress'),
  syncingFiles._('syncing_files'),
  finishedFileSync._('finished_file_sync'),
  updatingPages._('updating_pages'),
  purgingCdn._('purging_cdn'),
  deploymentCancelled._('deployment_cancelled'),
  deploymentFailed._('deployment_failed'),
  deploymentContentFailed._('deployment_content_failed'),
  deploymentAttemptError._('deployment_attempt_error'),
  deploymentLost._('deployment_lost'),
  succeed._('succeed');

  const PagesDeploymentStatusStatus._(this.value);

  /// Creates a PagesDeploymentStatusStatus from a json value.
  factory PagesDeploymentStatusStatus.fromJson(String json) {
    return PagesDeploymentStatusStatus.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown PagesDeploymentStatusStatus value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static PagesDeploymentStatusStatus? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return PagesDeploymentStatusStatus.fromJson(json);
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
