/// The initally assigned location of a new codespace.
/// Example: `'WestUs2'`
enum CodespaceWithFullRepositoryLocation {
  eastUs._('EastUs'),
  southEastAsia._('SouthEastAsia'),
  westEurope._('WestEurope'),
  westUs2._('WestUs2');

  const CodespaceWithFullRepositoryLocation._(this.value);

  /// Creates a CodespaceWithFullRepositoryLocation from a json value.
  factory CodespaceWithFullRepositoryLocation.fromJson(String json) {
    return CodespaceWithFullRepositoryLocation.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown CodespaceWithFullRepositoryLocation value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static CodespaceWithFullRepositoryLocation? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return CodespaceWithFullRepositoryLocation.fromJson(json);
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
