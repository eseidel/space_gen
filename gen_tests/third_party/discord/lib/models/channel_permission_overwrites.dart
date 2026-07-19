enum ChannelPermissionOverwrites {
  role._(0),
  member._(1);

  const ChannelPermissionOverwrites._(this.value);

  /// Creates a ChannelPermissionOverwrites from a json value.
  factory ChannelPermissionOverwrites.fromJson(int json) {
    return ChannelPermissionOverwrites.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown ChannelPermissionOverwrites value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ChannelPermissionOverwrites? maybeFromJson(int? json) {
    if (json == null) {
      return null;
    }
    return ChannelPermissionOverwrites.fromJson(json);
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
