/// The phase of the lifecycle that the job is currently in.
/// Example: `'queued'`
enum JobStepsInnerStatus {
  queued._('queued'),
  inProgress._('in_progress'),
  completed._('completed');

  const JobStepsInnerStatus._(this.value);

  /// Creates a JobStepsInnerStatus from a json value.
  factory JobStepsInnerStatus.fromJson(String json) {
    return JobStepsInnerStatus.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown JobStepsInnerStatus value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static JobStepsInnerStatus? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return JobStepsInnerStatus.fromJson(json);
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
