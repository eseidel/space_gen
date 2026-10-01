// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
/// The level of privacy this team should have. Editing teams without specifying
/// this parameter leaves `privacy` intact. When a team is nested, the `privacy`
/// for parent teams cannot be `secret`. The options are:
/// **For a non-nested team:**
/// * `secret` - only visible to organization owners and members of this team.
///  * `closed` - visible to all members of this organization.
/// **For a parent or child team:**
///  * `closed` - visible to all members of this organization.
enum TeamsUpdateInOrgRequestPrivacy {
  secret._('secret'),
  closed._('closed');

  const TeamsUpdateInOrgRequestPrivacy._(this.value);

  /// Creates a TeamsUpdateInOrgRequestPrivacy from a json value.
  factory TeamsUpdateInOrgRequestPrivacy.fromJson(String json) {
    return TeamsUpdateInOrgRequestPrivacy.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown TeamsUpdateInOrgRequestPrivacy value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static TeamsUpdateInOrgRequestPrivacy? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return TeamsUpdateInOrgRequestPrivacy.fromJson(json);
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
