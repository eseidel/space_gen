/// Where the dependency is utilized. `development` means that the dependency is
/// only utilized in the development environment. `runtime` means that the
/// dependency is utilized at runtime and in the development environment.
enum DependencyGraphDiffInnerScope {
  unknown._('unknown'),
  runtime._('runtime'),
  development._('development');

  const DependencyGraphDiffInnerScope._(this.value);

  /// Creates a DependencyGraphDiffInnerScope from a json value.
  factory DependencyGraphDiffInnerScope.fromJson(String json) {
    return DependencyGraphDiffInnerScope.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown DependencyGraphDiffInnerScope value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static DependencyGraphDiffInnerScope? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return DependencyGraphDiffInnerScope.fromJson(json);
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
