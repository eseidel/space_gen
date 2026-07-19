enum HasOption {
  link._('link'),
  embed._('embed'),
  file._('file'),
  image._('image'),
  video._('video'),
  sound._('sound'),
  sticker._('sticker'),
  poll._('poll'),
  snapshot._('snapshot'),
  noLink._('-link'),
  noEmbed._('-embed'),
  noFile._('-file'),
  noImage._('-image'),
  noVideo._('-video'),
  noSound._('-sound'),
  noSticker._('-sticker'),
  noPoll._('-poll'),
  noSnapshot._('-snapshot');

  const HasOption._(this.value);

  /// Creates a HasOption from a json value.
  factory HasOption.fromJson(String json) {
    return HasOption.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException('Unknown HasOption value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static HasOption? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return HasOption.fromJson(json);
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
