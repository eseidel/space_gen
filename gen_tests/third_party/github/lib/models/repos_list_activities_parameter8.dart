enum ReposListActivitiesParameter8 {
  day._('day'),
  week._('week'),
  month._('month'),
  quarter._('quarter'),
  year._('year');

  const ReposListActivitiesParameter8._(this.value);

  /// Creates a ReposListActivitiesParameter8 from a json value.
  factory ReposListActivitiesParameter8.fromJson(String json) {
    return ReposListActivitiesParameter8.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown ReposListActivitiesParameter8 value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ReposListActivitiesParameter8? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ReposListActivitiesParameter8.fromJson(json);
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
