enum WebhookTypes {
  /// Incoming Webhooks can post messages to channels with a generated token
  guildIncoming._(1),

  /// Channel Follower Webhooks are internal webhooks used with Channel
  /// Following to post new messages into channels
  channelFollower._(2),

  /// Application webhooks are webhooks used with Interactions
  applicationIncoming._(3);

  const WebhookTypes._(this.value);

  /// Creates a WebhookTypes from a json value.
  factory WebhookTypes.fromJson(int json) {
    return WebhookTypes.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException('Unknown WebhookTypes value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static WebhookTypes? maybeFromJson(int? json) {
    if (json == null) {
      return null;
    }
    return WebhookTypes.fromJson(json);
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
