enum ReposListActivitiesTimePeriod {
  day._('day'),
  week._('week'),
  month._('month'),
  quarter._('quarter'),
  year._('year');

  const ReposListActivitiesTimePeriod._(this.value);

  /// Creates a ReposListActivitiesTimePeriod from a json value.
  factory ReposListActivitiesTimePeriod.fromJson(String json) {
    return ReposListActivitiesTimePeriod.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown ReposListActivitiesTimePeriod value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ReposListActivitiesTimePeriod? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ReposListActivitiesTimePeriod.fromJson(json);
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
