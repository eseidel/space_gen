enum StickerFormatTypes {
  png._(1),
  apng._(2),
  lottie._(3),
  gif._(4);

  const StickerFormatTypes._(this.value);

  /// Creates a StickerFormatTypes from a json value.
  factory StickerFormatTypes.fromJson(int json) {
    return StickerFormatTypes.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown StickerFormatTypes value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static StickerFormatTypes? maybeFromJson(int? json) {
    if (json == null) {
      return null;
    }
    return StickerFormatTypes.fromJson(json);
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
