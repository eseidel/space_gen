enum WorkflowRunStatusParam {
  completed._('completed'),
  actionRequired._('action_required'),
  cancelled._('cancelled'),
  failure._('failure'),
  neutral._('neutral'),
  skipped._('skipped'),
  stale._('stale'),
  success._('success'),
  timedOut._('timed_out'),
  inProgress._('in_progress'),
  queued._('queued'),
  requested._('requested'),
  waiting._('waiting'),
  pending._('pending');

  const WorkflowRunStatusParam._(this.value);

  /// Creates a WorkflowRunStatusParam from a json value.
  factory WorkflowRunStatusParam.fromJson(String json) {
    return WorkflowRunStatusParam.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown WorkflowRunStatusParam value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static WorkflowRunStatusParam? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return WorkflowRunStatusParam.fromJson(json);
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
