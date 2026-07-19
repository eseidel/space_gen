enum CreateLobbyRequestFlagsOneOf1 {
  value1._(1);

  const CreateLobbyRequestFlagsOneOf1._(this.value);

  /// Creates a CreateLobbyRequestFlagsOneOf1 from a json value.
  factory CreateLobbyRequestFlagsOneOf1.fromJson(int json) {
    return CreateLobbyRequestFlagsOneOf1.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown CreateLobbyRequestFlagsOneOf1 value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static CreateLobbyRequestFlagsOneOf1? maybeFromJson(int? json) {
    if (json == null) {
      return null;
    }
    return CreateLobbyRequestFlagsOneOf1.fromJson(json);
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
