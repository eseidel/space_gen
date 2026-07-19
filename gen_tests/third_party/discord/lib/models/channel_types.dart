enum ChannelTypes {
  /// A direct message between users
  dm._(1),

  /// A direct message between multiple users
  groupDm._(3),

  /// A text channel within a server
  guildText._(0),

  /// A voice channel within a server
  guildVoice._(2),

  /// An organizational category that contains up to 50 channels
  guildCategory._(4),

  /// A channel that users can follow and crosspost into their own server
  /// (formerly news channels)
  guildAnnouncement._(5),

  /// A temporary sub-channel within a GUILD_ANNOUNCEMENT channel
  announcementThread._(10),

  /// A temporary sub-channel within a GUILD_TEXT or GUILD_THREADS_ONLY
  /// channel type set
  publicThread._(11),

  /// A temporary sub-channel within a GUILD_TEXT channel that is only
  /// viewable by those invited and those with the MANAGE_THREADS permission
  privateThread._(12),

  /// A voice channel for hosting events with an audience
  guildStageVoice._(13),

  /// The channel in a hub containing the listed servers
  guildDirectory._(14),

  /// Channel that can only contain threads
  guildForum._(15);

  const ChannelTypes._(this.value);

  /// Creates a ChannelTypes from a json value.
  factory ChannelTypes.fromJson(int json) {
    return ChannelTypes.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException('Unknown ChannelTypes value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ChannelTypes? maybeFromJson(int? json) {
    if (json == null) {
      return null;
    }
    return ChannelTypes.fromJson(json);
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
