enum AuthorType {
  user._('user'),
  bot._('bot'),
  webhook._('webhook'),
  noUser._('-user'),
  noBot._('-bot'),
  noWebhook._('-webhook');

  const AuthorType._(this.value);

  /// Creates a AuthorType from a json value.
  factory AuthorType.fromJson(String json) {
    return AuthorType.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException('Unknown AuthorType value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static AuthorType? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return AuthorType.fromJson(json);
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
