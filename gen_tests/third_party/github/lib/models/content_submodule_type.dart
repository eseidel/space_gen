enum ContentSubmoduleType {
  submodule._('submodule');

  const ContentSubmoduleType._(this.value);

  /// Creates a ContentSubmoduleType from a json value.
  factory ContentSubmoduleType.fromJson(String json) {
    return ContentSubmoduleType.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown ContentSubmoduleType value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ContentSubmoduleType? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ContentSubmoduleType.fromJson(json);
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
