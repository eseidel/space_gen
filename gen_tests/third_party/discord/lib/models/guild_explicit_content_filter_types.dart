enum GuildExplicitContentFilterTypes {
  /// media content will not be scanned
  disabled._(0),

  /// media content sent by members without roles will be scanned
  membersWithoutRoles._(1),

  /// media content sent by all members will be scanned
  allMembers._(2);

  const GuildExplicitContentFilterTypes._(this.value);

  /// Creates a GuildExplicitContentFilterTypes from a json value.
  factory GuildExplicitContentFilterTypes.fromJson(int json) {
    return GuildExplicitContentFilterTypes.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown GuildExplicitContentFilterTypes value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static GuildExplicitContentFilterTypes? maybeFromJson(int? json) {
    if (json == null) {
      return null;
    }
    return GuildExplicitContentFilterTypes.fromJson(json);
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
