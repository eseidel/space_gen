enum EditLobbyRequestFlagsOneOf1 {
  value1._(1);

  const EditLobbyRequestFlagsOneOf1._(this.value);

  /// Creates a EditLobbyRequestFlagsOneOf1 from a json value.
  factory EditLobbyRequestFlagsOneOf1.fromJson(int json) {
    return EditLobbyRequestFlagsOneOf1.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown EditLobbyRequestFlagsOneOf1 value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static EditLobbyRequestFlagsOneOf1? maybeFromJson(int? json) {
    if (json == null) {
      return null;
    }
    return EditLobbyRequestFlagsOneOf1.fromJson(json);
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
