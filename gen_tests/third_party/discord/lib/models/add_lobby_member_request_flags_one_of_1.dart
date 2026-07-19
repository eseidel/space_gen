enum AddLobbyMemberRequestFlagsOneOf1 {
  value1._(1);

  const AddLobbyMemberRequestFlagsOneOf1._(this.value);

  /// Creates a AddLobbyMemberRequestFlagsOneOf1 from a json value.
  factory AddLobbyMemberRequestFlagsOneOf1.fromJson(int json) {
    return AddLobbyMemberRequestFlagsOneOf1.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown AddLobbyMemberRequestFlagsOneOf1 value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static AddLobbyMemberRequestFlagsOneOf1? maybeFromJson(int? json) {
    if (json == null) {
      return null;
    }
    return AddLobbyMemberRequestFlagsOneOf1.fromJson(json);
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
