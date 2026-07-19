/// The initally assigned location of a new codespace.
/// Example: `'WestUs2'`
enum CodespaceLocation {
  eastUs._('EastUs'),
  southEastAsia._('SouthEastAsia'),
  westEurope._('WestEurope'),
  westUs2._('WestUs2');

  const CodespaceLocation._(this.value);

  /// Creates a CodespaceLocation from a json value.
  factory CodespaceLocation.fromJson(String json) {
    return CodespaceLocation.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown CodespaceLocation value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static CodespaceLocation? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return CodespaceLocation.fromJson(json);
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
