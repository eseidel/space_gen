/// The execution scope of the vulnerable dependency.
enum DependabotAlertWithRepositoryDependencyScope {
  development._('development'),
  runtime._('runtime');

  const DependabotAlertWithRepositoryDependencyScope._(this.value);

  /// Creates a DependabotAlertWithRepositoryDependencyScope from a json value.
  factory DependabotAlertWithRepositoryDependencyScope.fromJson(String json) {
    return DependabotAlertWithRepositoryDependencyScope.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown DependabotAlertWithRepositoryDependencyScope value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static DependabotAlertWithRepositoryDependencyScope? maybeFromJson(
    String? json,
  ) {
    if (json == null) {
      return null;
    }
    return DependabotAlertWithRepositoryDependencyScope.fromJson(json);
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
