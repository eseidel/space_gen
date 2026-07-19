enum IntegrationTypes {
  discord._('discord'),
  twitch._('twitch'),
  youtube._('youtube'),
  guildSubscription._('guild_subscription');

  const IntegrationTypes._(this.value);

  /// Creates a IntegrationTypes from a json value.
  factory IntegrationTypes.fromJson(String json) {
    return IntegrationTypes.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown IntegrationTypes value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static IntegrationTypes? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return IntegrationTypes.fromJson(json);
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
