enum IntegrationExpireGracePeriodTypes {
  /// 1 day
  oneDay._(1),

  /// 3 days
  threeDays._(3),

  /// 7 days
  sevenDays._(7),

  /// 14 days
  fourteenDays._(14),

  /// 30 days
  thirtyDays._(30);

  const IntegrationExpireGracePeriodTypes._(this.value);

  /// Creates a IntegrationExpireGracePeriodTypes from a json value.
  factory IntegrationExpireGracePeriodTypes.fromJson(int json) {
    return IntegrationExpireGracePeriodTypes.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown IntegrationExpireGracePeriodTypes value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static IntegrationExpireGracePeriodTypes? maybeFromJson(int? json) {
    if (json == null) {
      return null;
    }
    return IntegrationExpireGracePeriodTypes.fromJson(json);
  }

  /// The value of the enum.  This is the exact value
  /// from the OpenAPI spec and will be used for network transport.
  final int value;

  /// Converts the enum to its json value.
  int toJson() => value;

  /// Returns the string form of the enum.
  @override
  String toString() => value.toString();
}
