enum ApplicationEventWebhooksStatus {
  /// Webhook events are disabled by developer
  disabled._(1),

  /// Webhook events are enabled by developer
  enabled._(2),

  /// Webhook events are disabled by Discord, usually due to inactivity
  disabledByDiscord._(3);

  const ApplicationEventWebhooksStatus._(this.value);

  /// Creates a ApplicationEventWebhooksStatus from a json value.
  factory ApplicationEventWebhooksStatus.fromJson(int json) {
    return ApplicationEventWebhooksStatus.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown ApplicationEventWebhooksStatus value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ApplicationEventWebhooksStatus? maybeFromJson(int? json) {
    if (json == null) {
      return null;
    }
    return ApplicationEventWebhooksStatus.fromJson(json);
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
