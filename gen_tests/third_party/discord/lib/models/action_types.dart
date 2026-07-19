enum ActionTypes {
  /// User started typing in a channel
  typingStart._('TYPING_START'),

  /// Invite to a channel was created
  inviteCreate._('INVITE_CREATE'),

  /// Invite to a channel was deleted
  inviteDelete._('INVITE_DELETE'),

  /// Guild channel webhook was created, updated, or deleted
  webhooksUpdate._('WEBHOOKS_UPDATE'),

  /// New guild channel created
  channelCreate._('CHANNEL_CREATE'),

  /// Voice channel status was updated
  voiceChannelStatusUpdate._('VOICE_CHANNEL_STATUS_UPDATE'),

  /// Channel was updated
  channelUpdate._('CHANNEL_UPDATE'),

  /// Channel was deleted
  channelDelete._('CHANNEL_DELETE'),

  /// Message was pinned or unpinned
  channelPinsUpdate._('CHANNEL_PINS_UPDATE'),

  /// Thread created, also sent when being added to a private thread
  threadCreate._('THREAD_CREATE'),

  /// Thread was updated
  threadUpdate._('THREAD_UPDATE'),

  /// Thread was deleted
  threadDelete._('THREAD_DELETE'),

  /// Sent when gaining access to a channel, contains all active threads in
  /// that channel
  threadListSync._('THREAD_LIST_SYNC'),

  /// Thread member for the current user was updated
  threadMemberUpdate._('THREAD_MEMBER_UPDATE'),

  /// Some user(s) were added to or removed from a thread
  threadMembersUpdate._('THREAD_MEMBERS_UPDATE'),

  /// Lazy-load for unavailable guild, guild became available, or user joined
  /// a new guild
  guildCreate._('GUILD_CREATE'),

  /// Guild was updated
  guildUpdate._('GUILD_UPDATE'),

  /// Guild became unavailable, or user left/was removed from a guild
  guildDelete._('GUILD_DELETE'),

  /// Guild emojis were updated
  guildEmojisUpdate._('GUILD_EMOJIS_UPDATE'),

  /// Guild stickers were updated
  guildStickersUpdate._('GUILD_STICKERS_UPDATE'),

  /// Guild integration was updated
  guildIntegrationsUpdate._('GUILD_INTEGRATIONS_UPDATE'),

  /// New user joined a guild
  guildMemberAdd._('GUILD_MEMBER_ADD'),

  /// Guild member was updated
  guildMemberUpdate._('GUILD_MEMBER_UPDATE'),

  /// User was removed from a guild
  guildMemberRemove._('GUILD_MEMBER_REMOVE'),

  /// User was banned from a guild
  guildBanAdd._('GUILD_BAN_ADD'),

  /// User was unbanned from a guild
  guildBanRemove._('GUILD_BAN_REMOVE'),

  /// Guild role was created
  guildRoleCreate._('GUILD_ROLE_CREATE'),

  /// Guild role was updated
  guildRoleUpdate._('GUILD_ROLE_UPDATE'),

  /// Guild role was deleted
  guildRoleDelete._('GUILD_ROLE_DELETE'),

  /// Response to Request Guild Members
  guildMembersChunk._('GUILD_MEMBERS_CHUNK'),

  /// Message was created
  messageCreate._('MESSAGE_CREATE'),

  /// Message was edited
  messageUpdate._('MESSAGE_UPDATE'),

  /// Message was deleted
  messageDelete._('MESSAGE_DELETE'),

  /// Multiple messages were deleted at once
  messageDeleteBulk._('MESSAGE_DELETE_BULK'),

  /// User reacted to a message
  messageReactionAdd._('MESSAGE_REACTION_ADD'),

  /// User removed a reaction from a message
  messageReactionRemove._('MESSAGE_REACTION_REMOVE'),

  /// All reactions were explicitly removed from a message
  messageReactionRemoveAll._('MESSAGE_REACTION_REMOVE_ALL'),

  /// All reactions for a given emoji were explicitly removed from a message
  messageReactionRemoveEmoji._('MESSAGE_REACTION_REMOVE_EMOJI'),

  /// Properties about the user changed
  userUpdate._('USER_UPDATE'),

  /// Contains the initial state information
  ready._('READY'),

  /// Response to Resume
  resumed._('RESUMED'),

  /// User was updated
  presenceUpdate._('PRESENCE_UPDATE'),

  /// Someone joined, left, or moved a voice channel
  voiceStateUpdate._('VOICE_STATE_UPDATE'),

  /// Guild's voice server was updated
  voiceServerUpdate._('VOICE_SERVER_UPDATE'),

  /// User used an interaction, such as an Application Command
  interactionCreate._('INTERACTION_CREATE'),

  /// Guild integration was created
  integrationCreate._('INTEGRATION_CREATE'),

  /// Guild integration was updated
  integrationUpdate._('INTEGRATION_UPDATE'),

  /// Guild integration was deleted
  integrationDelete._('INTEGRATION_DELETE'),

  /// Application command permission was updated
  applicationCommandPermissionsUpdate._(
    'APPLICATION_COMMAND_PERMISSIONS_UPDATE',
  ),

  /// Stage instance was created
  stageInstanceCreate._('STAGE_INSTANCE_CREATE'),

  /// Stage instance was updated
  stageInstanceUpdate._('STAGE_INSTANCE_UPDATE'),

  /// Stage instance was deleted or closed
  stageInstanceDelete._('STAGE_INSTANCE_DELETE'),

  /// A guild audit log entry was created
  guildAuditLogEntryCreate._('GUILD_AUDIT_LOG_ENTRY_CREATE'),

  /// Guild scheduled event was created
  guildScheduledEventCreate._('GUILD_SCHEDULED_EVENT_CREATE'),

  /// Guild scheduled event was updated
  guildScheduledEventUpdate._('GUILD_SCHEDULED_EVENT_UPDATE'),

  /// Guild scheduled event was deleted
  guildScheduledEventDelete._('GUILD_SCHEDULED_EVENT_DELETE'),

  /// User subscribed to a guild scheduled event
  guildScheduledEventUserAdd._('GUILD_SCHEDULED_EVENT_USER_ADD'),

  /// User unsubscribed from a guild scheduled event
  guildScheduledEventUserRemove._('GUILD_SCHEDULED_EVENT_USER_REMOVE'),

  /// Auto Moderation rule was created
  autoModerationRuleCreate._('AUTO_MODERATION_RULE_CREATE'),

  /// Auto Moderation rule was updated
  autoModerationRuleUpdate._('AUTO_MODERATION_RULE_UPDATE'),

  /// Auto Moderation rule was deleted
  autoModerationRuleDelete._('AUTO_MODERATION_RULE_DELETE'),

  /// Auto Moderation rule was triggered and an action was executed (.e.g. a
  /// message was blocked)
  autoModerationActionExecution._('AUTO_MODERATION_ACTION_EXECUTION'),

  ///
  guildSoundboardSoundsUpdate._('GUILD_SOUNDBOARD_SOUNDS_UPDATE'),

  ///
  guildSoundboardSoundCreate._('GUILD_SOUNDBOARD_SOUND_CREATE'),

  ///
  guildSoundboardSoundUpdate._('GUILD_SOUNDBOARD_SOUND_UPDATE'),

  ///
  guildSoundboardSoundDelete._('GUILD_SOUNDBOARD_SOUND_DELETE'),

  ///
  rateLimited._('RATE_LIMITED');

  const ActionTypes._(this.value);

  /// Creates a ActionTypes from a json value.
  factory ActionTypes.fromJson(String json) {
    return ActionTypes.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException('Unknown ActionTypes value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ActionTypes? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ActionTypes.fromJson(json);
  }

  /// The value of the enum.  This is the exact value
  /// from the OpenAPI spec and will be used for network transport.
  final String value;

  /// Converts the enum to its json value.
  String toJson() => value;

  /// Returns the string form of the enum.
  @override
  String toString() => value;
}
