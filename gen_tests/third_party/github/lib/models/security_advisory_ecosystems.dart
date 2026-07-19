/// The package's language or package management ecosystem.
enum SecurityAdvisoryEcosystems {
  rubygems._('rubygems'),
  npm._('npm'),
  pip._('pip'),
  maven._('maven'),
  nuget._('nuget'),
  composer._('composer'),
  go._('go'),
  rust._('rust'),
  erlang._('erlang'),
  actions._('actions'),
  pub._('pub'),
  other._('other'),
  swift._('swift');

  const SecurityAdvisoryEcosystems._(this.value);

  /// Creates a SecurityAdvisoryEcosystems from a json value.
  factory SecurityAdvisoryEcosystems.fromJson(String json) {
    return SecurityAdvisoryEcosystems.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown SecurityAdvisoryEcosystems value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static SecurityAdvisoryEcosystems? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return SecurityAdvisoryEcosystems.fromJson(json);
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
