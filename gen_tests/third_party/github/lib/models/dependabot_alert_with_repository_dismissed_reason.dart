/// The reason that the alert was dismissed.
enum DependabotAlertWithRepositoryDismissedReason {
  fixStarted._('fix_started'),
  inaccurate._('inaccurate'),
  noBandwidth._('no_bandwidth'),
  notUsed._('not_used'),
  tolerableRisk._('tolerable_risk');

  const DependabotAlertWithRepositoryDismissedReason._(this.value);

  /// Creates a DependabotAlertWithRepositoryDismissedReason from a json value.
  factory DependabotAlertWithRepositoryDismissedReason.fromJson(String json) {
    return DependabotAlertWithRepositoryDismissedReason.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown DependabotAlertWithRepositoryDismissedReason value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static DependabotAlertWithRepositoryDismissedReason? maybeFromJson(
    String? json,
  ) {
    if (json == null) {
      return null;
    }
    return DependabotAlertWithRepositoryDismissedReason.fromJson(json);
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
