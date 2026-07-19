/// The level of privacy this team should have. The options are:
/// **For a non-nested team:**
/// * `secret` - only visible to organization owners and members of this team.
///  * `closed` - visible to all members of this organization.
/// Default: `secret`
/// **For a parent or child team:**
///  * `closed` - visible to all members of this organization.
/// Default for child team: `closed`
enum TeamsCreateRequestPrivacy {
  secret._('secret'),
  closed._('closed');

  const TeamsCreateRequestPrivacy._(this.value);

  /// Creates a TeamsCreateRequestPrivacy from a json value.
  factory TeamsCreateRequestPrivacy.fromJson(String json) {
    return TeamsCreateRequestPrivacy.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown TeamsCreateRequestPrivacy value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static TeamsCreateRequestPrivacy? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return TeamsCreateRequestPrivacy.fromJson(json);
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
