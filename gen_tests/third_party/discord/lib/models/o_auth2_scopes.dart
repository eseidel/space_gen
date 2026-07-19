enum OAuth2Scopes {
  /// allows /users/@me without email
  identify._('identify'),

  /// enables /users/@me to return an email
  email._('email'),

  /// allows /users/@me/connections to return linked third-party accounts
  connections._('connections'),

  /// allows /users/@me/guilds to return basic information about all of a
  /// user's guilds
  guilds._('guilds'),

  /// allows /guilds/{guild.id}/members/{user.id} to be used for joining users
  /// to a guild
  guildsJoin._('guilds.join'),

  /// allows /users/@me/guilds/{guild.id}/member to return a user's member
  /// information in a guild
  guildsMembersRead._('guilds.members.read'),

  /// allows your app to join users to a group dm
  gdmJoin._('gdm.join'),

  /// for oauth2 bots, this puts the bot in the user's selected guild by
  /// default
  bot._('bot'),

  /// for local rpc server access, this allows you to control a user's local
  /// Discord client - requires Discord approval
  rpc._('rpc'),

  /// for local rpc server access, this allows you to receive notifications
  /// pushed out to the user - requires Discord approval
  rpcNotificationsRead._('rpc.notifications.read'),

  /// for local rpc server access, this allows you to read a user's voice
  /// settings and listen for voice events - requires Discord approval
  rpcVoiceRead._('rpc.voice.read'),

  /// for local rpc server access, this allows you to update a user's voice
  /// settings - requires Discord approval
  rpcVoiceWrite._('rpc.voice.write'),

  /// for local rpc server access, this allows you to read a user's video
  /// status - requires Discord approval
  rpcVideoRead._('rpc.video.read'),

  /// for local rpc server access, this allows you to update a user's video
  /// settings - requires Discord approval
  rpcVideoWrite._('rpc.video.write'),

  /// for local rpc server access, this allows you to read a user's
  /// screenshare status- requires Discord approval
  rpcScreenshareRead._('rpc.screenshare.read'),

  /// for local rpc server access, this allows you to update a user's
  /// screenshare settings- requires Discord approval
  rpcScreenshareWrite._('rpc.screenshare.write'),

  /// for local rpc server access, this allows you to update a user's activity
  /// - requires Discord approval
  rpcActivitiesWrite._('rpc.activities.write'),

  /// this generates a webhook that is returned in the oauth token response
  /// for authorization code grants
  webhookIncoming._('webhook.incoming'),

  /// for local rpc server api access, this allows you to read messages from
  /// all client channels (otherwise restricted to channels/guilds your app
  /// creates)
  messagesRead._('messages.read'),

  /// allows your app to upload/update builds for a user's applications -
  /// requires Discord approval
  applicationsBuildsUpload._('applications.builds.upload'),

  /// allows your app to read build data for a user's applications
  applicationsBuildsRead._('applications.builds.read'),

  /// allows your app to use commands in a guild
  applicationsCommands._('applications.commands'),

  /// allows your app to update permissions for its commands in a guild a user
  /// has permissions to
  applicationsCommandsPermissionsUpdate._(
    'applications.commands.permissions.update',
  ),

  /// allows your app to update its commands using a Bearer token - client
  /// credentials grant only
  applicationsCommandsUpdate._('applications.commands.update'),

  /// allows your app to read and update store data (SKUs, store listings,
  /// achievements, etc.) for a user's applications
  applicationsStoreUpdate._('applications.store.update'),

  /// allows your app to read entitlements for a user's applications
  applicationsEntitlements._('applications.entitlements'),

  /// allows your app to fetch data from a user's "Now Playing/Recently
  /// Played" list - requires Discord approval
  activitiesRead._('activities.read'),

  /// allows your app to update a user's activity - requires Discord approval
  /// (NOT REQUIRED FOR GAMESDK ACTIVITY MANAGER)
  activitiesWrite._('activities.write'),

  /// allows your app to send activity invites - requires Discord approval
  /// (NOT REQUIRED FOR GAMESDK ACTIVITY MANAGER)
  activitiesInvitesWrite._('activities.invites.write'),

  /// allows your app to know a user's friends and implicit relationships -
  /// requires Discord approval
  relationshipsRead._('relationships.read'),

  /// allows your app to connect to voice on user's behalf and see all the
  /// voice members - requires Discord approval
  voice._('voice'),

  /// allows your app to see information about the user's DMs and group DMs -
  /// requires Discord approval
  dmChannelsRead._('dm_channels.read'),

  /// allows your app to update a user's connection and metadata for the app
  roleConnectionsWrite._('role_connections.write'),

  /// for OpenID Connect, this allows your app to receive user id and basic
  /// profile information
  openid._('openid');

  const OAuth2Scopes._(this.value);

  /// Creates a OAuth2Scopes from a json value.
  factory OAuth2Scopes.fromJson(String json) {
    return OAuth2Scopes.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException('Unknown OAuth2Scopes value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static OAuth2Scopes? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return OAuth2Scopes.fromJson(json);
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
