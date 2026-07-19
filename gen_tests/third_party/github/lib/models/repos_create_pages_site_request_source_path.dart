/// The repository directory that includes the source files for the Pages site.
/// Allowed paths are `/` or `/docs`. Default: `/`
enum ReposCreatePagesSiteRequestSourcePath {
  a._('/'),
  docs._('/docs');

  const ReposCreatePagesSiteRequestSourcePath._(this.value);

  /// Creates a ReposCreatePagesSiteRequestSourcePath from a json value.
  factory ReposCreatePagesSiteRequestSourcePath.fromJson(String json) {
    return ReposCreatePagesSiteRequestSourcePath.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown ReposCreatePagesSiteRequestSourcePath value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ReposCreatePagesSiteRequestSourcePath? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ReposCreatePagesSiteRequestSourcePath.fromJson(json);
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
