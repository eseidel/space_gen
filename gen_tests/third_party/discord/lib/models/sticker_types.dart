enum StickerTypes {
  /// an official sticker in a pack, part of Nitro or in a removed purchasable
  /// pack
  standard._(1),

  /// a sticker uploaded to a guild for the guild's members
  guild._(2);

  const StickerTypes._(this.value);

  /// Creates a StickerTypes from a json value.
  factory StickerTypes.fromJson(int json) {
    return StickerTypes.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException('Unknown StickerTypes value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static StickerTypes? maybeFromJson(int? json) {
    if (json == null) {
      return null;
    }
    return StickerTypes.fromJson(json);
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
