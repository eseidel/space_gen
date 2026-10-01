// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
/// The system role from which this role inherits permissions.
enum OrganizationRoleBaseRole {
  read._('read'),
  triage._('triage'),
  write._('write'),
  maintain._('maintain'),
  admin._('admin');

  const OrganizationRoleBaseRole._(this.value);

  /// Creates a OrganizationRoleBaseRole from a json value.
  factory OrganizationRoleBaseRole.fromJson(String json) {
    return OrganizationRoleBaseRole.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown OrganizationRoleBaseRole value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static OrganizationRoleBaseRole? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return OrganizationRoleBaseRole.fromJson(json);
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
