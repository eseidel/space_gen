/// The process in which the Page will be built.
/// Example: `'legacy'`
enum PageBuildType {
  legacy._('legacy'),
  workflow._('workflow');

  const PageBuildType._(this.value);

  /// Creates a PageBuildType from a json value.
  factory PageBuildType.fromJson(String json) {
    return PageBuildType.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException('Unknown PageBuildType value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static PageBuildType? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return PageBuildType.fromJson(json);
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
