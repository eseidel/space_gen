enum SearchableEmbedType {
  image._('image'),
  video._('video'),
  gifv._('gif'),
  sound._('sound'),
  article._('article');

  const SearchableEmbedType._(this.value);

  /// Creates a SearchableEmbedType from a json value.
  factory SearchableEmbedType.fromJson(String json) {
    return SearchableEmbedType.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown SearchableEmbedType value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static SearchableEmbedType? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return SearchableEmbedType.fromJson(json);
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
