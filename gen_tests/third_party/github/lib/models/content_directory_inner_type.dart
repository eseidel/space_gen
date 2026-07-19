enum ContentDirectoryInnerType {
  dir._('dir'),
  file._('file'),
  submodule._('submodule'),
  symlink._('symlink');

  const ContentDirectoryInnerType._(this.value);

  /// Creates a ContentDirectoryInnerType from a json value.
  factory ContentDirectoryInnerType.fromJson(String json) {
    return ContentDirectoryInnerType.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown ContentDirectoryInnerType value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ContentDirectoryInnerType? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ContentDirectoryInnerType.fromJson(json);
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
