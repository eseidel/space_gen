enum GuildFeatures {
  /// guild has access to set an animated guild banner image
  animatedBanner._('ANIMATED_BANNER'),

  /// guild has access to set an animated guild icon
  animatedIcon._('ANIMATED_ICON'),

  /// guild is using the old permissions configuration behavior
  applicationCommandPermissionsV2._('APPLICATION_COMMAND_PERMISSIONS_V2'),

  /// guild has set up auto moderation rules
  autoModeration._('AUTO_MODERATION'),

  /// guild has access to set a guild banner image
  banner._('BANNER'),

  /// guild can enable welcome screen, Membership Screening, stage channels
  /// and discovery, and             receives community updates
  community._('COMMUNITY'),

  /// guild has enabled monetization
  creatorMonetizableProvisional._('CREATOR_MONETIZABLE_PROVISIONAL'),

  /// guild has enabled the role subscription promo page
  creatorStorePage._('CREATOR_STORE_PAGE'),

  /// guild has been set as a support server on the App Directory
  developerSupportServer._('DEVELOPER_SUPPORT_SERVER'),

  /// guild is able to be discovered in the directory
  discoverable._('DISCOVERABLE'),

  /// guild is able to be featured in the directory
  featurable._('FEATURABLE'),

  /// guild has paused invites, preventing new users from joining
  invitesDisabled._('INVITES_DISABLED'),

  /// guild has access to set an invite splash background
  inviteSplash._('INVITE_SPLASH'),

  /// guild has enabled Membership Screening
  memberVerificationGateEnabled._('MEMBER_VERIFICATION_GATE_ENABLED'),

  /// guild has increased custom sticker slots
  moreStickers._('MORE_STICKERS'),

  /// guild has access to create announcement channels
  news._('NEWS'),

  /// guild is partnered
  partnered._('PARTNERED'),

  /// guild can be previewed before joining via Membership Screening or the
  /// directory
  previewEnabled._('PREVIEW_ENABLED'),

  /// guild has disabled activity alerts in the configured safety alerts
  /// channel
  raidAlertsDisabled._('RAID_ALERTS_DISABLED'),

  /// guild is able to set role icons
  roleIcons._('ROLE_ICONS'),

  /// guild has role subscriptions that can be purchased
  roleSubscriptionsAvailableForPurchase._(
    'ROLE_SUBSCRIPTIONS_AVAILABLE_FOR_PURCHASE',
  ),

  /// guild has enabled role subscriptions
  roleSubscriptionsEnabled._('ROLE_SUBSCRIPTIONS_ENABLED'),

  /// guild has enabled ticketed events
  ticketedEventsEnabled._('TICKETED_EVENTS_ENABLED'),

  /// guild has access to set a vanity URL
  vanityUrl._('VANITY_URL'),

  /// guild is verified
  verified._('VERIFIED'),

  /// guild has access to set 384kbps bitrate in voice (previously VIP voice
  /// servers)
  vipRegions._('VIP_REGIONS'),

  /// guild has enabled the welcome screen
  welcomeScreenEnabled._('WELCOME_SCREEN_ENABLED'),

  /// guild is an official guild for one or more games
  officialGameGuild._('OFFICIAL_GAME_GUILD');

  const GuildFeatures._(this.value);

  /// Creates a GuildFeatures from a json value.
  factory GuildFeatures.fromJson(String json) {
    return GuildFeatures.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException('Unknown GuildFeatures value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static GuildFeatures? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return GuildFeatures.fromJson(json);
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
