enum MessageType {
  ///
  default_._(0),

  ///
  recipientAdd._(1),

  ///
  recipientRemove._(2),

  ///
  call._(3),

  ///
  channelNameChange._(4),

  ///
  channelIconChange._(5),

  ///
  channelPinnedMessage._(6),

  ///
  userJoin._(7),

  ///
  guildBoost._(8),

  ///
  guildBoostTier1._(9),

  ///
  guildBoostTier2._(10),

  ///
  guildBoostTier3._(11),

  ///
  channelFollowAdd._(12),

  ///
  guildDiscoveryDisqualified._(14),

  ///
  guildDiscoveryRequalified._(15),

  ///
  guildDiscoveryGracePeriodInitialWarning._(16),

  ///
  guildDiscoveryGracePeriodFinalWarning._(17),

  ///
  threadCreated._(18),

  ///
  reply._(19),

  ///
  chatInputCommand._(20),

  ///
  threadStarterMessage._(21),

  ///
  guildInviteReminder._(22),

  ///
  contextMenuCommand._(23),

  ///
  autoModerationAction._(24),

  ///
  roleSubscriptionPurchase._(25),

  ///
  interactionPremiumUpsell._(26),

  ///
  stageStart._(27),

  ///
  stageEnd._(28),

  ///
  stageSpeaker._(29),

  ///
  stageTopic._(31),

  ///
  guildApplicationPremiumSubscription._(32),

  ///
  guildIncidentAlertModeEnabled._(36),

  ///
  guildIncidentAlertModeDisabled._(37),

  ///
  guildIncidentReportRaid._(38),

  ///
  guildIncidentReportFalseAlarm._(39),

  ///
  pollResult._(46),

  ///
  hdStreamingUpgraded._(55);

  const MessageType._(this.value);

  /// Creates a MessageType from a json value.
  factory MessageType.fromJson(int json) {
    return MessageType.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException('Unknown MessageType value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static MessageType? maybeFromJson(int? json) {
    if (json == null) {
      return null;
    }
    return MessageType.fromJson(json);
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
