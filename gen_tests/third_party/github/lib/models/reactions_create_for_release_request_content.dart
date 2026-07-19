/// The [reaction
/// type](https://docs.github.com/rest/reactions/reactions#about-reactions) to
/// add to the release.
enum ReactionsCreateForReleaseRequestContent {
  plus1._('+1'),
  laugh._('laugh'),
  heart._('heart'),
  hooray._('hooray'),
  rocket._('rocket'),
  eyes._('eyes');

  const ReactionsCreateForReleaseRequestContent._(this.value);

  /// Creates a ReactionsCreateForReleaseRequestContent from a json value.
  factory ReactionsCreateForReleaseRequestContent.fromJson(String json) {
    return ReactionsCreateForReleaseRequestContent.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown ReactionsCreateForReleaseRequestContent value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ReactionsCreateForReleaseRequestContent? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ReactionsCreateForReleaseRequestContent.fromJson(json);
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
