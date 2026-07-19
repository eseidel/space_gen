/// The type of identifier.
enum GlobalAdvisoryIdentifiersInnerType {
  cve._('CVE'),
  ghsa._('GHSA');

  const GlobalAdvisoryIdentifiersInnerType._(this.value);

  /// Creates a GlobalAdvisoryIdentifiersInnerType from a json value.
  factory GlobalAdvisoryIdentifiersInnerType.fromJson(String json) {
    return GlobalAdvisoryIdentifiersInnerType.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown GlobalAdvisoryIdentifiersInnerType value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static GlobalAdvisoryIdentifiersInnerType? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return GlobalAdvisoryIdentifiersInnerType.fromJson(json);
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
