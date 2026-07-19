/// The permission associated with the invitation.
/// Example: `'read'`
enum RepositoryInvitationPermissions {
  read._('read'),
  write._('write'),
  admin._('admin'),
  triage._('triage'),
  maintain._('maintain');

  const RepositoryInvitationPermissions._(this.value);

  /// Creates a RepositoryInvitationPermissions from a json value.
  factory RepositoryInvitationPermissions.fromJson(String json) {
    return RepositoryInvitationPermissions.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown RepositoryInvitationPermissions value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static RepositoryInvitationPermissions? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return RepositoryInvitationPermissions.fromJson(json);
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
