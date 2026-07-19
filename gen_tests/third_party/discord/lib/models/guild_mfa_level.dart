enum GuildMfaLevel {
  /// Guild has no MFA/2FA requirement for moderation actions
  none._(0),

  /// Guild has a 2FA requirement for moderation actions
  elevated._(1);

  const GuildMfaLevel._(this.value);

  /// Creates a GuildMfaLevel from a json value.
  factory GuildMfaLevel.fromJson(int json) {
    return GuildMfaLevel.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException('Unknown GuildMfaLevel value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static GuildMfaLevel? maybeFromJson(int? json) {
    if (json == null) {
      return null;
    }
    return GuildMfaLevel.fromJson(json);
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
