enum ConnectedAccountProviders {
  battlenet._('battlenet'),
  bluesky._('bluesky'),
  bungie._('bungie'),
  ebay._('ebay'),
  epicGames._('epicgames'),
  facebook._('facebook'),
  github._('github'),
  instagram._('instagram'),
  mastodon._('mastodon'),
  leagueOfLegends._('leagueoflegends'),
  paypal._('paypal'),
  playstation._('playstation'),
  reddit._('reddit'),
  riotGames._('riotgames'),
  roblox._('roblox'),
  skype._('skype'),
  spotify._('spotify'),
  steam._('steam'),
  tiktok._('tiktok'),
  twitch._('twitch'),
  twitter._('twitter'),
  xbox._('xbox'),
  youtube._('youtube'),
  domain._('domain');

  const ConnectedAccountProviders._(this.value);

  /// Creates a ConnectedAccountProviders from a json value.
  factory ConnectedAccountProviders.fromJson(String json) {
    return ConnectedAccountProviders.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown ConnectedAccountProviders value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ConnectedAccountProviders? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ConnectedAccountProviders.fromJson(json);
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
