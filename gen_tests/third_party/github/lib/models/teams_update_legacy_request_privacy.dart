/// The level of privacy this team should have. Editing teams without specifying
/// this parameter leaves `privacy` intact. The options are:
/// **For a non-nested team:**
/// * `secret` - only visible to organization owners and members of this team.
///  * `closed` - visible to all members of this organization.
/// **For a parent or child team:**
///  * `closed` - visible to all members of this organization.
enum TeamsUpdateLegacyRequestPrivacy {
  secret._('secret'),
  closed._('closed');

  const TeamsUpdateLegacyRequestPrivacy._(this.value);

  /// Creates a TeamsUpdateLegacyRequestPrivacy from a json value.
  factory TeamsUpdateLegacyRequestPrivacy.fromJson(String json) {
    return TeamsUpdateLegacyRequestPrivacy.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown TeamsUpdateLegacyRequestPrivacy value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static TeamsUpdateLegacyRequestPrivacy? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return TeamsUpdateLegacyRequestPrivacy.fromJson(json);
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
