enum BulkLobbyMemberRequestFlagsOneOf1 {
  value1._(1);

  const BulkLobbyMemberRequestFlagsOneOf1._(this.value);

  /// Creates a BulkLobbyMemberRequestFlagsOneOf1 from a json value.
  factory BulkLobbyMemberRequestFlagsOneOf1.fromJson(int json) {
    return BulkLobbyMemberRequestFlagsOneOf1.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown BulkLobbyMemberRequestFlagsOneOf1 value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static BulkLobbyMemberRequestFlagsOneOf1? maybeFromJson(int? json) {
    if (json == null) {
      return null;
    }
    return BulkLobbyMemberRequestFlagsOneOf1.fromJson(json);
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
