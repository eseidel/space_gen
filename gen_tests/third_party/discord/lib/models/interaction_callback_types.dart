enum InteractionCallbackTypes {
  pong._(1),
  channelMessageWithSource._(4),
  deferredChannelMessageWithSource._(5),
  deferredUpdateMessage._(6),
  updateMessage._(7),
  applicationCommandAutocompleteResult._(8),
  modal._(9),
  launchActivity._(12),
  socialLayerSkuPurchaseEligibility._(13);

  const InteractionCallbackTypes._(this.value);

  /// Creates a InteractionCallbackTypes from a json value.
  factory InteractionCallbackTypes.fromJson(int json) {
    return InteractionCallbackTypes.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown InteractionCallbackTypes value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static InteractionCallbackTypes? maybeFromJson(int? json) {
    if (json == null) {
      return null;
    }
    return InteractionCallbackTypes.fromJson(json);
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
