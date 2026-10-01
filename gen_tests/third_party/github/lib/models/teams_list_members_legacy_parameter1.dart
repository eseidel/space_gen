// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
enum TeamsListMembersLegacyParameter1 {
  member._('member'),
  maintainer._('maintainer'),
  all._('all');

  const TeamsListMembersLegacyParameter1._(this.value);

  /// Creates a TeamsListMembersLegacyParameter1 from a json value.
  factory TeamsListMembersLegacyParameter1.fromJson(String json) {
    return TeamsListMembersLegacyParameter1.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown TeamsListMembersLegacyParameter1 value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static TeamsListMembersLegacyParameter1? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return TeamsListMembersLegacyParameter1.fromJson(json);
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
