/// A notation of whether the dependency is required for the primary build
/// artifact (runtime) or is only used for development. Future versions of this
/// specification may allow for more granular scopes.
/// Example: `'runtime'`
enum DependencyScope {
  runtime._('runtime'),
  development._('development');

  const DependencyScope._(this.value);

  /// Creates a DependencyScope from a json value.
  factory DependencyScope.fromJson(String json) {
    return DependencyScope.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown DependencyScope value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static DependencyScope? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return DependencyScope.fromJson(json);
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
