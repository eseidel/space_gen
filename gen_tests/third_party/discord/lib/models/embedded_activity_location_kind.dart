enum EmbeddedActivityLocationKind {
  /// guild channel
  guildChannel._('gc'),

  /// private channel
  privateChannel._('pc'),

  /// party
  party._('party');

  const EmbeddedActivityLocationKind._(this.value);

  /// Creates a EmbeddedActivityLocationKind from a json value.
  factory EmbeddedActivityLocationKind.fromJson(String json) {
    return EmbeddedActivityLocationKind.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown EmbeddedActivityLocationKind value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static EmbeddedActivityLocationKind? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return EmbeddedActivityLocationKind.fromJson(json);
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
