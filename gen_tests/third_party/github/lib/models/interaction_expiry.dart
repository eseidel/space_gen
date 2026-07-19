/// The duration of the interaction restriction. Default: `one_day`.
/// Example: `'one_month'`
enum InteractionExpiry {
  oneDay._('one_day'),
  threeDays._('three_days'),
  oneWeek._('one_week'),
  oneMonth._('one_month'),
  sixMonths._('six_months');

  const InteractionExpiry._(this.value);

  /// Creates a InteractionExpiry from a json value.
  factory InteractionExpiry.fromJson(String json) {
    return InteractionExpiry.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown InteractionExpiry value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static InteractionExpiry? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return InteractionExpiry.fromJson(json);
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
