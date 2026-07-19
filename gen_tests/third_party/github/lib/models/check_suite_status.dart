/// The phase of the lifecycle that the check suite is currently in. Statuses of
/// waiting, requested, and pending are reserved for GitHub Actions check
/// suites.
/// Example: `'completed'`
enum CheckSuiteStatus {
  queued._('queued'),
  inProgress._('in_progress'),
  completed._('completed'),
  waiting._('waiting'),
  requested._('requested'),
  pending._('pending');

  const CheckSuiteStatus._(this.value);

  /// Creates a CheckSuiteStatus from a json value.
  factory CheckSuiteStatus.fromJson(String json) {
    return CheckSuiteStatus.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown CheckSuiteStatus value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static CheckSuiteStatus? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return CheckSuiteStatus.fromJson(json);
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
