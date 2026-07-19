enum AuditLogActionTypes {
  guildUpdate._(1),
  channelCreate._(10),
  channelUpdate._(11),
  channelDelete._(12),
  channelOverwriteCreate._(13),
  channelOverwriteUpdate._(14),
  channelOverwriteDelete._(15),
  memberKick._(20),
  memberPrune._(21),
  memberBanAdd._(22),
  memberBanRemove._(23),
  memberUpdate._(24),
  memberRoleUpdate._(25),
  memberMove._(26),
  memberDisconnect._(27),
  botAdd._(28),
  roleCreate._(30),
  roleUpdate._(31),
  roleDelete._(32),
  inviteCreate._(40),
  inviteUpdate._(41),
  inviteDelete._(42),
  webhookCreate._(50),
  webhookUpdate._(51),
  webhookDelete._(52),
  emojiCreate._(60),
  emojiUpdate._(61),
  emojiDelete._(62),
  messageDelete._(72),
  messageBulkDelete._(73),
  messagePin._(74),
  messageUnpin._(75),
  integrationCreate._(80),
  integrationUpdate._(81),
  integrationDelete._(82),
  stageInstanceCreate._(83),
  stageInstanceUpdate._(84),
  stageInstanceDelete._(85),
  stickerCreate._(90),
  stickerUpdate._(91),
  stickerDelete._(92),
  guildScheduledEventCreate._(100),
  guildScheduledEventUpdate._(101),
  guildScheduledEventDelete._(102),
  threadCreate._(110),
  threadUpdate._(111),
  threadDelete._(112),
  applicationCommandPermissionUpdate._(121),
  soundboardSoundCreate._(130),
  soundboardSoundUpdate._(131),
  soundboardSoundDelete._(132),
  autoModerationRuleCreate._(140),
  autoModerationRuleUpdate._(141),
  autoModerationRuleDelete._(142),
  autoModerationBlockMessage._(143),
  autoModerationFlagToChannel._(144),
  autoModerationUserCommDisabled._(145),
  autoModerationQuarantineUser._(146),
  creatorMonetizationRequestCreated._(150),
  creatorMonetizationTermsAccepted._(151),
  onboardingPromptCreate._(163),
  onboardingPromptUpdate._(164),
  onboardingPromptDelete._(165),
  onboardingCreate._(166),
  onboardingUpdate._(167),
  guildHomeFeatureItem._(171),
  guildHomeRemoveItem._(172),
  harmfulLinksBlockedMessage._(180),
  homeSettingsCreate._(190),
  homeSettingsUpdate._(191),
  voiceChannelStatusCreate._(192),
  voiceChannelStatusDelete._(193),
  guildProfileUpdate._(211);

  const AuditLogActionTypes._(this.value);

  /// Creates a AuditLogActionTypes from a json value.
  factory AuditLogActionTypes.fromJson(int json) {
    return AuditLogActionTypes.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown AuditLogActionTypes value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static AuditLogActionTypes? maybeFromJson(int? json) {
    if (json == null) {
      return null;
    }
    return AuditLogActionTypes.fromJson(json);
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
