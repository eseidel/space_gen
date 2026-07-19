enum AutomodActionType {
  /// Block a user's message and prevent it from being posted. A custom
  /// explanation can be specified and shown to members whenever their message
  /// is blocked
  blockMessage._(1),

  /// Send a system message to a channel in order to log the user message that
  /// triggered the rule
  flagToChannel._(2),

  /// Temporarily disable a user's ability to communicate in the server
  /// (timeout)
  userCommunicationDisabled._(3),

  /// Prevent a user from interacting in the server
  quarantineUser._(4);

  const AutomodActionType._(this.value);

  /// Creates a AutomodActionType from a json value.
  factory AutomodActionType.fromJson(int json) {
    return AutomodActionType.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown AutomodActionType value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static AutomodActionType? maybeFromJson(int? json) {
    if (json == null) {
      return null;
    }
    return AutomodActionType.fromJson(json);
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
