enum ContentFileType {
  file._('file');

  const ContentFileType._(this.value);

  /// Creates a ContentFileType from a json value.
  factory ContentFileType.fromJson(String json) {
    return ContentFileType.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown ContentFileType value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ContentFileType? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ContentFileType.fromJson(json);
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
