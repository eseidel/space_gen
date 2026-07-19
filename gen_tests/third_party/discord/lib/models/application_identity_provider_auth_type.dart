enum ApplicationIdentityProviderAuthType {
  oidc._('OIDC'),
  epicOnlineServicesAccessToken._('EPIC_ONLINE_SERVICES_ACCESS_TOKEN'),
  epicOnlineServicesIdToken._('EPIC_ONLINE_SERVICES_ID_TOKEN'),
  steamSessionTicket._('STEAM_SESSION_TICKET'),
  unityServicesIdToken._('UNITY_SERVICES_ID_TOKEN'),
  discordBotIssuedAccessToken._('DISCORD_BOT_ISSUED_ACCESS_TOKEN'),
  appleIdToken._('APPLE_ID_TOKEN'),
  playstationNetworkIdToken._('PLAYSTATION_NETWORK_ID_TOKEN');

  const ApplicationIdentityProviderAuthType._(this.value);

  /// Creates a ApplicationIdentityProviderAuthType from a json value.
  factory ApplicationIdentityProviderAuthType.fromJson(String json) {
    return ApplicationIdentityProviderAuthType.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown ApplicationIdentityProviderAuthType value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ApplicationIdentityProviderAuthType? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ApplicationIdentityProviderAuthType.fromJson(json);
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
