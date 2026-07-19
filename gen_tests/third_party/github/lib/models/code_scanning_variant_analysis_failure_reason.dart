/// The reason for a failure of the variant analysis. This is only available if
/// the variant analysis has failed.
enum CodeScanningVariantAnalysisFailureReason {
  noReposQueried._('no_repos_queried'),
  actionsWorkflowRunFailed._('actions_workflow_run_failed'),
  internalError._('internal_error');

  const CodeScanningVariantAnalysisFailureReason._(this.value);

  /// Creates a CodeScanningVariantAnalysisFailureReason from a json value.
  factory CodeScanningVariantAnalysisFailureReason.fromJson(String json) {
    return CodeScanningVariantAnalysisFailureReason.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown CodeScanningVariantAnalysisFailureReason value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static CodeScanningVariantAnalysisFailureReason? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return CodeScanningVariantAnalysisFailureReason.fromJson(json);
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
