enum CreateOrJoinLobbyRequestFlagsOneOf1 {
  value1._(1);

  const CreateOrJoinLobbyRequestFlagsOneOf1._(this.value);

  /// Creates a CreateOrJoinLobbyRequestFlagsOneOf1 from a json value.
  factory CreateOrJoinLobbyRequestFlagsOneOf1.fromJson(int json) {
    return CreateOrJoinLobbyRequestFlagsOneOf1.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown CreateOrJoinLobbyRequestFlagsOneOf1 value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static CreateOrJoinLobbyRequestFlagsOneOf1? maybeFromJson(int? json) {
    if (json == null) {
      return null;
    }
    return CreateOrJoinLobbyRequestFlagsOneOf1.fromJson(json);
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
