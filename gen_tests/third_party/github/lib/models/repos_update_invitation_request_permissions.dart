/// The permissions that the associated user will have on the repository. Valid
/// values are `read`, `write`, `maintain`, `triage`, and `admin`.
enum ReposUpdateInvitationRequestPermissions {
  read._('read'),
  write._('write'),
  maintain._('maintain'),
  triage._('triage'),
  admin._('admin');

  const ReposUpdateInvitationRequestPermissions._(this.value);

  /// Creates a ReposUpdateInvitationRequestPermissions from a json value.
  factory ReposUpdateInvitationRequestPermissions.fromJson(String json) {
    return ReposUpdateInvitationRequestPermissions.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown ReposUpdateInvitationRequestPermissions value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ReposUpdateInvitationRequestPermissions? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ReposUpdateInvitationRequestPermissions.fromJson(json);
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
