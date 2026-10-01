// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
/// The type of identifier.
enum RepositoryAdvisoryIdentifiersInnerType {
  cve._('CVE'),
  ghsa._('GHSA');

  const RepositoryAdvisoryIdentifiersInnerType._(this.value);

  /// Creates a RepositoryAdvisoryIdentifiersInnerType from a json value.
  factory RepositoryAdvisoryIdentifiersInnerType.fromJson(String json) {
    return RepositoryAdvisoryIdentifiersInnerType.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown RepositoryAdvisoryIdentifiersInnerType value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static RepositoryAdvisoryIdentifiersInnerType? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return RepositoryAdvisoryIdentifiersInnerType.fromJson(json);
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
