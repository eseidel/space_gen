/// The reason that the alert was dismissed.
enum DependabotAlertDismissedReason {
  fixStarted._('fix_started'),
  inaccurate._('inaccurate'),
  noBandwidth._('no_bandwidth'),
  notUsed._('not_used'),
  tolerableRisk._('tolerable_risk');

  const DependabotAlertDismissedReason._(this.value);

  /// Creates a DependabotAlertDismissedReason from a json value.
  factory DependabotAlertDismissedReason.fromJson(String json) {
    return DependabotAlertDismissedReason.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown DependabotAlertDismissedReason value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static DependabotAlertDismissedReason? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return DependabotAlertDismissedReason.fromJson(json);
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
