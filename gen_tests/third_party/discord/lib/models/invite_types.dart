enum InviteTypes {
  guild._(0),
  groupDm._(1),
  friend._(2);

  const InviteTypes._(this.value);

  /// Creates a InviteTypes from a json value.
  factory InviteTypes.fromJson(int json) {
    return InviteTypes.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException('Unknown InviteTypes value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static InviteTypes? maybeFromJson(int? json) {
    if (json == null) {
      return null;
    }
    return InviteTypes.fromJson(json);
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
