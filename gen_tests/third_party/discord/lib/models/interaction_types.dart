enum InteractionTypes {
  /// Sent by Discord to validate your application's interaction handler
  ping._(1),

  /// Sent when a user uses an application command
  applicationCommand._(2),

  /// Sent when a user interacts with a message component previously sent by
  /// your application
  messageComponent._(3),

  /// Sent when a user is filling in an autocomplete option in a chat command
  applicationCommandAutocomplete._(4),

  /// Sent when a user submits a modal previously sent by your application
  modalSubmit._(5),

  /// Sent when Discord is checking if a user can purchase a Social Layer SKU
  socialLayerSkuPurchaseEligibility._(6);

  const InteractionTypes._(this.value);

  /// Creates a InteractionTypes from a json value.
  factory InteractionTypes.fromJson(int json) {
    return InteractionTypes.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown InteractionTypes value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static InteractionTypes? maybeFromJson(int? json) {
    if (json == null) {
      return null;
    }
    return InteractionTypes.fromJson(json);
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
