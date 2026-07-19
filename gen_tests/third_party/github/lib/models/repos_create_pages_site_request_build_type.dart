/// The process in which the Page will be built. Possible values are `"legacy"`
/// and `"workflow"`.
enum ReposCreatePagesSiteRequestBuildType {
  legacy._('legacy'),
  workflow._('workflow');

  const ReposCreatePagesSiteRequestBuildType._(this.value);

  /// Creates a ReposCreatePagesSiteRequestBuildType from a json value.
  factory ReposCreatePagesSiteRequestBuildType.fromJson(String json) {
    return ReposCreatePagesSiteRequestBuildType.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown ReposCreatePagesSiteRequestBuildType value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ReposCreatePagesSiteRequestBuildType? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ReposCreatePagesSiteRequestBuildType.fromJson(json);
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
