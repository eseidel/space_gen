enum AutomodEventType {
  /// A user submitted a message to a channel
  messageSend._(1),

  /// A user is attempting to join the server or a member's properties were
  /// updated.
  guildMemberJoinOrUpdate._(2);

  const AutomodEventType._(this.value);

  /// Creates a AutomodEventType from a json value.
  factory AutomodEventType.fromJson(int json) {
    return AutomodEventType.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown AutomodEventType value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static AutomodEventType? maybeFromJson(int? json) {
    if (json == null) {
      return null;
    }
    return AutomodEventType.fromJson(json);
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
